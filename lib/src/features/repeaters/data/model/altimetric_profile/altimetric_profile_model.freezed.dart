// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'altimetric_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AltimetricProfileModel {
  List<AltimetricProfilePointModel> get points;
  @JsonKey(name: 'total_distance_km')
  double get totalDistanceKm;
  @JsonKey(name: 'num_points')
  int get numPoints;

  /// Create a copy of AltimetricProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AltimetricProfileModelCopyWith<AltimetricProfileModel> get copyWith =>
      _$AltimetricProfileModelCopyWithImpl<AltimetricProfileModel>(
          this as AltimetricProfileModel, _$identity);

  /// Serializes this AltimetricProfileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AltimetricProfileModel &&
            const DeepCollectionEquality().equals(other.points, points) &&
            (identical(other.totalDistanceKm, totalDistanceKm) ||
                other.totalDistanceKm == totalDistanceKm) &&
            (identical(other.numPoints, numPoints) ||
                other.numPoints == numPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(points), totalDistanceKm, numPoints);

  @override
  String toString() {
    return 'AltimetricProfileModel(points: $points, totalDistanceKm: $totalDistanceKm, numPoints: $numPoints)';
  }
}

/// @nodoc
abstract mixin class $AltimetricProfileModelCopyWith<$Res> {
  factory $AltimetricProfileModelCopyWith(AltimetricProfileModel value,
          $Res Function(AltimetricProfileModel) _then) =
      _$AltimetricProfileModelCopyWithImpl;
  @useResult
  $Res call(
      {List<AltimetricProfilePointModel> points,
      @JsonKey(name: 'total_distance_km') double totalDistanceKm,
      @JsonKey(name: 'num_points') int numPoints});
}

/// @nodoc
class _$AltimetricProfileModelCopyWithImpl<$Res>
    implements $AltimetricProfileModelCopyWith<$Res> {
  _$AltimetricProfileModelCopyWithImpl(this._self, this._then);

  final AltimetricProfileModel _self;
  final $Res Function(AltimetricProfileModel) _then;

  /// Create a copy of AltimetricProfileModel
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
              as List<AltimetricProfilePointModel>,
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

/// Adds pattern-matching-related methods to [AltimetricProfileModel].
extension AltimetricProfileModelPatterns on AltimetricProfileModel {
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
    TResult Function(_AltimetricProfileModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfileModel() when $default != null:
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
    TResult Function(_AltimetricProfileModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfileModel():
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
    TResult? Function(_AltimetricProfileModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfileModel() when $default != null:
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
            List<AltimetricProfilePointModel> points,
            @JsonKey(name: 'total_distance_km') double totalDistanceKm,
            @JsonKey(name: 'num_points') int numPoints)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfileModel() when $default != null:
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
    TResult Function(
            List<AltimetricProfilePointModel> points,
            @JsonKey(name: 'total_distance_km') double totalDistanceKm,
            @JsonKey(name: 'num_points') int numPoints)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfileModel():
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
    TResult? Function(
            List<AltimetricProfilePointModel> points,
            @JsonKey(name: 'total_distance_km') double totalDistanceKm,
            @JsonKey(name: 'num_points') int numPoints)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfileModel() when $default != null:
        return $default(_that.points, _that.totalDistanceKm, _that.numPoints);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AltimetricProfileModel implements AltimetricProfileModel {
  const _AltimetricProfileModel(
      {required final List<AltimetricProfilePointModel> points,
      @JsonKey(name: 'total_distance_km') required this.totalDistanceKm,
      @JsonKey(name: 'num_points') required this.numPoints})
      : _points = points;
  factory _AltimetricProfileModel.fromJson(Map<String, dynamic> json) =>
      _$AltimetricProfileModelFromJson(json);

  final List<AltimetricProfilePointModel> _points;
  @override
  List<AltimetricProfilePointModel> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  @JsonKey(name: 'total_distance_km')
  final double totalDistanceKm;
  @override
  @JsonKey(name: 'num_points')
  final int numPoints;

  /// Create a copy of AltimetricProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AltimetricProfileModelCopyWith<_AltimetricProfileModel> get copyWith =>
      __$AltimetricProfileModelCopyWithImpl<_AltimetricProfileModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AltimetricProfileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AltimetricProfileModel &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.totalDistanceKm, totalDistanceKm) ||
                other.totalDistanceKm == totalDistanceKm) &&
            (identical(other.numPoints, numPoints) ||
                other.numPoints == numPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_points), totalDistanceKm, numPoints);

  @override
  String toString() {
    return 'AltimetricProfileModel(points: $points, totalDistanceKm: $totalDistanceKm, numPoints: $numPoints)';
  }
}

/// @nodoc
abstract mixin class _$AltimetricProfileModelCopyWith<$Res>
    implements $AltimetricProfileModelCopyWith<$Res> {
  factory _$AltimetricProfileModelCopyWith(_AltimetricProfileModel value,
          $Res Function(_AltimetricProfileModel) _then) =
      __$AltimetricProfileModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<AltimetricProfilePointModel> points,
      @JsonKey(name: 'total_distance_km') double totalDistanceKm,
      @JsonKey(name: 'num_points') int numPoints});
}

/// @nodoc
class __$AltimetricProfileModelCopyWithImpl<$Res>
    implements _$AltimetricProfileModelCopyWith<$Res> {
  __$AltimetricProfileModelCopyWithImpl(this._self, this._then);

  final _AltimetricProfileModel _self;
  final $Res Function(_AltimetricProfileModel) _then;

  /// Create a copy of AltimetricProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? points = null,
    Object? totalDistanceKm = null,
    Object? numPoints = null,
  }) {
    return _then(_AltimetricProfileModel(
      points: null == points
          ? _self._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<AltimetricProfilePointModel>,
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
