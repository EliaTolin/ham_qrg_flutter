import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    required DashboardStatistics statistics,
    required ({double lat, double lon}) initialPosition,
    required List<Repeater> nearbyRepeaters,
    required Profile? profile,
    LocationErrorType? locationError,
  }) = _DashboardState;
}
