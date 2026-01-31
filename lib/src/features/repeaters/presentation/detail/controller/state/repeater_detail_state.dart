import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/service/geocoding_service.dart';

part 'repeater_detail_state.freezed.dart';

@freezed
abstract class RepeaterDetailState with _$RepeaterDetailState {
  const factory RepeaterDetailState({
    required Repeater repeater,
    RepeaterFeedbackStats? feedbackStats,
    @Default([]) List<RepeaterFeedback> myFeedbacks,
    @Default([]) List<RepeaterFeedback> communityFeedbacks,
    @Default(false) bool isLoadingFeedback,
    @Default(false) bool isSubmittingFeedback,
    @Default(false) bool isDeletingFeedback,
    StationKind? selectedStation,
    String? selectedAccessId,
    String? locationText,
    double? userLatitude,
    double? userLongitude,
    @Default([]) List<GeocodingResult> locationSuggestions,
    @Default('') String comment,
    @Default(false) bool isFeedbackLocationValidated,
  }) = _RepeaterDetailState;
}
