import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/common/utils/pota_marker_helper.dart';
import 'package:hamqrg/common/utils/repeater_mode_helper.dart';
import 'package:hamqrg/common/widgets/banner/info_banner.dart';
import 'package:hamqrg/common/widgets/mode_filter_chips_horizontal.dart';
import 'package:hamqrg/common/widgets/responsive/responsive_layout.dart';
import 'package:hamqrg/config/constants/map_keys.dart';
import 'package:hamqrg/config/constants/map_layers.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coordinate_parser.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point_error.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/coverage_result_panel.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/coverage_result_sheet.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/place_search_bar.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/map/controller/repeaters_map_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/map/controller/state/repeaters_map_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/reachable/widgets/reachable_map_button.dart';
import 'package:hamqrg/src/features/repeaters/presentation/utils/map_utils.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/permission_banner.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/cluster_repeaters_sheet.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/repeater_details_sheet/repeater_details_sheet.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/summary_chip.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Initial zoom level for the map
const double _initialZoom = 8;

/// Debounce delay for camera changes (milliseconds)
const int _cameraDebounceMs = 500;

/// Minimum zoom level (prevents zooming out beyond a region)
const double _minZoom = 6;

/// Zoom increment when clicking on a cluster
const double _clusterZoomIncrement = 1.5;

/// Maximum zoom level at which clustering is enabled.
/// Above this zoom level, all points are shown individually.
/// Lower value = less clustering (individual points shown earlier)
/// Higher value = more clustering (clusters persist longer when zooming)
///
/// Zoom level reference:
/// - 0-3: World/Continent view
/// - 4-6: Country view
/// - 7-9: Region/State view
/// - 10-12: City view
/// - 13-15: Neighborhood view
/// - 16-18: Street view
/// - 19+: Building view
const double _clusterMaxZoom = 5;

/// Zoom applicato quando l'utente sceglie una località dalla ricerca: abbastanza
/// stretto da vedere il territorio attorno al punto, abbastanza largo da
/// mostrare i ripetitori vicini.
const double _searchPointZoom = 10.5;

/// Raggio, in pixel, del cerchio che segna il punto di ricerca.
const double _searchPointRadius = 11;

/// Radius in pixels within which points are clustered together.
/// Smaller value = tighter clusters (more clusters visible)
/// Larger value = looser clusters (fewer, bigger clusters)
const double _clusterRadius = 50;

@RoutePage()
class RepeatersMapPage extends HookConsumerWidget {
  const RepeatersMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useState<MapboxMap?>(null);
    final cameraChangeTimer = useRef<Timer?>(null);
    final isStyleLoaded = useState<bool>(false);

    // Il pin del punto di ricerca è un'annotazione a cerchio e non un layer
    // GeoJSON come i ripetitori: non serve alcun asset immagine e resta
    // inconfondibile rispetto ai marker dei ripetitori e al puntino del GPS.
    final searchMarkerManager = useState<CircleAnnotationManager?>(null);
    final searchMarker = useRef<CircleAnnotation?>(null);

    final asyncState = ref.watch(repeatersMapControllerProvider);
    final notifier = ref.read(repeatersMapControllerProvider.notifier);
    final mapState = asyncState.value;

    final searchPoint = mapState?.searchPoint;
    final searchMarkerColor = Theme.of(context).colorScheme.primary.toARGB32();
    final searchMarkerStroke = Theme.of(context).colorScheme.surface.toARGB32();

    // I filtri di modo, azionabili sia dai chip in cima alla mappa sia da
    // dentro il foglio del risultato: una sola sorgente di verità, così la
    // lente resta la stessa ovunque la si tocchi.
    Future<void> toggleCoverageMode(AccessMode mode) async {
      final map = mapController.value;
      if (map == null) return;
      final bounds = await _getVisibleBounds(map);
      await notifier.toggleModeFilter(
        lat1: bounds.lat1,
        lon1: bounds.lon1,
        lat2: bounds.lat2,
        lon2: bounds.lon2,
        mode: mode,
      );
    }

    Future<void> clearCoverageModes() async {
      final map = mapController.value;
      if (map == null) return;
      final bounds = await _getVisibleBounds(map);
      await notifier.clearAllModes(
        lat1: bounds.lat1,
        lon1: bounds.lon1,
        lat2: bounds.lat2,
        lon2: bounds.lon2,
      );
    }

