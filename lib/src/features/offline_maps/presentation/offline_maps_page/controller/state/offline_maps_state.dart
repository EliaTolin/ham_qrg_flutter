import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/clients/mapbox_offline/mapbox_offline_client.dart';

part 'offline_maps_state.freezed.dart';

@freezed
abstract class OfflineMapsState with _$OfflineMapsState {
  const factory OfflineMapsState({
    @Default(<OfflineRegionSnapshot>[]) List<OfflineRegionSnapshot> regions,

    /// Id della regione in download, o `null` se nessun download è in corso.
    /// I download sono serializzati: uno alla volta (un secondo
    /// `loadTileRegion` sullo stesso id cancellerebbe il primo).
    String? downloadingRegionId,
    @Default(0.0) double downloadProgress,
    @Default(OfflineDownloadPhase.stylePack) OfflineDownloadPhase downloadPhase,
    @Default(false) bool hasDownloadError,
    @Default(false) bool hasDeleteError,
  }) = _OfflineMapsState;
}
