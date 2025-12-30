import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_qrg/src/features/home/domain/home_statistics/home_statistics.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/service/location_service.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required HomeStatistics statistics,
    required List<Repeater> nearbyRepeaters,
    LocationErrorType? locationError,
  }) = _HomeState;
}

