import 'dart:async';

import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/src/features/coverage_search/data/repository/recent_searches_repository.dart';
import 'package:hamqrg/src/features/coverage_search/data/repository/search_breadth_repository.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point_error.dart';
import 'package:hamqrg/src/features/pota/data/repository/pota_repository.dart';
import 'package:hamqrg/src/features/pota/provider/get_pota_spots/get_pota_spots_provider.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/map/controller/state/repeaters_map_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_in_bounds/get_repeaters_in_bounds_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_map_controller.g.dart';

@riverpod
class RepeatersMapController extends _$RepeatersMapController {
  @override
  FutureOr<RepeatersMapState> build() async {
    final mapState = await _initalLoad();
    // Load POTA spots in background (non-blocking)
    unawaited(loadPotaSpots());
    return mapState.copyWith(searchBreadth: await _restoreBreadth());
  }

  /// Ripristina l'ultima ampiezza scelta (FR-026). Se la lettura fallisce si
  /// riparte dal default: è una preferenza, non un dato da difendere.
  Future<SearchBreadth> _restoreBreadth() async {
    try {
      final repository = await ref.read(searchBreadthRepositoryProvider.future);
      return await repository.read();
    } catch (_) {
      return SearchBreadth.defaultBreadth;
    }
  }

  Future<void> toggleModeFilter({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    required AccessMode mode,
  }) async {
    final currentState = state.value;
    if (currentState == null) {
      return;
    }

    final newSelectedModes = Set<AccessMode>.from(currentState.selectedModes);
    if (newSelectedModes.contains(mode)) {
      newSelectedModes.remove(mode);
    } else {
      newSelectedModes.add(mode);
    }

    // Reload with current bounds if we have them, otherwise reload initial state
    if (currentState.latitude != null && currentState.longitude != null) {
      await loadRepeatersFromBounds(
        lat1: lat1,
        lon1: lon1,
        lat2: lat2,
        lon2: lon2,
        selectedModes:
            newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
      );
    } else {
      // Fallback to initial load
      state = const AsyncLoading();
      state = await AsyncValue.guard(
        () => _initalLoad(
          selectedModes:
              newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
        ),
      );
    }
  }

  /// Fissa il punto arbitrario da valutare (FR-006, FR-007).
  ///
  /// Sostituisce il punto precedente invece di affiancarlo: sulla mappa esiste
  /// al massimo un pin di ricerca per volta. Azzera anche l'eventuale errore
  /// precedente, perché una selezione riuscita lo rende obsoleto.
  Future<void> selectPoint(SearchPoint point) async {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(
      currentState.copyWith(searchPoint: point, pointError: null),
    );

    // La cima del funnel: quanti utenti scelgono un punto. Senza questo passo
    // si sa quanti comprano dopo aver visto il teaser, ma non quanti al
    // teaser non arrivano nemmeno — cioè non si sa se il problema sta prima o
    // dopo. Nessuna coordinata e nessun nome di luogo viaggiano con l'evento:
    // la firma di `track` non ha un posto dove metterli (FR-067).
    ref.read(analyticsClientProvider).track(
          AnalyticsEvent.coveragePointSelected,
          surface: AnalyticsSurface.mapTeaser,
        );

    // La cronologia è una comodità: se fallisce, la selezione resta valida.
    try {
      final repository =
          await ref.read(recentSearchesRepositoryProvider.future);
      await repository.record(point, now: DateTime.now());
    } catch (_) {
      // Ignorato di proposito.
    }
  }

  /// Rimuove il punto selezionato e torna alla vista mappa normale (FR-008).
  void clearPoint() {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncData(
      currentState.copyWith(searchPoint: null, pointError: null),
    );
  }

  /// Cambia l'ampiezza della ricerca e la ricorda per le volte successive
  /// (FR-024, FR-026).
  ///
  /// Il calcolo in corso non va fermato a mano: l'ampiezza fa parte della
  /// chiave del provider di valutazione, quindi cambiarla ne monta una nuova
  /// istanza e abbandona la precedente.
  Future<void> setBreadth(SearchBreadth breadth) async {
    final currentState = state.value;
    if (currentState == null || currentState.searchBreadth == breadth) return;
    state = AsyncData(currentState.copyWith(searchBreadth: breadth));

    try {
      final repository = await ref.read(searchBreadthRepositoryProvider.future);
      await repository.write(breadth);
    } catch (_) {
      // La scelta resta valida per questa sessione anche se non si persiste.
    }
  }

