// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'altimetric_profile_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AltimetricProfilePoint {
  double get lat;
  double get lon;
  double get elevationM;
  double get distanceKm;

  /// Create a copy of AltimetricProfilePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AltimetricProfilePointCopyWith<AltimetricProfilePoint> get copyWith =>
      _$AltimetricProfilePointCopyWithImpl<AltimetricProfilePoint>(
          this as AltimetricProfilePoint, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AltimetricProfilePoint &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.elevationM, elevationM) ||
                other.elevationM == elevationM) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lon, elevationM, distanceKm);

  @override
  String toString() {
    return 'AltimetricProfilePoint(lat: $lat, lon: $lon, elevationM: $elevationM, distanceKm: $distanceKm)';
  }
}

/// @nodoc
abstract mixin class $AltimetricProfilePointCopyWith<$Res> {
  factory $AltimetricProfilePointCopyWith(AltimetricProfilePoint value,
          $Res Function(AltimetricProfilePoint) _then) =
      _$AltimetricProfilePointCopyWithImpl;
  @useResult
  $Res call({double lat, double lon, double elevationM, double distanceKm});
}

/// @nodoc
class _$AltimetricProfilePointCopyWithImpl<$Res>
    implements $AltimetricProfilePointCopyWith<$Res> {
  _$AltimetricProfilePointCopyWithImpl(this._self, this._then);

  final AltimetricProfilePoint _self;
  final $Res Function(AltimetricProfilePoint) _then;

  /// Create a copy of AltimetricProfilePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? elevationM = null,
    Object? distanceKm = null,
  }) {
    return _then(_self.copyWith(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      elevationM: null == elevationM
          ? _self.elevationM
          : elevationM // ignore: cast_nullable_to_non_nullable
              as double,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [AltimetricProfilePoint].
extension AltimetricProfilePointPatterns on AltimetricProfilePoint {
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
    TResult Function(_AltimetricProfilePoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePoint() when $default != null:
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
    TResult Function(_AltimetricProfilePoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePoint():
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
    TResult? Function(_AltimetricProfilePoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePoint() when $default != null:
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
            double lat, double lon, double elevationM, double distanceKm)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePoint() when $default != null:
        return $default(
            _that.lat, _that.lon, _that.elevationM, _that.distanceKm);
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
            double lat, double lon, double elevationM, double distanceKm)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePoint():
        return $default(
            _that.lat, _that.lon, _that.elevationM, _that.distanceKm);
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
            double lat, double lon, double elevationM, double distanceKm)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePoint() when $default != null:
        return $default(
            _that.lat, _that.lon, _that.elevationM, _that.distanceKm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AltimetricProfilePoint implements AltimetricProfilePoint {
  const _AltimetricProfilePoint(
      {required this.lat,
      required this.lon,
      required this.elevationM,
      required this.distanceKm});

  @override
  final double lat;
  @override
  final double lon;
  @override
  final double elevationM;
  @override
  final double distanceKm;

  /// Create a copy of AltimetricProfilePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AltimetricProfilePointCopyWith<_AltimetricProfilePoint> get copyWith =>
      __$AltimetricProfilePointCopyWithImpl<_AltimetricProfilePoint>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AltimetricProfilePoint &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.elevationM, elevationM) ||
                other.elevationM == elevationM) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lon, elevationM, distanceKm);

  @override
  String toString() {
    return 'AltimetricProfilePoint(lat: $lat, lon: $lon, elevationM: $elevationM, distanceKm: $distanceKm)';
  }
}

/// @nodoc
abstract mixin class _$AltimetricProfilePointCopyWith<$Res>
    implements $AltimetricProfilePointCopyWith<$Res> {
  factory _$AltimetricProfilePointCopyWith(_AltimetricProfilePoint value,
          $Res Function(_AltimetricProfilePoint) _then) =
      __$AltimetricProfilePointCopyWithImpl;
  @override
  @useResult
  $Res call({double lat, double lon, double elevationM, double distanceKm});
}

/// @nodoc
class __$AltimetricProfilePointCopyWithImpl<$Res>
    implements _$AltimetricProfilePointCopyWith<$Res> {
  __$AltimetricProfilePointCopyWithImpl(this._self, this._then);

  final _AltimetricProfilePoint _self;
  final $Res Function(_AltimetricProfilePoint) _then;

  /// Create a copy of AltimetricProfilePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? elevationM = null,
    Object? distanceKm = null,
  }) {
    return _then(_AltimetricProfilePoint(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      elevationM: null == elevationM
          ? _self.elevationM
          : elevationM // ignore: cast_nullable_to_non_nullable
              as double,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
