import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';

part 'dashboard_state.freezed.dart';

/// State of the home dashboard.
///
/// POTA and SOTA spots are deliberately absent: they come from third-party
/// APIs and must never be able to fail the whole home page. Each section
/// watches its own provider and renders its own error/retry inline.
@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    required DashboardStatistics statistics,
    required ({double lat, double lon}) initialPosition,
    required List<Repeater> nearbyRepeaters,
    required Profile? profile,
    LocationErrorType? locationError,

    /// Il caricamento dei dati è fallito.
    ///
    /// Senza questo flag le statistiche a zero e le liste vuote qui sopra
    /// sono indistinguibili da un risultato vero: la home direbbe «nessun
    /// ripetitore» dove la verità è «non sono riuscito a chiederlo».
    @Default(false) bool hasLoadError,
  }) = _DashboardState;
}
