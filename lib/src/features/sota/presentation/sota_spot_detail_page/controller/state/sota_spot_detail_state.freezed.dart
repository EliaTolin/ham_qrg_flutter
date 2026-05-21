// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sota_spot_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SotaSpotDetailState {
  SotaSpot get spot;
  bool get summitLoading;
  bool get summitError;
  SotaSummit? get summit;
  double? get distanceKm;
  double? get bearingDegrees;

  /// Create a copy of SotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SotaSpotDetailStateCopyWith<SotaSpotDetailState> get copyWith =>
      _$SotaSpotDetailStateCopyWithImpl<SotaSpotDetailState>(
          this as SotaSpotDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SotaSpotDetailState &&
            (identical(other.spot, spot) || other.spot == spot) &&
            (identical(other.summitLoading, summitLoading) ||
                other.summitLoading == summitLoading) &&
            (identical(other.summitError, summitError) ||
                other.summitError == summitError) &&
            (identical(other.summit, summit) || other.summit == summit) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.bearingDegrees, bearingDegrees) ||
                other.bearingDegrees == bearingDegrees));
  }

  @override
  int get hashCode => Object.hash(runtimeType, spot, summitLoading, summitError,
      summit, distanceKm, bearingDegrees);

  @override
  String toString() {
    return 'SotaSpotDetailState(spot: $spot, summitLoading: $summitLoading, summitError: $summitError, summit: $summit, distanceKm: $distanceKm, bearingDegrees: $bearingDegrees)';
  }
}

/// @nodoc
abstract mixin class $SotaSpotDetailStateCopyWith<$Res> {
  factory $SotaSpotDetailStateCopyWith(
          SotaSpotDetailState value, $Res Function(SotaSpotDetailState) _then) =
      _$SotaSpotDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {SotaSpot spot,
      bool summitLoading,
      bool summitError,
      SotaSummit? summit,
      double? distanceKm,
      double? bearingDegrees});

  $SotaSpotCopyWith<$Res> get spot;
  $SotaSummitCopyWith<$Res>? get summit;
}

