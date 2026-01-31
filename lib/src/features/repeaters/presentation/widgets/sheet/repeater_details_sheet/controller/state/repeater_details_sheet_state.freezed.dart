// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_details_sheet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterDetailsSheetState {
  /// The repeater data
  Repeater get repeater;

  /// Feedback statistics for the repeater
  RepeaterFeedbackStats? get feedbackStats;

  /// Whether the repeater is in the user's favorites
  bool get isFavorite;

  /// Whether a favorite action is in progress
  bool get isTogglingFavorite;

  /// Distance from repeater
  double? get distanceInMeters;

  /// Create a copy of RepeaterDetailsSheetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterDetailsSheetStateCopyWith<RepeaterDetailsSheetState> get copyWith =>
      _$RepeaterDetailsSheetStateCopyWithImpl<RepeaterDetailsSheetState>(
          this as RepeaterDetailsSheetState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterDetailsSheetState &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.feedbackStats, feedbackStats) ||
                other.feedbackStats == feedbackStats) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isTogglingFavorite, isTogglingFavorite) ||
                other.isTogglingFavorite == isTogglingFavorite) &&
            (identical(other.distanceInMeters, distanceInMeters) ||
                other.distanceInMeters == distanceInMeters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repeater, feedbackStats,
      isFavorite, isTogglingFavorite, distanceInMeters);

  @override
  String toString() {
    return 'RepeaterDetailsSheetState(repeater: $repeater, feedbackStats: $feedbackStats, isFavorite: $isFavorite, isTogglingFavorite: $isTogglingFavorite, distanceInMeters: $distanceInMeters)';
  }
}

/// @nodoc
abstract mixin class $RepeaterDetailsSheetStateCopyWith<$Res> {
  factory $RepeaterDetailsSheetStateCopyWith(RepeaterDetailsSheetState value,
          $Res Function(RepeaterDetailsSheetState) _then) =
      _$RepeaterDetailsSheetStateCopyWithImpl;
  @useResult
  $Res call(
      {Repeater repeater,
      RepeaterFeedbackStats? feedbackStats,
      bool isFavorite,
      bool isTogglingFavorite,
      double? distanceInMeters});

  $RepeaterCopyWith<$Res> get repeater;
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats;
}

