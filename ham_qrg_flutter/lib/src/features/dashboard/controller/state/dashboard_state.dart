import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_qrg/src/features/home/domain/home_statistics/home_statistics.dart';
import 'package:ham_qrg/src/features/profile/domain/profile/profile.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/service/location_service.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    required HomeStatistics statistics,
    required ({double lat, double lon}) initialPosition,
    required List<Repeater> nearbyRepeaters,
    required Profile? profile,
    LocationErrorType? locationError,
  }) = _DashboardState;
}
