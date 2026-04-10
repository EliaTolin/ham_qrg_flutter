// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pota_spot_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PotaSpotDetailState {
  PotaSpot get spot;
  PotaPark? get park;
  double? get distanceKm;

  /// Create a copy of PotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PotaSpotDetailStateCopyWith<PotaSpotDetailState> get copyWith =>
      _$PotaSpotDetailStateCopyWithImpl<PotaSpotDetailState>(
          this as PotaSpotDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PotaSpotDetailState &&
            (identical(other.spot, spot) || other.spot == spot) &&
            (identical(other.park, park) || other.park == park) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, spot, park, distanceKm);

  @override
  String toString() {
    return 'PotaSpotDetailState(spot: $spot, park: $park, distanceKm: $distanceKm)';
  }
}

/// @nodoc
abstract mixin class $PotaSpotDetailStateCopyWith<$Res> {
  factory $PotaSpotDetailStateCopyWith(
          PotaSpotDetailState value, $Res Function(PotaSpotDetailState) _then) =
      _$PotaSpotDetailStateCopyWithImpl;
  @useResult
  $Res call({PotaSpot spot, PotaPark? park, double? distanceKm});

  $PotaSpotCopyWith<$Res> get spot;
  $PotaParkCopyWith<$Res>? get park;
}

/// @nodoc
class _$PotaSpotDetailStateCopyWithImpl<$Res>
    implements $PotaSpotDetailStateCopyWith<$Res> {
  _$PotaSpotDetailStateCopyWithImpl(this._self, this._then);

  final PotaSpotDetailState _self;
  final $Res Function(PotaSpotDetailState) _then;

  /// Create a copy of PotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spot = null,
    Object? park = freezed,
    Object? distanceKm = freezed,
  }) {
    return _then(_self.copyWith(
      spot: null == spot
          ? _self.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as PotaSpot,
      park: freezed == park
          ? _self.park
          : park // ignore: cast_nullable_to_non_nullable
              as PotaPark?,
      distanceKm: freezed == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of PotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PotaSpotCopyWith<$Res> get spot {
    return $PotaSpotCopyWith<$Res>(_self.spot, (value) {
      return _then(_self.copyWith(spot: value));
    });
  }

  /// Create a copy of PotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PotaParkCopyWith<$Res>? get park {
    if (_self.park == null) {
      return null;
    }

    return $PotaParkCopyWith<$Res>(_self.park!, (value) {
      return _then(_self.copyWith(park: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PotaSpotDetailState].
extension PotaSpotDetailStatePatterns on PotaSpotDetailState {
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
    TResult Function(_PotaSpotDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaSpotDetailState() when $default != null:
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
    TResult Function(_PotaSpotDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotDetailState():
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
    TResult? Function(_PotaSpotDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotDetailState() when $default != null:
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
    TResult Function(PotaSpot spot, PotaPark? park, double? distanceKm)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaSpotDetailState() when $default != null:
        return $default(_that.spot, _that.park, _that.distanceKm);
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
    TResult Function(PotaSpot spot, PotaPark? park, double? distanceKm)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotDetailState():
        return $default(_that.spot, _that.park, _that.distanceKm);
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
    TResult? Function(PotaSpot spot, PotaPark? park, double? distanceKm)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotDetailState() when $default != null:
        return $default(_that.spot, _that.park, _that.distanceKm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PotaSpotDetailState implements PotaSpotDetailState {
  const _PotaSpotDetailState({required this.spot, this.park, this.distanceKm});

  @override
  final PotaSpot spot;
  @override
  final PotaPark? park;
  @override
  final double? distanceKm;

  /// Create a copy of PotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PotaSpotDetailStateCopyWith<_PotaSpotDetailState> get copyWith =>
      __$PotaSpotDetailStateCopyWithImpl<_PotaSpotDetailState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PotaSpotDetailState &&
            (identical(other.spot, spot) || other.spot == spot) &&
            (identical(other.park, park) || other.park == park) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, spot, park, distanceKm);

  @override
  String toString() {
    return 'PotaSpotDetailState(spot: $spot, park: $park, distanceKm: $distanceKm)';
  }
}

/// @nodoc
abstract mixin class _$PotaSpotDetailStateCopyWith<$Res>
    implements $PotaSpotDetailStateCopyWith<$Res> {
  factory _$PotaSpotDetailStateCopyWith(_PotaSpotDetailState value,
          $Res Function(_PotaSpotDetailState) _then) =
      __$PotaSpotDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call({PotaSpot spot, PotaPark? park, double? distanceKm});

  @override
  $PotaSpotCopyWith<$Res> get spot;
  @override
  $PotaParkCopyWith<$Res>? get park;
}

/// @nodoc
class __$PotaSpotDetailStateCopyWithImpl<$Res>
    implements _$PotaSpotDetailStateCopyWith<$Res> {
  __$PotaSpotDetailStateCopyWithImpl(this._self, this._then);

  final _PotaSpotDetailState _self;
  final $Res Function(_PotaSpotDetailState) _then;

  /// Create a copy of PotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? spot = null,
    Object? park = freezed,
    Object? distanceKm = freezed,
  }) {
    return _then(_PotaSpotDetailState(
      spot: null == spot
          ? _self.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as PotaSpot,
      park: freezed == park
          ? _self.park
          : park // ignore: cast_nullable_to_non_nullable
              as PotaPark?,
      distanceKm: freezed == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of PotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PotaSpotCopyWith<$Res> get spot {
    return $PotaSpotCopyWith<$Res>(_self.spot, (value) {
      return _then(_self.copyWith(spot: value));
    });
  }

  /// Create a copy of PotaSpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PotaParkCopyWith<$Res>? get park {
    if (_self.park == null) {
      return null;
    }

    return $PotaParkCopyWith<$Res>(_self.park!, (value) {
      return _then(_self.copyWith(park: value));
    });
  }
}

// dart format on
