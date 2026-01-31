// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterDetailState {
  Repeater get repeater;
  RepeaterFeedbackStats? get feedbackStats;
  List<RepeaterFeedback> get myFeedbacks;
  List<RepeaterFeedback> get communityFeedbacks;
  bool get isLoadingFeedback;
  bool get isSubmittingFeedback;
  bool get isDeletingFeedback;
  StationKind? get selectedStation;
  String? get selectedAccessId;
  String? get locationText;
  double? get userLatitude;
  double? get userLongitude;
  List<GeocodingResult> get locationSuggestions;
  String get comment;
  bool get isFeedbackLocationValidated;

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterDetailStateCopyWith<RepeaterDetailState> get copyWith =>
      _$RepeaterDetailStateCopyWithImpl<RepeaterDetailState>(
          this as RepeaterDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterDetailState &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.feedbackStats, feedbackStats) ||
                other.feedbackStats == feedbackStats) &&
            const DeepCollectionEquality()
                .equals(other.myFeedbacks, myFeedbacks) &&
            const DeepCollectionEquality()
                .equals(other.communityFeedbacks, communityFeedbacks) &&
            (identical(other.isLoadingFeedback, isLoadingFeedback) ||
                other.isLoadingFeedback == isLoadingFeedback) &&
            (identical(other.isSubmittingFeedback, isSubmittingFeedback) ||
                other.isSubmittingFeedback == isSubmittingFeedback) &&
            (identical(other.isDeletingFeedback, isDeletingFeedback) ||
                other.isDeletingFeedback == isDeletingFeedback) &&
            (identical(other.selectedStation, selectedStation) ||
                other.selectedStation == selectedStation) &&
            (identical(other.selectedAccessId, selectedAccessId) ||
                other.selectedAccessId == selectedAccessId) &&
            (identical(other.locationText, locationText) ||
                other.locationText == locationText) &&
            (identical(other.userLatitude, userLatitude) ||
                other.userLatitude == userLatitude) &&
            (identical(other.userLongitude, userLongitude) ||
                other.userLongitude == userLongitude) &&
            const DeepCollectionEquality()
                .equals(other.locationSuggestions, locationSuggestions) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.isFeedbackLocationValidated,
                    isFeedbackLocationValidated) ||
                other.isFeedbackLocationValidated ==
                    isFeedbackLocationValidated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      repeater,
      feedbackStats,
      const DeepCollectionEquality().hash(myFeedbacks),
      const DeepCollectionEquality().hash(communityFeedbacks),
      isLoadingFeedback,
      isSubmittingFeedback,
      isDeletingFeedback,
      selectedStation,
      selectedAccessId,
      locationText,
      userLatitude,
      userLongitude,
      const DeepCollectionEquality().hash(locationSuggestions),
      comment,
      isFeedbackLocationValidated);

  @override
  String toString() {
    return 'RepeaterDetailState(repeater: $repeater, feedbackStats: $feedbackStats, myFeedbacks: $myFeedbacks, communityFeedbacks: $communityFeedbacks, isLoadingFeedback: $isLoadingFeedback, isSubmittingFeedback: $isSubmittingFeedback, isDeletingFeedback: $isDeletingFeedback, selectedStation: $selectedStation, selectedAccessId: $selectedAccessId, locationText: $locationText, userLatitude: $userLatitude, userLongitude: $userLongitude, locationSuggestions: $locationSuggestions, comment: $comment, isFeedbackLocationValidated: $isFeedbackLocationValidated)';
  }
}

/// @nodoc
abstract mixin class $RepeaterDetailStateCopyWith<$Res> {
  factory $RepeaterDetailStateCopyWith(
          RepeaterDetailState value, $Res Function(RepeaterDetailState) _then) =
      _$RepeaterDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {Repeater repeater,
      RepeaterFeedbackStats? feedbackStats,
      List<RepeaterFeedback> myFeedbacks,
      List<RepeaterFeedback> communityFeedbacks,
      bool isLoadingFeedback,
      bool isSubmittingFeedback,
      bool isDeletingFeedback,
      StationKind? selectedStation,
      String? selectedAccessId,
      String? locationText,
      double? userLatitude,
      double? userLongitude,
      List<GeocodingResult> locationSuggestions,
      String comment,
      bool isFeedbackLocationValidated});

  $RepeaterCopyWith<$Res> get repeater;
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats;
}

