// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'altimetric_profile_point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AltimetricProfilePointModel {
  double get lat;
  double get lon;
  @JsonKey(name: 'elevation_m')
  double get elevationM;
  @JsonKey(name: 'distance_km')
  double get distanceKm;

  /// Create a copy of AltimetricProfilePointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AltimetricProfilePointModelCopyWith<AltimetricProfilePointModel>
      get copyWith => _$AltimetricProfilePointModelCopyWithImpl<
              AltimetricProfilePointModel>(
          this as AltimetricProfilePointModel, _$identity);

  /// Serializes this AltimetricProfilePointModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AltimetricProfilePointModel &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.elevationM, elevationM) ||
                other.elevationM == elevationM) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lon, elevationM, distanceKm);

  @override
  String toString() {
    return 'AltimetricProfilePointModel(lat: $lat, lon: $lon, elevationM: $elevationM, distanceKm: $distanceKm)';
  }
}

/// @nodoc
abstract mixin class $AltimetricProfilePointModelCopyWith<$Res> {
  factory $AltimetricProfilePointModelCopyWith(
          AltimetricProfilePointModel value,
          $Res Function(AltimetricProfilePointModel) _then) =
      _$AltimetricProfilePointModelCopyWithImpl;
  @useResult
  $Res call(
      {double lat,
      double lon,
      @JsonKey(name: 'elevation_m') double elevationM,
      @JsonKey(name: 'distance_km') double distanceKm});
}

/// @nodoc
class _$AltimetricProfilePointModelCopyWithImpl<$Res>
    implements $AltimetricProfilePointModelCopyWith<$Res> {
  _$AltimetricProfilePointModelCopyWithImpl(this._self, this._then);

  final AltimetricProfilePointModel _self;
  final $Res Function(AltimetricProfilePointModel) _then;

  /// Create a copy of AltimetricProfilePointModel
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

/// Adds pattern-matching-related methods to [AltimetricProfilePointModel].
extension AltimetricProfilePointModelPatterns on AltimetricProfilePointModel {
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
    TResult Function(_AltimetricProfilePointModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePointModel() when $default != null:
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
    TResult Function(_AltimetricProfilePointModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePointModel():
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
    TResult? Function(_AltimetricProfilePointModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePointModel() when $default != null:
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
            double lat,
            double lon,
            @JsonKey(name: 'elevation_m') double elevationM,
            @JsonKey(name: 'distance_km') double distanceKm)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePointModel() when $default != null:
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
            double lat,
            double lon,
            @JsonKey(name: 'elevation_m') double elevationM,
            @JsonKey(name: 'distance_km') double distanceKm)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePointModel():
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
            double lat,
            double lon,
            @JsonKey(name: 'elevation_m') double elevationM,
            @JsonKey(name: 'distance_km') double distanceKm)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AltimetricProfilePointModel() when $default != null:
        return $default(
            _that.lat, _that.lon, _that.elevationM, _that.distanceKm);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AltimetricProfilePointModel implements AltimetricProfilePointModel {
  const _AltimetricProfilePointModel(
      {required this.lat,
      required this.lon,
      @JsonKey(name: 'elevation_m') required this.elevationM,
      @JsonKey(name: 'distance_km') required this.distanceKm});
  factory _AltimetricProfilePointModel.fromJson(Map<String, dynamic> json) =>
      _$AltimetricProfilePointModelFromJson(json);

  @override
  final double lat;
  @override
  final double lon;
  @override
  @JsonKey(name: 'elevation_m')
  final double elevationM;
  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;

  /// Create a copy of AltimetricProfilePointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AltimetricProfilePointModelCopyWith<_AltimetricProfilePointModel>
      get copyWith => __$AltimetricProfilePointModelCopyWithImpl<
          _AltimetricProfilePointModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AltimetricProfilePointModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AltimetricProfilePointModel &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.elevationM, elevationM) ||
                other.elevationM == elevationM) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lon, elevationM, distanceKm);

  @override
  String toString() {
    return 'AltimetricProfilePointModel(lat: $lat, lon: $lon, elevationM: $elevationM, distanceKm: $distanceKm)';
  }
}

/// @nodoc
abstract mixin class _$AltimetricProfilePointModelCopyWith<$Res>
    implements $AltimetricProfilePointModelCopyWith<$Res> {
  factory _$AltimetricProfilePointModelCopyWith(
          _AltimetricProfilePointModel value,
          $Res Function(_AltimetricProfilePointModel) _then) =
      __$AltimetricProfilePointModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double lat,
      double lon,
      @JsonKey(name: 'elevation_m') double elevationM,
      @JsonKey(name: 'distance_km') double distanceKm});
}

/// @nodoc
class __$AltimetricProfilePointModelCopyWithImpl<$Res>
    implements _$AltimetricProfilePointModelCopyWith<$Res> {
  __$AltimetricProfilePointModelCopyWithImpl(this._self, this._then);

  final _AltimetricProfilePointModel _self;
  final $Res Function(_AltimetricProfilePointModel) _then;

  /// Create a copy of AltimetricProfilePointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? elevationM = null,
    Object? distanceKm = null,
  }) {
    return _then(_AltimetricProfilePointModel(
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
