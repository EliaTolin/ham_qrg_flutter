import 'dart:async';

import 'package:hamqrg/clients/mapbox_offline/impl/mapbox_offline_client_impl.dart';
import 'package:hamqrg/clients/mapbox_offline/mapbox_offline_client.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/offline_maps/presentation/offline_maps_page/controller/state/offline_maps_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_maps_controller.g.dart';

@riverpod
class OfflineMapsController extends _$OfflineMapsController {
  MapboxOfflineClient get _client => ref.read(mapboxOfflineClientProvider);

  @override
  Future<OfflineMapsState> build() async {
    return OfflineMapsState(regions: await _client.listRegions());
  }

  /// Avvia il download di una regione. Le mutazioni non portano MAI lo stato
  /// in `AsyncError`: gli esiti negativi vivono nei flag dello state.
  Future<void> download(OfflineRegionRequest request) async {
    final current = state.value;
    if (current == null || current.downloadingRegionId != null) return;

    state = AsyncData(
      current.copyWith(
        downloadingRegionId: request.id,
        downloadProgress: 0,
        downloadPhase: OfflineDownloadPhase.stylePack,
        hasDownloadError: false,
      ),
    );

    try {
      await for (final progress in _client.downloadRegion(request)) {
        final value = state.value;
        if (value == null) return;
        state = AsyncData(
          value.copyWith(
            downloadProgress: progress.fraction,
            downloadPhase: progress.phase,
          ),
        );
      }
      await _reloadRegions(clearDownload: true);
    } catch (error, stackTrace) {
      ref
          .read(talkerServiceProvider)
          .handle(error, stackTrace, '[OfflineMaps] download failed');
      // La regione parziale resta nel TileStore: ricaricare la lista la
      // mostra come incompleta, con la possibilità di riprendere.
      await _reloadRegions(clearDownload: true, downloadError: true);
    }
  }

  /// Riprende una regione incompleta: stesso id, il TileStore scarica solo
  /// le risorse mancanti.
  Future<void> resume(OfflineRegionSnapshot snapshot) async {
    final latitude = snapshot.latitude;
    final longitude = snapshot.longitude;
    final radiusKm = snapshot.radiusKm;
    if (latitude == null || longitude == null || radiusKm == null) return;
    await download(
      OfflineRegionRequest(
        id: snapshot.id,
        name: snapshot.name,
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
      ),
    );
  }

  Future<void> delete(String id) async {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(hasDeleteError: false));
    try {
      await _client.deleteRegion(id);
      await _reloadRegions();
    } catch (error, stackTrace) {
      ref
          .read(talkerServiceProvider)
          .handle(error, stackTrace, '[OfflineMaps] delete failed');
      final value = state.value;
      if (value != null) {
        state = AsyncData(value.copyWith(hasDeleteError: true));
      }
    }
  }

  void clearErrors() {
    final value = state.value;
    if (value == null) return;
    state = AsyncData(
      value.copyWith(hasDownloadError: false, hasDeleteError: false),
    );
  }

  Future<void> _reloadRegions({
    bool clearDownload = false,
    bool downloadError = false,
  }) async {
    List<OfflineRegionSnapshot>? regions;
    try {
      regions = await _client.listRegions();
    } catch (_) {
      regions = null;
    }
    final value = state.value;
    if (value == null) return;
    state = AsyncData(
      value.copyWith(
        regions: regions ?? value.regions,
        downloadingRegionId: clearDownload ? null : value.downloadingRegionId,
        downloadProgress: clearDownload ? 0 : value.downloadProgress,
        hasDownloadError: downloadError,
      ),
    );
  }
}