  /// Segnala un errore di selezione senza toccare il punto già fissato: un
  /// tentativo fallito non deve cancellare il risultato che l'utente sta
  /// guardando (Principio III).
  void reportPointError(SearchPointError error) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncData(currentState.copyWith(pointError: error));
  }

  /// Azzera il solo messaggio di errore, lasciando intatto il punto.
  void clearPointError() {
    final currentState = state.value;
    if (currentState == null || currentState.pointError == null) return;
    state = AsyncData(currentState.copyWith(pointError: null));
  }

  void selectRepeater(Repeater? repeater) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncValue.data(
      currentState.copyWith(selectedRepeater: repeater),
    );
  }

  void clearSelectedRepeater() {
    selectRepeater(null);
  }

  /// Clear all selected mode filters and reload repeaters
  Future<void> clearAllModes({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) async {
    final currentState = state.value;
    if (currentState == null || currentState.selectedModes.isEmpty) {
      return;
    }

    await loadRepeatersFromBounds(
      lat1: lat1,
      lon1: lon1,
      lat2: lat2,
      lon2: lon2,
      selectedModes: [], // Clear all modes - pass empty list
    );
  }

  /// Load repeaters based on map bounds (lat1, lon1, lat2, lon2)
  Future<void> loadRepeatersFromBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<AccessMode>? selectedModes,
  }) async {
    final currentState = state.value;
    final modesToFilter = selectedModes ?? currentState?.selectedModes.toList();

    try {
      final repeaters = await _fetchRepeatersFromBounds(
        lat1: lat1,
        lon1: lon1,
        lat2: lat2,
        lon2: lon2,
        accessModes: modesToFilter,
      );

      // copyWith e non un nuovo RepeatersMapState: ricostruire lo stato da zero
      // scarterebbe a ogni movimento della camera tutto ciò che non viene
      // rielencato — spot POTA, cache dei parchi e, da qui in avanti, il punto
      // di ricerca selezionato, che sparirebbe al primo pan della mappa.
      state = AsyncData(
        (currentState ?? const RepeatersMapState()).copyWith(
          repeaters: repeaters,
          selectedModes:
              modesToFilter?.toSet() ?? currentState?.selectedModes ?? {},
          hasLoadError: false,
          locationError: null,
        ),
      );
    } on LocationException catch (error) {
      // I modi scelti si registrano anche quando il caricamento fallisce: sono
      // una scelta dell'utente, non un esito della rete. Scartarli qui rendeva
      // i chip inerti offline — dove la copertura in cache è consultabile e
      // quindi il filtro serve eccome.
      state = AsyncData(
        (currentState ?? const RepeatersMapState()).copyWith(
          selectedModes:
              modesToFilter?.toSet() ?? currentState?.selectedModes ?? {},
          locationError: error.type,
        ),
      );
    } catch (_) {
      state = AsyncData(
        (currentState ?? const RepeatersMapState()).copyWith(
          selectedModes:
              modesToFilter?.toSet() ?? currentState?.selectedModes ?? {},
          hasLoadError: true,
        ),
      );
    }
  }

  /// Load initial repeaters, trying to get user location first
  Future<RepeatersMapState> _initalLoad({
    List<AccessMode>? selectedModes,
  }) async {
    final currentState = state.value;
    final modesToFilter = selectedModes ?? currentState?.selectedModes.toList();

    final position =
        await ref.read(locationServiceProvider).getCurrentPositionOrDefault();

    try {
      return RepeatersMapState(
        repeaters: [],
        latitude: position.latitude,
        longitude: position.longitude,
        selectedModes: modesToFilter?.toSet() ?? {},
      );
    } on LocationException catch (error) {
      return RepeatersMapState(
        locationError: error.type,
        selectedModes: modesToFilter?.toSet() ?? {},
      );
    }
  }

  /// Refreshes the cached user position and updates the state.
  Future<({double latitude, double longitude})> refreshUserPosition() async {
    final position = await ref.refresh(cachedUserPositionProvider.future);
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncData(
        currentState.copyWith(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    }
    return position;
  }

  /// Load POTA spots and their park coordinates for the map
  Future<void> loadPotaSpots() async {
    final currentState = state.value;
    if (currentState == null) return;

    try {
      final spots = await ref.read(getPotaSpotsProvider.future);
      final repository = ref.read(potaRepositoryProvider);
      final parks = await repository.getParksForSpots(spots);

      state = AsyncData(
        currentState.copyWith(
          potaSpots: spots,
          potaParkCache: parks,
        ),
      );
    } catch (_) {
      // Silently fail — POTA is secondary to repeaters
    }
  }

  Future<List<Repeater>> _fetchRepeatersFromBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<AccessMode>? accessModes,
  }) async {
    return await ref.read(
      getRepeatersInBoundsProvider(
        lat1: lat1,
        lon1: lon1,
        lat2: lat2,
        lon2: lon2,
        accessModes: accessModes?.isEmpty ?? true ? null : accessModes,
      ).future,
    );
  }
}
