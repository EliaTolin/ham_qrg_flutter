// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardState {
  DashboardStatistics get statistics;
  ({double lat, double lon}) get initialPosition;
  List<Repeater> get nearbyRepeaters;
  Profile? get profile;
  LocationErrorType? get locationError;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      _$DashboardStateCopyWithImpl<DashboardState>(
          this as DashboardState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardState &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.initialPosition, initialPosition) ||
                other.initialPosition == initialPosition) &&
            const DeepCollectionEquality()
                .equals(other.nearbyRepeaters, nearbyRepeaters) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.locationError, locationError) ||
                other.locationError == locationError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statistics,
      initialPosition,
      const DeepCollectionEquality().hash(nearbyRepeaters),
      profile,
      locationError);

  @override
  String toString() {
    return 'DashboardState(statistics: $statistics, initialPosition: $initialPosition, nearbyRepeaters: $nearbyRepeaters, profile: $profile, locationError: $locationError)';
  }
}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) _then) =
      _$DashboardStateCopyWithImpl;
  @useResult
  $Res call(
      {DashboardStatistics statistics,
      ({double lat, double lon}) initialPosition,
      List<Repeater> nearbyRepeaters,
      Profile? profile,
      LocationErrorType? locationError});

  $DashboardStatisticsCopyWith<$Res> get statistics;
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statistics = null,
    Object? initialPosition = null,
    Object? nearbyRepeaters = null,
    Object? profile = freezed,
    Object? locationError = freezed,
  }) {
    return _then(_self.copyWith(
      statistics: null == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as DashboardStatistics,
      initialPosition: null == initialPosition
          ? _self.initialPosition
          : initialPosition // ignore: cast_nullable_to_non_nullable
              as ({double lat, double lon}),
      nearbyRepeaters: null == nearbyRepeaters
          ? _self.nearbyRepeaters
          : nearbyRepeaters // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      locationError: freezed == locationError
          ? _self.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as LocationErrorType?,
    ));
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardStatisticsCopyWith<$Res> get statistics {
    return $DashboardStatisticsCopyWith<$Res>(_self.statistics, (value) {
      return _then(_self.copyWith(statistics: value));
    });
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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
    TResult Function(_DashboardState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardState() when $default != null:
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
    TResult Function(_DashboardState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardState():
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
    TResult? Function(_DashboardState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardState() when $default != null:
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
            DashboardStatistics statistics,
            ({double lat, double lon}) initialPosition,
            List<Repeater> nearbyRepeaters,
            Profile? profile,
            LocationErrorType? locationError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardState() when $default != null:
        return $default(_that.statistics, _that.initialPosition,
            _that.nearbyRepeaters, _that.profile, _that.locationError);
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
            DashboardStatistics statistics,
            ({double lat, double lon}) initialPosition,
            List<Repeater> nearbyRepeaters,
            Profile? profile,
            LocationErrorType? locationError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardState():
        return $default(_that.statistics, _that.initialPosition,
            _that.nearbyRepeaters, _that.profile, _that.locationError);
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
            DashboardStatistics statistics,
            ({double lat, double lon}) initialPosition,
            List<Repeater> nearbyRepeaters,
            Profile? profile,
            LocationErrorType? locationError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardState() when $default != null:
        return $default(_that.statistics, _that.initialPosition,
            _that.nearbyRepeaters, _that.profile, _that.locationError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DashboardState implements DashboardState {
  const _DashboardState(
      {required this.statistics,
      required this.initialPosition,
      required final List<Repeater> nearbyRepeaters,
      required this.profile,
      this.locationError})
      : _nearbyRepeaters = nearbyRepeaters;

  @override
  final DashboardStatistics statistics;
  @override
  final ({double lat, double lon}) initialPosition;
  final List<Repeater> _nearbyRepeaters;
  @override
  List<Repeater> get nearbyRepeaters {
    if (_nearbyRepeaters is EqualUnmodifiableListView) return _nearbyRepeaters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nearbyRepeaters);
  }

  @override
  final Profile? profile;
  @override
  final LocationErrorType? locationError;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardStateCopyWith<_DashboardState> get copyWith =>
      __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardState &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.initialPosition, initialPosition) ||
                other.initialPosition == initialPosition) &&
            const DeepCollectionEquality()
                .equals(other._nearbyRepeaters, _nearbyRepeaters) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.locationError, locationError) ||
                other.locationError == locationError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statistics,
      initialPosition,
      const DeepCollectionEquality().hash(_nearbyRepeaters),
      profile,
      locationError);

  @override
  String toString() {
    return 'DashboardState(statistics: $statistics, initialPosition: $initialPosition, nearbyRepeaters: $nearbyRepeaters, profile: $profile, locationError: $locationError)';
  }
}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(
          _DashboardState value, $Res Function(_DashboardState) _then) =
      __$DashboardStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DashboardStatistics statistics,
      ({double lat, double lon}) initialPosition,
      List<Repeater> nearbyRepeaters,
      Profile? profile,
      LocationErrorType? locationError});

  @override
  $DashboardStatisticsCopyWith<$Res> get statistics;
  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statistics = null,
    Object? initialPosition = null,
    Object? nearbyRepeaters = null,
    Object? profile = freezed,
    Object? locationError = freezed,
  }) {
    return _then(_DashboardState(
      statistics: null == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as DashboardStatistics,
      initialPosition: null == initialPosition
          ? _self.initialPosition
          : initialPosition // ignore: cast_nullable_to_non_nullable
              as ({double lat, double lon}),
      nearbyRepeaters: null == nearbyRepeaters
          ? _self._nearbyRepeaters
          : nearbyRepeaters // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      locationError: freezed == locationError
          ? _self.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as LocationErrorType?,
    ));
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardStatisticsCopyWith<$Res> get statistics {
    return $DashboardStatisticsCopyWith<$Res>(_self.statistics, (value) {
      return _then(_self.copyWith(statistics: value));
    });
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

// dart format on