/// @nodoc
class _$RepeaterDetailStateCopyWithImpl<$Res>
    implements $RepeaterDetailStateCopyWith<$Res> {
  _$RepeaterDetailStateCopyWithImpl(this._self, this._then);

  final RepeaterDetailState _self;
  final $Res Function(RepeaterDetailState) _then;

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeater = null,
    Object? feedbackStats = freezed,
    Object? myFeedbacks = null,
    Object? communityFeedbacks = null,
    Object? isLoadingFeedback = null,
    Object? isSubmittingFeedback = null,
    Object? isDeletingFeedback = null,
    Object? selectedStation = freezed,
    Object? selectedAccessId = freezed,
    Object? locationText = freezed,
    Object? userLatitude = freezed,
    Object? userLongitude = freezed,
    Object? locationSuggestions = null,
    Object? comment = null,
    Object? isFeedbackLocationValidated = null,
  }) {
    return _then(_self.copyWith(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      feedbackStats: freezed == feedbackStats
          ? _self.feedbackStats
          : feedbackStats // ignore: cast_nullable_to_non_nullable
              as RepeaterFeedbackStats?,
      myFeedbacks: null == myFeedbacks
          ? _self.myFeedbacks
          : myFeedbacks // ignore: cast_nullable_to_non_nullable
              as List<RepeaterFeedback>,
      communityFeedbacks: null == communityFeedbacks
          ? _self.communityFeedbacks
          : communityFeedbacks // ignore: cast_nullable_to_non_nullable
              as List<RepeaterFeedback>,
      isLoadingFeedback: null == isLoadingFeedback
          ? _self.isLoadingFeedback
          : isLoadingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmittingFeedback: null == isSubmittingFeedback
          ? _self.isSubmittingFeedback
          : isSubmittingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletingFeedback: null == isDeletingFeedback
          ? _self.isDeletingFeedback
          : isDeletingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedStation: freezed == selectedStation
          ? _self.selectedStation
          : selectedStation // ignore: cast_nullable_to_non_nullable
              as StationKind?,
      selectedAccessId: freezed == selectedAccessId
          ? _self.selectedAccessId
          : selectedAccessId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationText: freezed == locationText
          ? _self.locationText
          : locationText // ignore: cast_nullable_to_non_nullable
              as String?,
      userLatitude: freezed == userLatitude
          ? _self.userLatitude
          : userLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userLongitude: freezed == userLongitude
          ? _self.userLongitude
          : userLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locationSuggestions: null == locationSuggestions
          ? _self.locationSuggestions
          : locationSuggestions // ignore: cast_nullable_to_non_nullable
              as List<GeocodingResult>,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isFeedbackLocationValidated: null == isFeedbackLocationValidated
          ? _self.isFeedbackLocationValidated
          : isFeedbackLocationValidated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats {
    if (_self.feedbackStats == null) {
      return null;
    }

    return $RepeaterFeedbackStatsCopyWith<$Res>(_self.feedbackStats!, (value) {
      return _then(_self.copyWith(feedbackStats: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RepeaterDetailState].
extension RepeaterDetailStatePatterns on RepeaterDetailState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RepeaterDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RepeaterDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RepeaterDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Repeater repeater,
            RepeaterFeedbackStats? feedbackStats,
            List<RepeaterFeedback> myFeedbacks,
            List<RepeaterFeedback> communityFeedbacks,
            bool isLoadingFeedback,
            bool isSubmittingFeedback,
            bool isDeletingFeedback,
            StationKind? selectedStation,
            String? selectedAccessId,
            String? locationText,
            double? userLatitude,
            double? userLongitude,
            List<GeocodingResult> locationSuggestions,
            String comment,
            bool isFeedbackLocationValidated)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState() when $default != null:
        return $default(
            _that.repeater,
            _that.feedbackStats,
            _that.myFeedbacks,
            _that.communityFeedbacks,
            _that.isLoadingFeedback,
            _that.isSubmittingFeedback,
            _that.isDeletingFeedback,
            _that.selectedStation,
            _that.selectedAccessId,
            _that.locationText,
            _that.userLatitude,
            _that.userLongitude,
            _that.locationSuggestions,
            _that.comment,
            _that.isFeedbackLocationValidated);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Repeater repeater,
            RepeaterFeedbackStats? feedbackStats,
            List<RepeaterFeedback> myFeedbacks,
            List<RepeaterFeedback> communityFeedbacks,
            bool isLoadingFeedback,
            bool isSubmittingFeedback,
            bool isDeletingFeedback,
            StationKind? selectedStation,
            String? selectedAccessId,
            String? locationText,
            double? userLatitude,
            double? userLongitude,
            List<GeocodingResult> locationSuggestions,
            String comment,
            bool isFeedbackLocationValidated)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState():
        return $default(
            _that.repeater,
            _that.feedbackStats,
            _that.myFeedbacks,
            _that.communityFeedbacks,
            _that.isLoadingFeedback,
            _that.isSubmittingFeedback,
            _that.isDeletingFeedback,
            _that.selectedStation,
            _that.selectedAccessId,
            _that.locationText,
            _that.userLatitude,
            _that.userLongitude,
            _that.locationSuggestions,
            _that.comment,
            _that.isFeedbackLocationValidated);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            Repeater repeater,
            RepeaterFeedbackStats? feedbackStats,
            List<RepeaterFeedback> myFeedbacks,
            List<RepeaterFeedback> communityFeedbacks,
            bool isLoadingFeedback,
            bool isSubmittingFeedback,
            bool isDeletingFeedback,
            StationKind? selectedStation,
            String? selectedAccessId,
            String? locationText,
            double? userLatitude,
            double? userLongitude,
            List<GeocodingResult> locationSuggestions,
            String comment,
            bool isFeedbackLocationValidated)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState() when $default != null:
        return $default(
            _that.repeater,
            _that.feedbackStats,
            _that.myFeedbacks,
            _that.communityFeedbacks,
            _that.isLoadingFeedback,
            _that.isSubmittingFeedback,
            _that.isDeletingFeedback,
            _that.selectedStation,
            _that.selectedAccessId,
            _that.locationText,
            _that.userLatitude,
            _that.userLongitude,
            _that.locationSuggestions,
            _that.comment,
            _that.isFeedbackLocationValidated);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeaterDetailState implements RepeaterDetailState {
  const _RepeaterDetailState(
      {required this.repeater,
      this.feedbackStats,
      final List<RepeaterFeedback> myFeedbacks = const [],
      final List<RepeaterFeedback> communityFeedbacks = const [],
      this.isLoadingFeedback = false,
      this.isSubmittingFeedback = false,
      this.isDeletingFeedback = false,
      this.selectedStation,
      this.selectedAccessId,
      this.locationText,
      this.userLatitude,
      this.userLongitude,
      final List<GeocodingResult> locationSuggestions = const [],
      this.comment = '',
      this.isFeedbackLocationValidated = false})
      : _myFeedbacks = myFeedbacks,
        _communityFeedbacks = communityFeedbacks,
        _locationSuggestions = locationSuggestions;

  @override
  final Repeater repeater;
  @override
  final RepeaterFeedbackStats? feedbackStats;
  final List<RepeaterFeedback> _myFeedbacks;
  @override
  @JsonKey()
  List<RepeaterFeedback> get myFeedbacks {
    if (_myFeedbacks is EqualUnmodifiableListView) return _myFeedbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myFeedbacks);
  }

  final List<RepeaterFeedback> _communityFeedbacks;
  @override
  @JsonKey()
  List<RepeaterFeedback> get communityFeedbacks {
    if (_communityFeedbacks is EqualUnmodifiableListView)
      return _communityFeedbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_communityFeedbacks);
  }

  @override
  @JsonKey()
  final bool isLoadingFeedback;
  @override
  @JsonKey()
  final bool isSubmittingFeedback;
  @override
  @JsonKey()
  final bool isDeletingFeedback;
  @override
  final StationKind? selectedStation;
  @override
  final String? selectedAccessId;
  @override
  final String? locationText;
  @override
  final double? userLatitude;
  @override
  final double? userLongitude;
  final List<GeocodingResult> _locationSuggestions;
  @override
  @JsonKey()
  List<GeocodingResult> get locationSuggestions {
    if (_locationSuggestions is EqualUnmodifiableListView)
      return _locationSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationSuggestions);
  }

  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  final bool isFeedbackLocationValidated;

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterDetailStateCopyWith<_RepeaterDetailState> get copyWith =>
      __$RepeaterDetailStateCopyWithImpl<_RepeaterDetailState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterDetailState &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.feedbackStats, feedbackStats) ||
                other.feedbackStats == feedbackStats) &&
            const DeepCollectionEquality()
                .equals(other._myFeedbacks, _myFeedbacks) &&
            const DeepCollectionEquality()
                .equals(other._communityFeedbacks, _communityFeedbacks) &&
            (identical(other.isLoadingFeedback, isLoadingFeedback) ||
                other.isLoadingFeedback == isLoadingFeedback) &&
            (identical(other.isSubmittingFeedback, isSubmittingFeedback) ||
                other.isSubmittingFeedback == isSubmittingFeedback) &&
            (identical(other.isDeletingFeedback, isDeletingFeedback) ||
                other.isDeletingFeedback == isDeletingFeedback) &&
            (identical(other.selectedStation, selectedStation) ||
                other.selectedStation == selectedStation) &&
            (identical(other.selectedAccessId, selectedAccessId) ||
                other.selectedAccessId == selectedAccessId) &&
            (identical(other.locationText, locationText) ||
                other.locationText == locationText) &&
            (identical(other.userLatitude, userLatitude) ||
                other.userLatitude == userLatitude) &&
            (identical(other.userLongitude, userLongitude) ||
                other.userLongitude == userLongitude) &&
            const DeepCollectionEquality()
                .equals(other._locationSuggestions, _locationSuggestions) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.isFeedbackLocationValidated,
                    isFeedbackLocationValidated) ||
                other.isFeedbackLocationValidated ==
                    isFeedbackLocationValidated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      repeater,
      feedbackStats,
      const DeepCollectionEquality().hash(_myFeedbacks),
      const DeepCollectionEquality().hash(_communityFeedbacks),
      isLoadingFeedback,
      isSubmittingFeedback,
      isDeletingFeedback,
      selectedStation,
      selectedAccessId,
      locationText,
      userLatitude,
      userLongitude,
      const DeepCollectionEquality().hash(_locationSuggestions),
      comment,
      isFeedbackLocationValidated);

  @override
  String toString() {
    return 'RepeaterDetailState(repeater: $repeater, feedbackStats: $feedbackStats, myFeedbacks: $myFeedbacks, communityFeedbacks: $communityFeedbacks, isLoadingFeedback: $isLoadingFeedback, isSubmittingFeedback: $isSubmittingFeedback, isDeletingFeedback: $isDeletingFeedback, selectedStation: $selectedStation, selectedAccessId: $selectedAccessId, locationText: $locationText, userLatitude: $userLatitude, userLongitude: $userLongitude, locationSuggestions: $locationSuggestions, comment: $comment, isFeedbackLocationValidated: $isFeedbackLocationValidated)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterDetailStateCopyWith<$Res>
    implements $RepeaterDetailStateCopyWith<$Res> {
  factory _$RepeaterDetailStateCopyWith(_RepeaterDetailState value,
          $Res Function(_RepeaterDetailState) _then) =
      __$RepeaterDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Repeater repeater,
      RepeaterFeedbackStats? feedbackStats,
      List<RepeaterFeedback> myFeedbacks,
      List<RepeaterFeedback> communityFeedbacks,
      bool isLoadingFeedback,
      bool isSubmittingFeedback,
      bool isDeletingFeedback,
      StationKind? selectedStation,
      String? selectedAccessId,
      String? locationText,
      double? userLatitude,
      double? userLongitude,
      List<GeocodingResult> locationSuggestions,
      String comment,
      bool isFeedbackLocationValidated});

  @override
  $RepeaterCopyWith<$Res> get repeater;
  @override
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats;
}

