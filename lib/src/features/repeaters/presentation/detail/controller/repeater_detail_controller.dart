import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/state/repeater_detail_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/add_repeater_feedback/add_repeater_feedback_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/delete_repeater_feedback/delete_repeater_feedback_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_my_repeater_feedbacks/get_my_repeater_feedbacks_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_by_id/get_repeater_by_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_feedback_stats/get_repeater_feedback_stats_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_feedbacks/get_repeater_feedbacks_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/geocoding_service.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeater_detail_controller.g.dart';

@riverpod
class RepeaterDetailController extends _$RepeaterDetailController {
  @override
  FutureOr<RepeaterDetailState> build(String repeaterId) async {
    return _loadInitialData(repeaterId);
  }

  Future<RepeaterDetailState> _loadInitialData(String repeaterId) async {
    final repeater = await ref.read(getRepeaterByIdProvider(repeaterId).future);
    if (repeater == null) {
      throw Exception('Repeater not found');
    }

    final feedbackStats = await ref.read(
      getRepeaterFeedbackStatsProvider(repeaterId).future,
    );
    final myFeedbacks = await ref.read(
      getMyRepeaterFeedbacksProvider(repeaterId).future,
    );
    final communityFeedbacks = await ref.read(
      getRepeaterFeedbacksProvider(
        repeaterId: repeaterId,
        limit: 10,
      ).future,
    );

    return RepeaterDetailState(
      repeater: repeater,
      feedbackStats: feedbackStats,
      myFeedbacks: myFeedbacks,
      communityFeedbacks: communityFeedbacks,
    );
  }

  /// Returns the list of accesses that don't have a feedback from the user yet.
  List<RepeaterAccess> getAvailableAccesses() {
    final currentState = state.value;
    if (currentState == null) return [];

    final feedbackAccessIds = currentState.myFeedbacks.map((f) => f.repeaterAccess.id).toSet();

    return currentState.repeater.accesses
        .where((access) => !feedbackAccessIds.contains(access.id))
        .toList();
  }

  /// Calculates distance between two coordinates in kilometers.
  double _calculateDistanceKm(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000;
  }

  /// Checks if the user is within the allowed distance from the repeater.
  bool isWithinAllowedDistance() {
    final currentState = state.value;
    if (currentState == null) return false;

    final userLat = currentState.userLatitude;
    final userLon = currentState.userLongitude;
    if (userLat == null || userLon == null) return false;

    final repeater = currentState.repeater;
    final repeaterLat = repeater.latitude;
    final repeaterLon = repeater.longitude;
    if (repeaterLat == null || repeaterLon == null) return true;

    final distance = _calculateDistanceKm(
      userLat,
      userLon,
      repeaterLat,
      repeaterLon,
    );

    return distance <= AppConfigs.maxFeedbackDistanceKm;
  }

  /// Returns the distance from user to repeater in km, or null if unknown.
  double? getDistanceToRepeater() {
    final currentState = state.value;
    if (currentState == null) return null;

    final userLat = currentState.userLatitude;
    final userLon = currentState.userLongitude;
    if (userLat == null || userLon == null) return null;

    final repeater = currentState.repeater;
    final repeaterLat = repeater.latitude;
    final repeaterLon = repeater.longitude;
    if (repeaterLat == null || repeaterLon == null) return null;

    return _calculateDistanceKm(
      userLat,
      userLon,
      repeaterLat,
      repeaterLon,
    );
  }

  void setSelectedStation(StationKind? station) {
    state = AsyncData(
      state.value!.copyWith(selectedStation: station),
    );
  }

  void setSelectedAccessId(String? accessId) {
    state = AsyncData(
      state.value!.copyWith(selectedAccessId: accessId),
    );
  }

  void setLocationText(String? location) {
    state = AsyncData(
      state.value!.copyWith(
        locationText: location,
        isFeedbackLocationValidated: false,
      ),
    );
  }

  void setUserCoordinates(double latitude, double longitude) {
    state = AsyncData(
      state.value!.copyWith(
        userLatitude: latitude,
        userLongitude: longitude,
      ),
    );
  }

  void setLocationSuggestions(List<GeocodingResult> suggestions) {
    state = AsyncData(
      state.value!.copyWith(locationSuggestions: suggestions),
    );
  }

  void selectLocationSuggestion(GeocodingResult suggestion) {
    state = AsyncData(
      state.value!.copyWith(
        locationText: suggestion.placeName,
        userLatitude: suggestion.latitude,
        userLongitude: suggestion.longitude,
        locationSuggestions: [],
        isFeedbackLocationValidated: true,
      ),
    );
  }

