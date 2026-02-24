// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'altimetric_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AltimetricProfile {
  List<AltimetricProfilePoint> get points;
  double get totalDistanceKm;
  int get numPoints;

  /// Create a copy of AltimetricProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AltimetricProfileCopyWith<AltimetricProfile> get copyWith =>
      _$AltimetricProfileCopyWithImpl<AltimetricProfile>(
          this as AltimetricProfile, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AltimetricProfile &&
            const DeepCollectionEquality().equals(other.points, points) &&
            (identical(other.totalDistanceKm, totalDistanceKm) ||
                other.totalDistanceKm == totalDistanceKm) &&
            (identical(other.numPoints, numPoints) ||
                other.numPoints == numPoints));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(points), totalDistanceKm, numPoints);

  @override
  String toString() {
    return 'AltimetricProfile(points: $points, totalDistanceKm: $totalDistanceKm, numPoints: $numPoints)';
  }
}

/// @nodoc
abstract mixin class $AltimetricProfileCopyWith<$Res> {
  factory $AltimetricProfileCopyWith(
          AltimetricProfile value, $Res Function(AltimetricProfile) _then) =
      _$AltimetricProfileCopyWithImpl;
  @useResult
  $Res call(
      {List<AltimetricProfilePoint> points,
      double totalDistanceKm,
      int numPoints});
}

/// @nodoc
class _$AltimetricProfileCopyWithImpl<$Res>
    implements $AltimetricProfileCopyWith<$Res> {
  _$AltimetricProfileCopyWithImpl(this._self, this._then);

  final AltimetricProfile _self;
  final $Res Function(AltimetricProfile) _then;

  /// Create a copy of AltimetricProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? totalDistanceKm = null,
    Object? numPoints = null,
  }) {
    return _then(_self.copyWith(
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<AltimetricProfilePoint>,
      totalDistanceKm: null == totalDistanceKm
          ? _self.totalDistanceKm
          : totalDistanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      numPoints: null == numPoints
          ? _self.numPoints
          : numPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [AltimetricProfile].
extension AltimetricProfilePatterns on AltimetricProfile {
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
    TResult Function(_AltimetricProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfile() when $default != null:
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
    TResult Function(_AltimetricProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfile():
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
    TResult? Function(_AltimetricProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfile() when $default != null:
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
    TResult Function(List<AltimetricProfilePoint> points,
            double totalDistanceKm, int numPoints)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfile() when $default != null:
        return $default(_that.points, _that.totalDistanceKm, _that.numPoints);
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
    TResult Function(List<AltimetricProfilePoint> points,
            double totalDistanceKm, int numPoints)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfile():
        return $default(_that.points, _that.totalDistanceKm, _that.numPoints);
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
    TResult? Function(List<AltimetricProfilePoint> points,
            double totalDistanceKm, int numPoints)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfile() when $default != null:
        return $default(_that.points, _that.totalDistanceKm, _that.numPoints);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AltimetricProfile implements AltimetricProfile {
  const _AltimetricProfile(
      {required final List<AltimetricProfilePoint> points,
      required this.totalDistanceKm,
      required this.numPoints})
      : _points = points;

  final List<AltimetricProfilePoint> _points;
  @override
  List<AltimetricProfilePoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final double totalDistanceKm;
  @override
  final int numPoints;

  /// Create a copy of AltimetricProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AltimetricProfileCopyWith<_AltimetricProfile> get copyWith =>
      __$AltimetricProfileCopyWithImpl<_AltimetricProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AltimetricProfile &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.totalDistanceKm, totalDistanceKm) ||
                other.totalDistanceKm == totalDistanceKm) &&
            (identical(other.numPoints, numPoints) ||
                other.numPoints == numPoints));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_points), totalDistanceKm, numPoints);

  @override
  String toString() {
    return 'AltimetricProfile(points: $points, totalDistanceKm: $totalDistanceKm, numPoints: $numPoints)';
  }
}

/// @nodoc
abstract mixin class _$AltimetricProfileCopyWith<$Res>
    implements $AltimetricProfileCopyWith<$Res> {
  factory _$AltimetricProfileCopyWith(
          _AltimetricProfile value, $Res Function(_AltimetricProfile) _then) =
      __$AltimetricProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<AltimetricProfilePoint> points,
      double totalDistanceKm,
      int numPoints});
}

/// @nodoc
class __$AltimetricProfileCopyWithImpl<$Res>
    implements _$AltimetricProfileCopyWith<$Res> {
  __$AltimetricProfileCopyWithImpl(this._self, this._then);

  final _AltimetricProfile _self;
  final $Res Function(_AltimetricProfile) _then;

  /// Create a copy of AltimetricProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? points = null,
    Object? totalDistanceKm = null,
    Object? numPoints = null,
  }) {
    return _then(_AltimetricProfile(
      points: null == points
          ? _self._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<AltimetricProfilePoint>,
      totalDistanceKm: null == totalDistanceKm
          ? _self.totalDistanceKm
          : totalDistanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      numPoints: null == numPoints
          ? _self.numPoints
          : numPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