/// @nodoc
class __$RepeaterDetailStateCopyWithImpl<$Res>
    implements _$RepeaterDetailStateCopyWith<$Res> {
  __$RepeaterDetailStateCopyWithImpl(this._self, this._then);

  final _RepeaterDetailState _self;
  final $Res Function(_RepeaterDetailState) _then;

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeater = null,
    Object? feedbackStats = freezed,
    Object? myFeedbacks = null,
    Object? communityFeedbacks = null,
    Object? isLoadingFeedback = null,
    Object? isSubmittingFeedback = null,
    Object? isDeletingFeedback = null,
    Object? selectedStation = freezed,
    Object? selectedAccessId = freezed,
    Object? locationText = freezed,
    Object? userLatitude = freezed,
    Object? userLongitude = freezed,
    Object? locationSuggestions = null,
    Object? comment = null,
    Object? isFeedbackLocationValidated = null,
  }) {
    return _then(_RepeaterDetailState(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      feedbackStats: freezed == feedbackStats
          ? _self.feedbackStats
          : feedbackStats // ignore: cast_nullable_to_non_nullable
              as RepeaterFeedbackStats?,
      myFeedbacks: null == myFeedbacks
          ? _self._myFeedbacks
          : myFeedbacks // ignore: cast_nullable_to_non_nullable
              as List<RepeaterFeedback>,
      communityFeedbacks: null == communityFeedbacks
          ? _self._communityFeedbacks
          : communityFeedbacks // ignore: cast_nullable_to_non_nullable
              as List<RepeaterFeedback>,
      isLoadingFeedback: null == isLoadingFeedback
          ? _self.isLoadingFeedback
          : isLoadingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmittingFeedback: null == isSubmittingFeedback
          ? _self.isSubmittingFeedback
          : isSubmittingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletingFeedback: null == isDeletingFeedback
          ? _self.isDeletingFeedback
          : isDeletingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedStation: freezed == selectedStation
          ? _self.selectedStation
          : selectedStation // ignore: cast_nullable_to_non_nullable
              as StationKind?,
      selectedAccessId: freezed == selectedAccessId
          ? _self.selectedAccessId
          : selectedAccessId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationText: freezed == locationText
          ? _self.locationText
          : locationText // ignore: cast_nullable_to_non_nullable
              as String?,
      userLatitude: freezed == userLatitude
          ? _self.userLatitude
          : userLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userLongitude: freezed == userLongitude
          ? _self.userLongitude
          : userLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locationSuggestions: null == locationSuggestions
          ? _self._locationSuggestions
          : locationSuggestions // ignore: cast_nullable_to_non_nullable
              as List<GeocodingResult>,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isFeedbackLocationValidated: null == isFeedbackLocationValidated
          ? _self.isFeedbackLocationValidated
          : isFeedbackLocationValidated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats {
    if (_self.feedbackStats == null) {
      return null;
    }

    return $RepeaterFeedbackStatsCopyWith<$Res>(_self.feedbackStats!, (value) {
      return _then(_self.copyWith(feedbackStats: value));
    });
  }
}

// dart format on