/// @nodoc
class _$SotaSpotDetailStateCopyWithImpl<$Res>
    implements $SotaSpotDetailStateCopyWith<$Res> {
  _$SotaSpotDetailStateCopyWithImpl(this._self, this._then);

  final SotaSpotDetailState _self;
  final $Res Function(SotaSpotDetailState) _then;

  /// Create a copy of SotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spot = null,
    Object? summitLoading = null,
    Object? summitError = null,
    Object? summit = freezed,
    Object? distanceKm = freezed,
    Object? bearingDegrees = freezed,
  }) {
    return _then(_self.copyWith(
      spot: null == spot
          ? _self.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as SotaSpot,
      summitLoading: null == summitLoading
          ? _self.summitLoading
          : summitLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      summitError: null == summitError
          ? _self.summitError
          : summitError // ignore: cast_nullable_to_non_nullable
              as bool,
      summit: freezed == summit
          ? _self.summit
          : summit // ignore: cast_nullable_to_non_nullable
              as SotaSummit?,
      distanceKm: freezed == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      bearingDegrees: freezed == bearingDegrees
          ? _self.bearingDegrees
          : bearingDegrees // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of SotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SotaSpotCopyWith<$Res> get spot {
    return $SotaSpotCopyWith<$Res>(_self.spot, (value) {
      return _then(_self.copyWith(spot: value));
    });
  }

  /// Create a copy of SotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SotaSummitCopyWith<$Res>? get summit {
    if (_self.summit == null) {
      return null;
    }

    return $SotaSummitCopyWith<$Res>(_self.summit!, (value) {
      return _then(_self.copyWith(summit: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SotaSpotDetailState].
extension SotaSpotDetailStatePatterns on SotaSpotDetailState {
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
    TResult Function(_SotaSpotDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSpotDetailState() when $default != null:
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
    TResult Function(_SotaSpotDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotDetailState():
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
    TResult? Function(_SotaSpotDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotDetailState() when $default != null:
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
    TResult Function(SotaSpot spot, bool summitLoading, bool summitError,
            SotaSummit? summit, double? distanceKm, double? bearingDegrees)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSpotDetailState() when $default != null:
        return $default(_that.spot, _that.summitLoading, _that.summitError,
            _that.summit, _that.distanceKm, _that.bearingDegrees);
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
    TResult Function(SotaSpot spot, bool summitLoading, bool summitError,
            SotaSummit? summit, double? distanceKm, double? bearingDegrees)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotDetailState():
        return $default(_that.spot, _that.summitLoading, _that.summitError,
            _that.summit, _that.distanceKm, _that.bearingDegrees);
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
    TResult? Function(SotaSpot spot, bool summitLoading, bool summitError,
            SotaSummit? summit, double? distanceKm, double? bearingDegrees)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotDetailState() when $default != null:
        return $default(_that.spot, _that.summitLoading, _that.summitError,
            _that.summit, _that.distanceKm, _that.bearingDegrees);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SotaSpotDetailState implements SotaSpotDetailState {
  const _SotaSpotDetailState(
      {required this.spot,
      this.summitLoading = false,
      this.summitError = false,
      this.summit,
      this.distanceKm,
      this.bearingDegrees});

  @override
  final SotaSpot spot;
  @override
  @JsonKey()
  final bool summitLoading;
  @override
  @JsonKey()
  final bool summitError;
  @override
  final SotaSummit? summit;
  @override
  final double? distanceKm;
  @override
  final double? bearingDegrees;

  /// Create a copy of SotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SotaSpotDetailStateCopyWith<_SotaSpotDetailState> get copyWith =>
      __$SotaSpotDetailStateCopyWithImpl<_SotaSpotDetailState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SotaSpotDetailState &&
            (identical(other.spot, spot) || other.spot == spot) &&
            (identical(other.summitLoading, summitLoading) ||
                other.summitLoading == summitLoading) &&
            (identical(other.summitError, summitError) ||
                other.summitError == summitError) &&
            (identical(other.summit, summit) || other.summit == summit) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.bearingDegrees, bearingDegrees) ||
                other.bearingDegrees == bearingDegrees));
  }

  @override
  int get hashCode => Object.hash(runtimeType, spot, summitLoading, summitError,
      summit, distanceKm, bearingDegrees);

  @override
  String toString() {
    return 'SotaSpotDetailState(spot: $spot, summitLoading: $summitLoading, summitError: $summitError, summit: $summit, distanceKm: $distanceKm, bearingDegrees: $bearingDegrees)';
  }
}

/// @nodoc
abstract mixin class _$SotaSpotDetailStateCopyWith<$Res>
    implements $SotaSpotDetailStateCopyWith<$Res> {
  factory _$SotaSpotDetailStateCopyWith(_SotaSpotDetailState value,
          $Res Function(_SotaSpotDetailState) _then) =
      __$SotaSpotDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SotaSpot spot,
      bool summitLoading,
      bool summitError,
      SotaSummit? summit,
      double? distanceKm,
      double? bearingDegrees});

  @override
  $SotaSpotCopyWith<$Res> get spot;
  @override
  $SotaSummitCopyWith<$Res>? get summit;
}

/// @nodoc
class __$SotaSpotDetailStateCopyWithImpl<$Res>
    implements _$SotaSpotDetailStateCopyWith<$Res> {
  __$SotaSpotDetailStateCopyWithImpl(this._self, this._then);

  final _SotaSpotDetailState _self;
  final $Res Function(_SotaSpotDetailState) _then;

  /// Create a copy of SotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? spot = null,
    Object? summitLoading = null,
    Object? summitError = null,
    Object? summit = freezed,
    Object? distanceKm = freezed,
    Object? bearingDegrees = freezed,
  }) {
    return _then(_SotaSpotDetailState(
      spot: null == spot
          ? _self.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as SotaSpot,
      summitLoading: null == summitLoading
          ? _self.summitLoading
          : summitLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      summitError: null == summitError
          ? _self.summitError
          : summitError // ignore: cast_nullable_to_non_nullable
              as bool,
      summit: freezed == summit
          ? _self.summit
          : summit // ignore: cast_nullable_to_non_nullable
              as SotaSummit?,
      distanceKm: freezed == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      bearingDegrees: freezed == bearingDegrees
          ? _self.bearingDegrees
          : bearingDegrees // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of SotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SotaSpotCopyWith<$Res> get spot {
    return $SotaSpotCopyWith<$Res>(_self.spot, (value) {
      return _then(_self.copyWith(spot: value));
    });
  }

  /// Create a copy of SotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SotaSummitCopyWith<$Res>? get summit {
    if (_self.summit == null) {
      return null;
    }

    return $SotaSummitCopyWith<$Res>(_self.summit!, (value) {
      return _then(_self.copyWith(summit: value));
    });
  }
}

// dart format on