    // Apre il foglio del risultato per il punto attualmente scelto.
    //
    // È una sola funzione perché ci sono due strade per arrivarci — scegliere
    // un punto, oppure toccare "cosa raggiungo" con un punto già attivo — e
    // devono mostrare la stessa cosa.
    void openCoverageSheet() {
      unawaited(
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (_) => Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(repeatersMapControllerProvider).value;
              final point = state?.searchPoint;
              if (point == null) return const SizedBox.shrink();
              return CoverageResultSheet(
                point: point,
                breadth: state!.searchBreadth,
                selectedModes: state.selectedModes,
                onBreadthChanged: (breadth) =>
                    unawaited(notifier.setBreadth(breadth)),
                onModeToggled: (mode) => unawaited(toggleCoverageMode(mode)),
                onAllModes: () => unawaited(clearCoverageModes()),
              );
            },
          ),
        ),
      );
    }

    // Il foglio si apre a ogni nuovo punto. È keyed sul solo punto, così un
    // cambio di ampiezza dall'interno non lo richiude e riapre: il contenuto si
    // aggiorna da solo perché il Consumer qui dentro osserva il controller.
    useEffect(
      () {
        if (searchPoint == null) return null;
        // Su tablet il risultato vive nel pannello affiancato: aprire anche il
        // foglio lo coprirebbe, che è esattamente ciò che il layout evita.
        if (MediaQuery.sizeOf(context).width >= kTabletBreakpoint) return null;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;
          openCoverageSheet();
        });
        return null;
      },
      [searchPoint],
    );

    // Un solo pin per volta (FR-007): la selezione successiva rimpiazza la
    // precedente invece di affiancarla.
    useEffect(
      () {
        final manager = searchMarkerManager.value;
        if (manager == null) return null;
        unawaited(
          _syncSearchMarker(
            manager: manager,
            existing: searchMarker,
            point: searchPoint,
            fillColor: searchMarkerColor,
            strokeColor: searchMarkerStroke,
          ),
        );
        return null;
      },
      [searchPoint, searchMarkerManager.value],
    );

    if (asyncState.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    final data = asyncState.value;
    if (data == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    // Build the initial viewport ONCE. Mapbox re-applies (and thus resets) the
    // camera whenever a *new* viewport instance is passed on rebuild. Since the
    // page rebuilds on every state change (e.g. after loading repeaters for the
    // visible bounds), recreating the viewport inline would snap the camera back
    // to its initial position right after a pinch-zoom. Memoizing on the initial
    // coordinates keeps the same instance across rebuilds.
    final initialViewport = useMemoized(
      () => CameraViewportState(
        center: Point(
          coordinates: Position(data.longitude!, data.latitude!),
        ),
        zoom: _initialZoom,
        bearing: 0,
        pitch: 0,
      ),
      [data.latitude, data.longitude],
    );

    // Update GeoJSON source when repeaters change
    useEffect(
      () {
        if (mapController.value != null && isStyleLoaded.value) {
          _updateGeoJsonSource(mapController.value!, mapState!.repeaters);
        }
        return null;
      },
      [mapState?.repeaters, isStyleLoaded.value],
    );

    // Update POTA GeoJSON source when POTA spots change
    useEffect(
      () {
        if (mapController.value != null && isStyleLoaded.value) {
          _updatePotaGeoJsonSource(
            mapController.value!,
            mapState?.potaSpots ?? [],
            mapState?.potaParkCache ?? {},
          );
        }
        return null;
      },
      [
        mapState?.potaSpots,
        mapState?.potaParkCache,
        isStyleLoaded.value,
      ],
    );

    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            viewport: initialViewport,
            styleUri: MapboxStyles.OUTDOORS,
            onCameraChangeListener: (cameraState) {
              _handleCameraChange(
                ref,
                mapController.value,
                cameraChangeTimer,
              );
            },
            onMapCreated: (mapboxMap) async {
              mapController.value = mapboxMap;
              mapboxMap
                ..addInteraction(
                  TapInteraction.onMap((gestureContext) async {
                    await _handleMapTap(
                      mapboxMap,
                      gestureContext,
                      ref,
                      context,
                    );
                  }),
                )
                // Pressione prolungata: sceglie un punto qualsiasi senza
                // passare dalla barra di ricerca (FR-005).
                ..addInteraction(
                  LongTapInteraction.onMap((gestureContext) async {
                    final coordinates = gestureContext.point.coordinates;
                    await notifier.selectPoint(
                      SearchPoint(
                        latitude: coordinates.lat.toDouble(),
                        longitude: coordinates.lng.toDouble(),
                        label: formatCoordinates(
                          coordinates.lat.toDouble(),
                          coordinates.lng.toDouble(),
                        ),
                        origin: SearchPointOrigin.mapLongPress,
                      ),
                    );
                  }),
                );
              await _initializeMap(
                mapboxMap,
                ref,
                context,
                data.latitude != null && data.longitude != null,
              );
              // Dopo _initializeMap, così da non introdurre un salto asincrono
              // prima dell'uso del BuildContext qui sopra.
              searchMarkerManager.value =
                  await mapboxMap.annotations.createCircleAnnotationManager();
            },
            onStyleLoadedListener: (styleLoaded) async {
              if (mapController.value != null) {
                await _onStyleLoaded(mapController.value!, context, ref);
                isStyleLoaded.value = true;
              }
            },
          ),

          // Overlays (header, banners, chips, buttons)
          _buildOverlays(
            context,
            ref,
            asyncState,
            mapState,
            notifier,
            mapController.value,
          ),

          // Su tablet il risultato si affianca alla mappa (FR-059).
          if (searchPoint != null)
            ResponsiveLayout(
              mobile: (context) => const SizedBox.shrink(),
              tablet: (context) => Align(
                alignment: Alignment.centerRight,
                child: CoverageResultPanel(
                  point: searchPoint,
                  breadth: mapState?.searchBreadth ?? SearchBreadth.quick,
                  selectedModes: mapState?.selectedModes ?? const {},
                  onBreadthChanged: (breadth) =>
                      unawaited(notifier.setBreadth(breadth)),
                  onClose: notifier.clearPoint,
                  onModeToggled: (mode) => unawaited(toggleCoverageMode(mode)),
                  onAllModes: () => unawaited(clearCoverageModes()),
                ),
              ),
            ),

          // Pro upsell: compact "what do I reach from here?" button
          // (bottom-left, level with the location button on the right).
          Positioned(
            left: 16,
            bottom: MediaQuery.of(context).padding.bottom + 24,
            child: ReachableMapButton(
              // Con un pin attivo la domanda è "cosa raggiungo da LÌ": usare
              // comunque il GPS mostrerebbe la risposta a una domanda che
              // l'utente non ha posto.
              onOpenForSearchPoint:
                  searchPoint == null ? null : openCoverageSheet,
            ),
          ),

          // Accesso alle postazioni salvate: raggiungibile con una sola mano
          // sul lato del pollice (FR-063).
          Positioned(
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 92,
            child: FloatingActionButton.small(
              heroTag: 'saved-stations',
              tooltip: context.localization.stationsTitle,
              onPressed: () => context.router.push(const SavedStationsRoute()),
              child: const Icon(Icons.bookmark_outline_rounded),
            ),
          ),
        ],
      ),
    );
  }

  /// Allinea il cerchio del punto di ricerca allo stato: lo crea, lo sposta o
  /// lo rimuove. Non lancia mai — se l'annotazione fallisce, la mappa resta
  /// usabile e il risultato continua a essere mostrato nel foglio.
  static Future<void> _syncSearchMarker({
    required CircleAnnotationManager manager,
    required ObjectRef<CircleAnnotation?> existing,
    required SearchPoint? point,
    required int fillColor,
    required int strokeColor,
  }) async {
    try {
      final previous = existing.value;
      if (previous != null) {
        await manager.delete(previous);
        existing.value = null;
      }
      if (point == null) return;

      existing.value = await manager.create(
        CircleAnnotationOptions(
          geometry: Point(
            coordinates: Position(point.longitude, point.latitude),
          ),
          circleRadius: _searchPointRadius,
          circleColor: fillColor,
          circleStrokeWidth: 3,
          circleStrokeColor: strokeColor,
        ),
      );
    } catch (_) {
      // Il pin è un aiuto visivo: la sua assenza non deve rompere la pagina.
    }
  }

  /// Handle camera changes with debounce
  void _handleCameraChange(
    WidgetRef ref,
    MapboxMap? map,
    ObjectRef<Timer?> timerRef,
  ) {
    if (map == null) return;

    timerRef.value?.cancel();
    timerRef.value = Timer(
      const Duration(milliseconds: _cameraDebounceMs),
      () async {
        try {
          await _loadRepeatersForVisibleBounds(ref, map);
        } catch (e) {
          // Ignore errors during camera movement
        }
      },
    );
  }

  /// Initialize map settings
  Future<void> _initializeMap(
    MapboxMap mapboxMap,
    WidgetRef ref,
    BuildContext context,
    bool hasUserLocation,
  ) async {
    // Configure map settings
    await Future.wait([
      mapboxMap.scaleBar.updateSettings(ScaleBarSettings(enabled: false)),
      mapboxMap.compass.updateSettings(CompassSettings(enabled: false)),
      mapboxMap.gestures.updateSettings(
        GesturesSettings(pitchEnabled: false, rotateEnabled: false),
      ),
      mapboxMap.location.updateSettings(
        LocationComponentSettings(
          enabled: true,
          pulsingEnabled: true,
          showAccuracyRing: true,
          puckBearingEnabled: true,
          puckBearing: PuckBearing.HEADING,
        ),
      ),
      mapboxMap.setBounds(CameraBoundsOptions(minZoom: _minZoom)),
    ]);

    // If we have user location, center map on it
    if (hasUserLocation) {
      final mapState = ref.read(repeatersMapControllerProvider).value;
      if (mapState?.latitude != null && mapState?.longitude != null) {
        await moveCameraToLocation(
          mapboxMap,
          mapState!.latitude!,
          mapState.longitude!,
          zoom: 10,
        );
        await Future.delayed(const Duration(milliseconds: 800));
      }
    }

    // Load repeaters for visible bounds
    await _loadRepeatersForVisibleBounds(ref, mapboxMap);
  }

  /// Called when the map style is fully loaded
  Future<void> _onStyleLoaded(
    MapboxMap mapboxMap,
    BuildContext context,
    WidgetRef ref,
  ) async {
    await Future.wait([
      _addMarkerImages(mapboxMap),
      _addStyleLayers(mapboxMap),
      _addPotaLogoImage(mapboxMap),
      _addPotaStyleLayer(mapboxMap),
    ]);

    // Update source with current repeaters
    final mapState = ref.read(repeatersMapControllerProvider).value;
    if (mapState != null) {
      await _updateGeoJsonSource(mapboxMap, mapState.repeaters);
      await _updatePotaGeoJsonSource(
        mapboxMap,
        mapState.potaSpots,
        mapState.potaParkCache,
      );
    }
  }

  /// Add marker images to the map style.
  /// This is now a no-op since images are generated dynamically.
  Future<void> _addMarkerImages(MapboxMap mapboxMap) async {
    // Images are now generated dynamically based on access modes
    // in _addMarkerImagesForRepeaters
  }

  /// Add marker images for a list of repeaters based on their access modes
  Future<void> _addMarkerImagesForRepeaters(
    MapboxMap mapboxMap,
    List<Repeater> repeaters,
  ) async {
    try {
      // Collect unique access mode combinations
      final accessModeKeys = <String, List<AccessMode>>{};
      for (final repeater in repeaters) {
        final modes = repeater.accesses.map((a) => a.mode).toList();
        final key = RepeaterModeHelper.getAccessModesKey(modes);
        accessModeKeys.putIfAbsent(key, () => modes);
      }

      // Generate and add images for each unique combination
      for (final entry in accessModeKeys.entries) {
        final imageId = 'marker-${entry.key}';
        final exists = await mapboxMap.style.hasStyleImage(imageId);
        if (exists) continue;

        final iconBytes =
            await RepeaterModeHelper.generateRepeaterIconWithAccessModes(
          entry.value,
        );

        final buffer = await ui.ImmutableBuffer.fromUint8List(iconBytes);
        final descriptor = await ui.ImageDescriptor.encoded(buffer);

        await mapboxMap.style.addStyleImage(
          imageId,
          1,
          MbxImage(
            width: descriptor.width,
            height: descriptor.height,
            data: iconBytes,
          ),
          false,
          [],
          [],
          null,
        );
      }
    } catch (e) {
      log('Error adding marker images: $e');
    }
  }

  /// Add style layers for clusters and points
  Future<void> _addStyleLayers(MapboxMap mapboxMap) async {
    try {
      // Check if layers already exist
      final clusterExists = await mapboxMap.style.styleLayerExists(
        MapKeys.clusterLayer,
      );

      if (!clusterExists) {
        await Future.wait([
          // Native Mapbox clusters
          _addLayerFromAsset(mapboxMap, MapLayers.clusterLayer),
          _addLayerFromAsset(mapboxMap, MapLayers.clusterCountLayer),
          // Synthetic same-location clusters
          _addLayerFromAsset(mapboxMap, MapLayers.sameLocationClusterLayer),
          _addLayerFromAsset(
            mapboxMap,
            MapLayers.sameLocationClusterCountLayer,
          ),
          // Individual points
          _addLayerFromAsset(mapboxMap, MapLayers.unclusteredPointLayer),
        ]);
      }
    } catch (e) {
      log('Error adding style layers: $e');
    }
  }

  /// Load and add a style layer from asset
  Future<void> _addLayerFromAsset(MapboxMap mapboxMap, String assetPath) async {
    try {
      final layerJson = await rootBundle.loadString(assetPath);
      await mapboxMap.style.addStyleLayer(layerJson, null);
    } catch (e) {
      log('Error adding layer from $assetPath: $e');
    }
  }

  /// Update or create the GeoJSON source with repeaters
  Future<void> _updateGeoJsonSource(
    MapboxMap mapboxMap,
    List<Repeater> repeaters,
  ) async {
    try {
      // Generate marker images for unique access mode combinations
      await _addMarkerImagesForRepeaters(mapboxMap, repeaters);

      final geoJson = _repeatersToGeoJson(repeaters);

      final sourceExists = await mapboxMap.style.styleSourceExists(
        MapKeys.repeatersSource,
      );

      if (!sourceExists) {
        await mapboxMap.style.addSource(
          GeoJsonSource(
            id: MapKeys.repeatersSource,
            cluster: true,
            clusterRadius: _clusterRadius,
            clusterMaxZoom: _clusterMaxZoom,
            data: geoJson,
          ),
        );
      } else {
        final source = await mapboxMap.style.getSource(MapKeys.repeatersSource)
            as GeoJsonSource?;
        if (source != null) {
          await source.updateGeoJSON(geoJson);
        }
      }
    } catch (e) {
      log('Error updating GeoJSON source: $e');
    }
  }

  /// Convert repeaters to GeoJSON format.
  /// Groups repeaters at identical coordinates into synthetic clusters.
  String _repeatersToGeoJson(List<Repeater> repeaters) {
    final validRepeaters =
        repeaters.where((r) => r.latitude != null && r.longitude != null);

    // Group repeaters by exact coordinates
    final groupedByCoords = <String, List<Repeater>>{};
    for (final repeater in validRepeaters) {
      final key = '${repeater.latitude}_${repeater.longitude}';
      groupedByCoords.putIfAbsent(key, () => []).add(repeater);
    }

    final features = <Map<String, dynamic>>[];

    for (final entry in groupedByCoords.entries) {
      final repeatersAtLocation = entry.value;
      final first = repeatersAtLocation.first;

      if (repeatersAtLocation.length == 1) {
        // Generate marker key based on access modes
        final accessModes = first.accesses.map((a) => a.mode).toList();
        final markerKey =
            'marker-${RepeaterModeHelper.getAccessModesKey(accessModes)}';

        // Use callsign as label, fallback to name
        final label = first.callsign ?? first.name ?? '';

        // Single repeater - normal feature
        features.add({
          'type': 'Feature',
          'geometry': {
            'type': 'Point',
            'coordinates': [first.longitude, first.latitude],
          },
          'properties': {
            'id': first.id,
            'callsign': first.callsign,
            'locality': first.locality,
            'frequencyHz': first.frequencyHz,
            'latitude': first.latitude,
            'longitude': first.longitude,
            'marker_key': markerKey,
            'label': label,
          },
        });
      } else {
        // Multiple repeaters at same location - create synthetic cluster
        features.add({
          'type': 'Feature',
          'geometry': {
            'type': 'Point',
            'coordinates': [first.longitude, first.latitude],
          },
          'properties': {
            // These properties make Mapbox render it as a cluster
            'point_count': repeatersAtLocation.length,
            'point_count_abbreviated': repeatersAtLocation.length.toString(),
            // Custom properties for tap handling
            'is_same_location_cluster': true,
            'cluster_repeater_ids':
                repeatersAtLocation.map((r) => r.id).toList(),
            'latitude': first.latitude,
            'longitude': first.longitude,
          },
        });
      }
    }

    return jsonEncode({
      'type': 'FeatureCollection',
      'features': features,
    });
  }

  /// Add POTA logo as a Mapbox style image
  Future<void> _addPotaLogoImage(MapboxMap mapboxMap) async {
    await PotaMarkerHelper.addPotaStyleImage(mapboxMap);
  }

  /// Add POTA style layer from asset
  Future<void> _addPotaStyleLayer(MapboxMap mapboxMap) async {
    try {
      final layerExists = await mapboxMap.style.styleLayerExists(
        MapKeys.potaLayer,
      );
      if (!layerExists) {
        await _addLayerFromAsset(mapboxMap, MapLayers.potaLayer);
      }
    } catch (e) {
      log('Error adding POTA style layer: $e');
    }
  }

  /// Update or create the POTA GeoJSON source
  Future<void> _updatePotaGeoJsonSource(
    MapboxMap mapboxMap,
    List<PotaSpot> spots,
    Map<String, PotaPark> parkCache,
  ) async {
    try {
      final geoJson = _potaSpotsToGeoJson(spots, parkCache);

      final sourceExists = await mapboxMap.style.styleSourceExists(
        MapKeys.potaSource,
      );

      if (!sourceExists) {
        await mapboxMap.style.addSource(
          GeoJsonSource(
            id: MapKeys.potaSource,
            data: geoJson,
          ),
        );
      } else {
        final source = await mapboxMap.style.getSource(MapKeys.potaSource)
            as GeoJsonSource?;
        if (source != null) {
          await source.updateGeoJSON(geoJson);
        }
      }
    } catch (e) {
      log('Error updating POTA GeoJSON source: $e');
    }
  }

  /// Convert POTA spots to GeoJSON using park coordinates
  String _potaSpotsToGeoJson(
    List<PotaSpot> spots,
    Map<String, PotaPark> parkCache,
  ) {
    final features = <Map<String, dynamic>>[];

    for (final spot in spots) {
      final park = parkCache[spot.reference];
      if (park == null || park.latitude == null || park.longitude == null) {
        continue;
      }

      features.add({
        'type': 'Feature',
        'geometry': {
          'type': 'Point',
          'coordinates': [park.longitude, park.latitude],
        },
        'properties': {
          'spotId': spot.spotId,
          'activator': spot.activator,
          'frequency': spot.frequency,
          'mode': spot.mode,
          'reference': spot.reference,
          'name': spot.name,
          'is_pota': true,
        },
      });
    }

    return jsonEncode({
      'type': 'FeatureCollection',
      'features': features,
    });
  }

  /// Handle tap on the map
  Future<void> _handleMapTap(
    MapboxMap mapboxMap,
    MapContentGestureContext gestureContext,
    WidgetRef ref,
    BuildContext context,
  ) async {
    if (!context.mounted) return;

    try {
      final screenCoordinate = await mapboxMap.pixelForCoordinate(
        gestureContext.point,
      );

      if (!context.mounted) return;

      // First check for POTA spot tap
      final potaHandled = await _handlePotaTap(
        mapboxMap,
        screenCoordinate,
        context,
      );
      if (potaHandled) return;

      if (!context.mounted) return;

      // Then check for cluster tap
      final clusterHandled = await _handleClusterTap(
        mapboxMap,
        screenCoordinate,
        ref,
        context,
      );
      if (clusterHandled) return;

      if (!context.mounted) return;

      // Then check for single point tap
      await _handlePointTap(mapboxMap, screenCoordinate, ref, context);
    } catch (e) {
      log('Error handling map tap: $e');
    }
  }

  /// Handle tap on a cluster (native Mapbox cluster or synthetic same-location cluster)
  Future<bool> _handleClusterTap(
    MapboxMap mapboxMap,
    ScreenCoordinate screenCoordinate,
    WidgetRef ref,
    BuildContext context,
  ) async {
    try {
      // First check for synthetic same-location clusters
      final sameLocationFeatures = await mapboxMap.queryRenderedFeatures(
        RenderedQueryGeometry.fromScreenCoordinate(screenCoordinate),
        RenderedQueryOptions(layerIds: [MapKeys.sameLocationClusterLayer]),
      );

      if (sameLocationFeatures.isNotEmpty) {
        final feature = sameLocationFeatures.first;
        if (feature != null) {
          final featureMap =
              feature.queriedFeature.feature as Map<dynamic, dynamic>;
          final properties = featureMap['properties'] as Map<dynamic, dynamic>?;
          final clusterIds =
              properties?['cluster_repeater_ids'] as List<dynamic>?;

          if (clusterIds != null && clusterIds.isNotEmpty) {
            final repeaters = _extractRepeatersFromIds(
              clusterIds.cast<String>(),
              ref,
            );
            if (repeaters.isNotEmpty && context.mounted) {
              showClusterRepeatersSheet(context, repeaters);
            }
          }
          return true;
        }
      }

      // Then check for native Mapbox clusters
      final features = await mapboxMap.queryRenderedFeatures(
        RenderedQueryGeometry.fromScreenCoordinate(screenCoordinate),
        RenderedQueryOptions(layerIds: [MapKeys.clusterLayer]),
      );

      if (features.isEmpty) return false;

      final feature = features.first;
      if (feature == null) return false;

      final featureMap =
          feature.queriedFeature.feature as Map<dynamic, dynamic>;

      // Native Mapbox cluster - use getGeoJsonClusterLeaves
      final clusterLeaves = await mapboxMap.getGeoJsonClusterLeaves(
        feature.queriedFeature.source,
        feature.queriedFeature.feature,
        null,
        null,
      );

      final leaves = clusterLeaves.featureCollection ?? [];

      // Check if all points are at the same coordinates
      final uniqueCoordinates = <String>{};
      for (final leaf in leaves) {
        if (leaf != null) {
          final geometry = leaf['geometry'] as Map<dynamic, dynamic>?;
          if (geometry != null) {
            final coords = geometry['coordinates'] as List<dynamic>?;
            if (coords != null && coords.length >= 2) {
              uniqueCoordinates.add('${coords[0]}_${coords[1]}');
            }
          }
        }
      }

      if (uniqueCoordinates.length == 1 && leaves.isNotEmpty) {
        // All repeaters at same location - show list
        final repeaters = _extractRepeatersFromLeaves(leaves, ref);
        if (repeaters.isNotEmpty && context.mounted) {
          showClusterRepeatersSheet(context, repeaters);
        }
        return true;
      } else {
        // Different locations - zoom in
        final cameraState = await mapboxMap.getCameraState();
        final geometry = featureMap['geometry'] as Map<dynamic, dynamic>?;
        if (geometry != null) {
          final coords = geometry['coordinates'] as List<dynamic>?;
          if (coords != null && coords.length >= 2) {
            await mapboxMap.flyTo(
              CameraOptions(
                center: Point(
                  coordinates: Position(
                    (coords[0] as num).toDouble(),
                    (coords[1] as num).toDouble(),
                  ),
                ),
                zoom: cameraState.zoom + _clusterZoomIncrement,
              ),
              MapAnimationOptions(duration: 300),
            );
          }
        }
        return true;
      }
    } catch (e) {
      log('Error handling cluster tap: $e');
      return false;
    }
  }

  /// Extract repeaters from a list of IDs
  List<Repeater> _extractRepeatersFromIds(
    List<String> ids,
    WidgetRef ref,
  ) {
    final currentState = ref.read(repeatersMapControllerProvider).value;
    if (currentState == null) return [];

    return currentState.repeaters.where((r) => ids.contains(r.id)).toList();
  }

  /// Extract repeaters from cluster leaves
  List<Repeater> _extractRepeatersFromLeaves(
    List<Map<dynamic, dynamic>?> leaves,
    WidgetRef ref,
  ) {
    final currentState = ref.read(repeatersMapControllerProvider).value;
    if (currentState == null) return [];

    final repeaterIds = <String>[];
    for (final leaf in leaves) {
      if (leaf != null) {
        final properties = leaf['properties'] as Map<dynamic, dynamic>?;
        if (properties != null) {
          final id = properties['id'] as String?;
          if (id != null) {
            repeaterIds.add(id);
          }
        }
      }
    }

    return currentState.repeaters
        .where((r) => repeaterIds.contains(r.id))
        .toList();
  }

  /// Handle tap on a single point
  Future<void> _handlePointTap(
    MapboxMap mapboxMap,
    ScreenCoordinate screenCoordinate,
    WidgetRef ref,
    BuildContext context,
  ) async {
    try {
      final features = await mapboxMap.queryRenderedFeatures(
        RenderedQueryGeometry.fromScreenCoordinate(screenCoordinate),
        RenderedQueryOptions(layerIds: [MapKeys.unclusteredPointLayer]),
      );

      if (features.isEmpty) return;

      final feature = features.first;
      if (feature == null) return;

      final featureMap =
          feature.queriedFeature.feature as Map<dynamic, dynamic>;
      final properties = featureMap['properties'] as Map<dynamic, dynamic>?;
      if (properties == null) return;

      final repeaterId = properties['id'] as String?;
      if (repeaterId == null) return;

      final currentState = ref.read(repeatersMapControllerProvider).value;
      if (currentState == null) return;

      // Center on the point
      final geometry = featureMap['geometry'] as Map<dynamic, dynamic>?;
      if (geometry != null) {
        final coords = geometry['coordinates'] as List<dynamic>?;
        if (coords != null && coords.length >= 2) {
          await mapboxMap.flyTo(
            CameraOptions(
              center: Point(
                coordinates: Position(
                  (coords[0] as num).toDouble(),
                  (coords[1] as num).toDouble(),
                ),
              ),
            ),
            MapAnimationOptions(duration: 200),
          );
        }
      }

      if (context.mounted) {
        await showRepeaterDetailsSheet(context, repeaterId);
      }
    } catch (e) {
      log('Error handling point tap: $e');
    }
  }

  /// Handle tap on a POTA spot marker
  Future<bool> _handlePotaTap(
    MapboxMap mapboxMap,
    ScreenCoordinate screenCoordinate,
    BuildContext context,
  ) async {
    try {
      final features = await mapboxMap.queryRenderedFeatures(
        RenderedQueryGeometry.fromScreenCoordinate(screenCoordinate),
        RenderedQueryOptions(layerIds: [MapKeys.potaLayer]),
      );

      if (features.isEmpty) return false;

      final feature = features.first;
      if (feature == null) return false;

      final featureMap =
          feature.queriedFeature.feature as Map<dynamic, dynamic>;
      final properties = featureMap['properties'] as Map<dynamic, dynamic>?;
      if (properties == null) return false;

      final spotId = properties['spotId'] as int?;
      final reference = properties['reference'] as String?;
      if (spotId == null || reference == null) return false;

      // Center on the point
      final geometry = featureMap['geometry'] as Map<dynamic, dynamic>?;
      if (geometry != null) {
        final coords = geometry['coordinates'] as List<dynamic>?;
        if (coords != null && coords.length >= 2) {
          await mapboxMap.flyTo(
            CameraOptions(
              center: Point(
                coordinates: Position(
                  (coords[0] as num).toDouble(),
                  (coords[1] as num).toDouble(),
                ),
              ),
            ),
            MapAnimationOptions(duration: 200),
          );
        }
      }

      if (context.mounted) {
        await context.router.push(
          PotaSpotDetailRoute(spotId: spotId, reference: reference),
        );
      }
      return true;
    } catch (e) {
      log('Error handling POTA tap: $e');
      return false;
    }
  }

  /// Load repeaters based on visible map bounds
  Future<void> _loadRepeatersForVisibleBounds(
    WidgetRef ref,
    MapboxMap map,
  ) async {
    try {
      final bounds = await _getVisibleBounds(map);
      final controller = ref.read(repeatersMapControllerProvider.notifier);
      await controller.loadRepeatersFromBounds(
        lat1: bounds.lat1,
        lon1: bounds.lon1,
        lat2: bounds.lat2,
        lon2: bounds.lon2,
      );
    } catch (e) {
      // Ignore errors
    }
  }

  /// Build overlay widgets (header, banners, chips, buttons)
  Widget _buildOverlays(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<RepeatersMapState> asyncState,
    RepeatersMapState? mapState,
    RepeatersMapController notifier,
    MapboxMap? mapController,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final bottomPadding = MediaQuery.of(context).padding.bottom + 24;

    return Stack(
      children: [
        // Top overlay: frosted header with filters + info
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Barra di ricerca del punto: disponibile a tutti gli utenti
                // (FR-011). Il gate Pro scatta sul responso, non sulla ricerca.
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  child: PlaceSearchBar(
                    onSelected: (point) async {
                      await notifier.selectPoint(point);
                      await mapController?.flyTo(
                        CameraOptions(
                          center: Point(
                            coordinates:
                                Position(point.longitude, point.latitude),
                          ),
                          zoom: _searchPointZoom,
                        ),
                        MapAnimationOptions(duration: 900),
                      );
                    },
                    onError: notifier.reportPointError,
                  ),
                ),
                if (mapState?.pointError != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: _SearchPointErrorBanner(
                      error: mapState!.pointError!,
                      onDismiss: notifier.clearPointError,
                    ),
                  ),
                if (mapState?.searchPoint != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: _SelectedPointChip(
                      point: mapState!.searchPoint!,
                      onClear: notifier.clearPoint,
                    ),
                  ),
                // Filter chips
                ModeFilterChipsHorizontal(
                  allLabel: context.localization.repeaterModeAllmode,
                  selectedModes: mapState?.selectedModes ?? {},
                  onModeToggled: (mode) async {
                    if (mapController != null) {
                      final visibleBounds =
                          await _getVisibleBounds(mapController);
                      await notifier.toggleModeFilter(
                        lat1: visibleBounds.lat1,
                        lon1: visibleBounds.lon1,
                        lat2: visibleBounds.lat2,
                        lon2: visibleBounds.lon2,
                        mode: mode,
                      );
                    }
                  },
                  onAllSelected: () async {
                    if (mapController != null) {
                      final visibleBounds =
                          await _getVisibleBounds(mapController);
                      await notifier.clearAllModes(
                        lat1: visibleBounds.lat1,
                        lon1: visibleBounds.lon1,
                        lat2: visibleBounds.lat2,
                        lon2: visibleBounds.lon2,
                      );
                    }
                  },
                ),
                const SizedBox(height: 8),
                // Banner / Summary (below filter chips). Offline first: senza
                // rete il "load error" è atteso e il messaggio giusto è che si
                // stanno consultando i dati salvati.
                if (ref.watch(offlineStatusProvider).value ?? false)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InfoBanner(
                      icon: const Icon(Icons.cloud_off_outlined),
                      label: context.localization.offlineBannerMessage,
                    ),
                  )
                else if (mapState?.locationError != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PermissionBanner(
                      errorType: mapState!.locationError!,
                      onRetry: () async {
                        ref.invalidate(repeatersMapControllerProvider);
                      },
                    ),
                  )
                else if (mapState?.hasLoadError ?? false)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InfoBanner(
                      icon: const Icon(Icons.warning_amber_rounded),
                      label: context.localization.repeatersMapGenericError,
                      trailing: TextButton(
                        onPressed: () async {
                          if (mapController != null) {
                            await _loadRepeatersForVisibleBounds(
                              ref,
                              mapController,
                            );
                          }
                        },
                        child: Text(context.localization.repeatersMapRetry),
                      ),
                    ),
                  )
                else if (!asyncState.isLoading &&
                    mapState?.locationError == null &&
                    (mapState?.repeaters.isEmpty ?? false))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InfoBanner(
                      icon: const Icon(Icons.location_off_outlined),
                      label: context.localization.repeatersMapEmpty,
                    ),
                  )
                else if (mapState?.repeaters.isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SummaryChip(
                      count: mapState!.repeaters.length,
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        // Bottom buttons
        Positioned(
          left: 16,
          right: 16,
          bottom: bottomPadding,
          child: Row(
            children: [
              const Spacer(),
              // My location
              if (mapController != null &&
                  mapState?.latitude != null &&
                  mapState?.longitude != null &&
                  mapState?.locationError == null)
                _MapCircleButton(
                  onTap: () async {
                    final position = await notifier.refreshUserPosition();
                    await mapController.flyTo(
                      CameraOptions(
                        center: Point(
                          coordinates: Position(
                            position.longitude,
                            position.latitude,
                          ),
                        ),
                        zoom: 10,
                      ),
                      MapAnimationOptions(duration: 1000),
                    );
                  },
                  child: Icon(
                    Icons.my_location,
                    color: colorScheme.primary,
                    size: 22,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MapCircleButton extends StatelessWidget {
  const _MapCircleButton({
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.12),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}

Future<({double lat1, double lon1, double lat2, double lon2})>
    _getVisibleBounds(
  MapboxMap map,
) async {
  final bounds = await map.coordinateBoundsForCamera(
    CameraOptions(
      center: await map.getCameraState().then((s) => s.center),
      zoom: await map.getCameraState().then((s) => s.zoom),
    ),
  );
  final sw = bounds.southwest.coordinates;
  final ne = bounds.northeast.coordinates;
  return (
    lat1: sw[1]!.toDouble(),
    lon1: sw[0]!.toDouble(),
    lat2: ne[1]!.toDouble(),
    lon2: ne[0]!.toDouble()
  );
}

/// Riga che mostra il punto attualmente selezionato e permette di rimuoverlo
/// (FR-008).
class _SelectedPointChip extends StatelessWidget {
  const _SelectedPointChip({required this.point, required this.onClear});

  final SearchPoint point;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      elevation: 2,
      shadowColor: theme.shadowColor,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 8, 6, 8),
        child: Row(
          children: [
            Icon(
              Icons.place_rounded,
              size: 18,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                point.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 18),
              tooltip: context.localization.coverageSearchClearPoint,
              onPressed: onClear,
            ),
          ],
        ),
      ),
    );
  }
}

/// Banner non bloccante per gli errori di selezione del punto: la mappa resta
/// utilizzabile e il risultato eventualmente già a schermo non viene distrutto
/// (Principio III).
class _SearchPointErrorBanner extends StatelessWidget {
  const _SearchPointErrorBanner({required this.error, required this.onDismiss});

  final SearchPointError error;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    final message = switch (error) {
      SearchPointError.coordinatesOutOfRange =>
        l10n.coverageSearchErrorOutOfRange,
      SearchPointError.noPlaceFound => l10n.coverageSearchNoResults,
      SearchPointError.geocodingUnavailable => l10n.coverageSearchErrorOffline,
      SearchPointError.geocodingFailed => l10n.coverageSearchErrorFailed,
    };

    return Material(
      color: theme.colorScheme.errorContainer,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 6, 10),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 18,
              color: theme.colorScheme.onErrorContainer,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 16),
              color: theme.colorScheme.onErrorContainer,
              onPressed: onDismiss,
            ),
          ],
        ),
      ),
    );
  }
}