  void clearLocationSuggestions() {
    state = AsyncData(
      state.value!.copyWith(locationSuggestions: []),
    );
  }

  void setComment(String comment) {
    state = AsyncData(
      state.value!.copyWith(comment: comment),
    );
  }

  /// Tries to get the user's current location and prefill it.
  Future<void> prefillUserLocation() async {
    try {
      final locationService = ref.read(locationServiceProvider);
      final position = await locationService.getCurrentPositionOrDefault();

      setUserCoordinates(position.latitude, position.longitude);

      // Reverse geocode to get place name
      final geocodingService = ref.read(geocodingServiceProvider);
      final result = await geocodingService.reverseGeocode(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      if (result != null) {
        state = AsyncData(
          state.value!.copyWith(
            locationText: result.placeName,
            isFeedbackLocationValidated: true,
          ),
        );
      }
    } on LocationException catch (e) {
      log('Could not get user location: ${e.type}');
    } catch (e) {
      log('Error prefilling location: $e');
    }
  }

  /// Searches for location suggestions based on query.
  Future<void> searchLocationSuggestions(String query) async {
    if (query.trim().length < 2) {
      clearLocationSuggestions();
      return;
    }

    try {
      final geocodingService = ref.read(geocodingServiceProvider);
      final results = await geocodingService.searchPlaces(query);
      setLocationSuggestions(results);
    } catch (e) {
      log('Error searching locations: $e');
      clearLocationSuggestions();
    }
  }

  /// Checks if the form is valid for submission.
  bool isFormValid() {
    final currentState = state.value;
    if (currentState == null) return false;

    return currentState.selectedStation != null &&
        currentState.selectedAccessId != null &&
        currentState.locationText != null &&
        currentState.locationText!.isNotEmpty &&
        currentState.isFeedbackLocationValidated &&
        currentState.userLatitude != null &&
        currentState.userLongitude != null &&
        currentState.comment.trim().length >= 3;
  }

  Future<void> submitFeedback({
    required FeedbackType type,
  }) async {
    final currentState = state.value;
    if (currentState == null) return;

    if (!isFormValid()) {
      return;
    }

    if (!isWithinAllowedDistance()) {
      throw Exception(
        'You must be within ${AppConfigs.maxFeedbackDistanceKm.toInt()} km '
        'of the repeater to submit feedback.',
      );
    }

    state = AsyncData(
      currentState.copyWith(isSubmittingFeedback: true),
    );

    try {
      await ref.read(
        addRepeaterFeedbackProvider(
          repeaterId: currentState.repeater.id,
          repeaterAccessId: currentState.selectedAccessId!,
          type: type,
          station: currentState.selectedStation!,
          latitude: currentState.userLatitude!,
          longitude: currentState.userLongitude!,
          comment: currentState.comment,
        ).future,
      );

      // Invalidate cached providers to force fresh data
      ref
        ..invalidate(getRepeaterFeedbackStatsProvider(currentState.repeater.id))
        ..invalidate(getMyRepeaterFeedbacksProvider(currentState.repeater.id))
        ..invalidate(
          getRepeaterFeedbacksProvider(
            repeaterId: currentState.repeater.id,
            limit: 10,
          ),
        );

      // Reload data and reset form
      final newState = await _loadInitialData(currentState.repeater.id);
      state = AsyncData(
        newState.copyWith(
          selectedStation: null,
          selectedAccessId: null,
          locationText: null,
          userLatitude: null,
          userLongitude: null,
          comment: '',
        ),
      );
    } catch (e, st) {
      log('Error submitting feedback: $e', stackTrace: st);
      state = AsyncData(
        currentState.copyWith(isSubmittingFeedback: false),
      );
      rethrow;
    }
  }

  Future<void> deleteFeedback(String feedbackId) async {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncData(
      currentState.copyWith(isDeletingFeedback: true),
    );

    try {
      await ref.read(
        deleteRepeaterFeedbackProvider(feedbackId).future,
      );

      // Invalidate cached providers to force fresh data
      ref
        ..invalidate(getRepeaterFeedbackStatsProvider(currentState.repeater.id))
        ..invalidate(getMyRepeaterFeedbacksProvider(currentState.repeater.id))
        ..invalidate(
          getRepeaterFeedbacksProvider(
            repeaterId: currentState.repeater.id,
            limit: 10,
          ),
        );

      // Reload data
      final newState = await _loadInitialData(currentState.repeater.id);
      state = AsyncData(newState);
    } catch (e, st) {
      log('Error deleting feedback: $e', stackTrace: st);
      state = AsyncData(
        currentState.copyWith(isDeletingFeedback: false),
      );
      rethrow;
    }
  }
}