/// @nodoc
class _$RepeaterDetailsSheetStateCopyWithImpl<$Res>
    implements $RepeaterDetailsSheetStateCopyWith<$Res> {
  _$RepeaterDetailsSheetStateCopyWithImpl(this._self, this._then);

  final RepeaterDetailsSheetState _self;
  final $Res Function(RepeaterDetailsSheetState) _then;

  /// Create a copy of RepeaterDetailsSheetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeater = null,
    Object? feedbackStats = freezed,
    Object? isFavorite = null,
    Object? isTogglingFavorite = null,
    Object? distanceInMeters = freezed,
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
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isTogglingFavorite: null == isTogglingFavorite
          ? _self.isTogglingFavorite
          : isTogglingFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      distanceInMeters: freezed == distanceInMeters
          ? _self.distanceInMeters
          : distanceInMeters // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of RepeaterDetailsSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterDetailsSheetState
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

/// Adds pattern-matching-related methods to [RepeaterDetailsSheetState].
extension RepeaterDetailsSheetStatePatterns on RepeaterDetailsSheetState {
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
    TResult Function(_RepeaterDetailsSheetState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailsSheetState() when $default != null:
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
    TResult Function(_RepeaterDetailsSheetState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailsSheetState():
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
    TResult? Function(_RepeaterDetailsSheetState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailsSheetState() when $default != null:
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
    TResult Function(Repeater repeater, RepeaterFeedbackStats? feedbackStats,
            bool isFavorite, bool isTogglingFavorite, double? distanceInMeters)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailsSheetState() when $default != null:
        return $default(_that.repeater, _that.feedbackStats, _that.isFavorite,
            _that.isTogglingFavorite, _that.distanceInMeters);
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
    TResult Function(Repeater repeater, RepeaterFeedbackStats? feedbackStats,
            bool isFavorite, bool isTogglingFavorite, double? distanceInMeters)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailsSheetState():
        return $default(_that.repeater, _that.feedbackStats, _that.isFavorite,
            _that.isTogglingFavorite, _that.distanceInMeters);
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
    TResult? Function(Repeater repeater, RepeaterFeedbackStats? feedbackStats,
            bool isFavorite, bool isTogglingFavorite, double? distanceInMeters)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailsSheetState() when $default != null:
        return $default(_that.repeater, _that.feedbackStats, _that.isFavorite,
            _that.isTogglingFavorite, _that.distanceInMeters);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeaterDetailsSheetState implements RepeaterDetailsSheetState {
  const _RepeaterDetailsSheetState(
      {required this.repeater,
      this.feedbackStats,
      this.isFavorite = false,
      this.isTogglingFavorite = false,
      this.distanceInMeters});

  /// The repeater data
  @override
  final Repeater repeater;

  /// Feedback statistics for the repeater
  @override
  final RepeaterFeedbackStats? feedbackStats;

  /// Whether the repeater is in the user's favorites
  @override
  @JsonKey()
  final bool isFavorite;

  /// Whether a favorite action is in progress
  @override
  @JsonKey()
  final bool isTogglingFavorite;

  /// Distance from repeater
  @override
  final double? distanceInMeters;

  /// Create a copy of RepeaterDetailsSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterDetailsSheetStateCopyWith<_RepeaterDetailsSheetState>
      get copyWith =>
          __$RepeaterDetailsSheetStateCopyWithImpl<_RepeaterDetailsSheetState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterDetailsSheetState &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.feedbackStats, feedbackStats) ||
                other.feedbackStats == feedbackStats) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isTogglingFavorite, isTogglingFavorite) ||
                other.isTogglingFavorite == isTogglingFavorite) &&
            (identical(other.distanceInMeters, distanceInMeters) ||
                other.distanceInMeters == distanceInMeters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repeater, feedbackStats,
      isFavorite, isTogglingFavorite, distanceInMeters);

  @override
  String toString() {
    return 'RepeaterDetailsSheetState(repeater: $repeater, feedbackStats: $feedbackStats, isFavorite: $isFavorite, isTogglingFavorite: $isTogglingFavorite, distanceInMeters: $distanceInMeters)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterDetailsSheetStateCopyWith<$Res>
    implements $RepeaterDetailsSheetStateCopyWith<$Res> {
  factory _$RepeaterDetailsSheetStateCopyWith(_RepeaterDetailsSheetState value,
          $Res Function(_RepeaterDetailsSheetState) _then) =
      __$RepeaterDetailsSheetStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Repeater repeater,
      RepeaterFeedbackStats? feedbackStats,
      bool isFavorite,
      bool isTogglingFavorite,
      double? distanceInMeters});

  @override
  $RepeaterCopyWith<$Res> get repeater;
  @override
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats;
}

/// @nodoc
class __$RepeaterDetailsSheetStateCopyWithImpl<$Res>
    implements _$RepeaterDetailsSheetStateCopyWith<$Res> {
  __$RepeaterDetailsSheetStateCopyWithImpl(this._self, this._then);

  final _RepeaterDetailsSheetState _self;
  final $Res Function(_RepeaterDetailsSheetState) _then;

  /// Create a copy of RepeaterDetailsSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeater = null,
    Object? feedbackStats = freezed,
    Object? isFavorite = null,
    Object? isTogglingFavorite = null,
    Object? distanceInMeters = freezed,
  }) {
    return _then(_RepeaterDetailsSheetState(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      feedbackStats: freezed == feedbackStats
          ? _self.feedbackStats
          : feedbackStats // ignore: cast_nullable_to_non_nullable
              as RepeaterFeedbackStats?,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isTogglingFavorite: null == isTogglingFavorite
          ? _self.isTogglingFavorite
          : isTogglingFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      distanceInMeters: freezed == distanceInMeters
          ? _self.distanceInMeters
          : distanceInMeters // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of RepeaterDetailsSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterDetailsSheetState
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
