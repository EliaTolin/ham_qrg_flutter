// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterModel {
  String get id;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @JsonKey(name: 'frequency_hz')
  int get frequencyHz;
  String get mode;
  String get source;
  String? get callsign;
  String? get name;
  String? get manager;
  @JsonKey(name: 'shift_hz')
  int? get shiftHz;
  @JsonKey(name: 'shift_raw')
  String? get shiftRaw;
  String? get region;
  @JsonKey(name: 'province_code')
  String? get provinceCode;
  String? get locality;
  String? get locator;
  double? get lat;
  double? get lon;
  @JsonKey(name: 'distance_m')
  double? get distanceM;
  @JsonKey(name: 'accesses', fromJson: _accessesFromJson)
  List<RepeaterAccessModel>? get accesses;

  /// Create a copy of RepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterModelCopyWith<RepeaterModel> get copyWith =>
      _$RepeaterModelCopyWithImpl<RepeaterModel>(
          this as RepeaterModel, _$identity);

  /// Serializes this RepeaterModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.frequencyHz, frequencyHz) ||
                other.frequencyHz == frequencyHz) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.shiftHz, shiftHz) || other.shiftHz == shiftHz) &&
            (identical(other.shiftRaw, shiftRaw) ||
                other.shiftRaw == shiftRaw) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.distanceM, distanceM) ||
                other.distanceM == distanceM) &&
            const DeepCollectionEquality().equals(other.accesses, accesses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        updatedAt,
        frequencyHz,
        mode,
        source,
        callsign,
        name,
        manager,
        shiftHz,
        shiftRaw,
        region,
        provinceCode,
        locality,
        locator,
        lat,
        lon,
        distanceM,
        const DeepCollectionEquality().hash(accesses)
      ]);

  @override
  String toString() {
    return 'RepeaterModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, frequencyHz: $frequencyHz, mode: $mode, source: $source, callsign: $callsign, name: $name, manager: $manager, shiftHz: $shiftHz, shiftRaw: $shiftRaw, region: $region, provinceCode: $provinceCode, locality: $locality, locator: $locator, lat: $lat, lon: $lon, distanceM: $distanceM, accesses: $accesses)';
  }
}

/// @nodoc
abstract mixin class $RepeaterModelCopyWith<$Res> {
  factory $RepeaterModelCopyWith(
          RepeaterModel value, $Res Function(RepeaterModel) _then) =
      _$RepeaterModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'frequency_hz') int frequencyHz,
      String mode,
      String source,
      String? callsign,
      String? name,
      String? manager,
      @JsonKey(name: 'shift_hz') int? shiftHz,
      @JsonKey(name: 'shift_raw') String? shiftRaw,
      String? region,
      @JsonKey(name: 'province_code') String? provinceCode,
      String? locality,
      String? locator,
      double? lat,
      double? lon,
      @JsonKey(name: 'distance_m') double? distanceM,
      @JsonKey(name: 'accesses', fromJson: _accessesFromJson)
      List<RepeaterAccessModel>? accesses});
}

/// @nodoc
class _$RepeaterModelCopyWithImpl<$Res>
    implements $RepeaterModelCopyWith<$Res> {
  _$RepeaterModelCopyWithImpl(this._self, this._then);

  final RepeaterModel _self;
  final $Res Function(RepeaterModel) _then;

  /// Create a copy of RepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? frequencyHz = null,
    Object? mode = null,
    Object? source = null,
    Object? callsign = freezed,
    Object? name = freezed,
    Object? manager = freezed,
    Object? shiftHz = freezed,
    Object? shiftRaw = freezed,
    Object? region = freezed,
    Object? provinceCode = freezed,
    Object? locality = freezed,
    Object? locator = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? distanceM = freezed,
    Object? accesses = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyHz: null == frequencyHz
          ? _self.frequencyHz
          : frequencyHz // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      manager: freezed == manager
          ? _self.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftHz: freezed == shiftHz
          ? _self.shiftHz
          : shiftHz // ignore: cast_nullable_to_non_nullable
              as int?,
      shiftRaw: freezed == shiftRaw
          ? _self.shiftRaw
          : shiftRaw // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceCode: freezed == provinceCode
          ? _self.provinceCode
          : provinceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _self.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      locator: freezed == locator
          ? _self.locator
          : locator // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceM: freezed == distanceM
          ? _self.distanceM
          : distanceM // ignore: cast_nullable_to_non_nullable
              as double?,
      accesses: freezed == accesses
          ? _self.accesses
          : accesses // ignore: cast_nullable_to_non_nullable
              as List<RepeaterAccessModel>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RepeaterModel].
extension RepeaterModelPatterns on RepeaterModel {
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
    TResult Function(_RepeaterModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterModel() when $default != null:
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
    TResult Function(_RepeaterModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterModel():
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
    TResult? Function(_RepeaterModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterModel() when $default != null:
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
            String id,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            @JsonKey(name: 'frequency_hz') int frequencyHz,
            String mode,
            String source,
            String? callsign,
            String? name,
            String? manager,
            @JsonKey(name: 'shift_hz') int? shiftHz,
            @JsonKey(name: 'shift_raw') String? shiftRaw,
            String? region,
            @JsonKey(name: 'province_code') String? provinceCode,
            String? locality,
            String? locator,
            double? lat,
            double? lon,
            @JsonKey(name: 'distance_m') double? distanceM,
            @JsonKey(name: 'accesses', fromJson: _accessesFromJson)
            List<RepeaterAccessModel>? accesses)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterModel() when $default != null:
        return $default(
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.frequencyHz,
            _that.mode,
            _that.source,
            _that.callsign,
            _that.name,
            _that.manager,
            _that.shiftHz,
            _that.shiftRaw,
            _that.region,
            _that.provinceCode,
            _that.locality,
            _that.locator,
            _that.lat,
            _that.lon,
            _that.distanceM,
            _that.accesses);
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
            String id,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            @JsonKey(name: 'frequency_hz') int frequencyHz,
            String mode,
            String source,
            String? callsign,
            String? name,
            String? manager,
            @JsonKey(name: 'shift_hz') int? shiftHz,
            @JsonKey(name: 'shift_raw') String? shiftRaw,
            String? region,
            @JsonKey(name: 'province_code') String? provinceCode,
            String? locality,
            String? locator,
            double? lat,
            double? lon,
            @JsonKey(name: 'distance_m') double? distanceM,
            @JsonKey(name: 'accesses', fromJson: _accessesFromJson)
            List<RepeaterAccessModel>? accesses)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterModel():
        return $default(
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.frequencyHz,
            _that.mode,
            _that.source,
            _that.callsign,
            _that.name,
            _that.manager,
            _that.shiftHz,
            _that.shiftRaw,
            _that.region,
            _that.provinceCode,
            _that.locality,
            _that.locator,
            _that.lat,
            _that.lon,
            _that.distanceM,
            _that.accesses);
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
            String id,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            @JsonKey(name: 'frequency_hz') int frequencyHz,
            String mode,
            String source,
            String? callsign,
            String? name,
            String? manager,
            @JsonKey(name: 'shift_hz') int? shiftHz,
            @JsonKey(name: 'shift_raw') String? shiftRaw,
            String? region,
            @JsonKey(name: 'province_code') String? provinceCode,
            String? locality,
            String? locator,
            double? lat,
            double? lon,
            @JsonKey(name: 'distance_m') double? distanceM,
            @JsonKey(name: 'accesses', fromJson: _accessesFromJson)
            List<RepeaterAccessModel>? accesses)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterModel() when $default != null:
        return $default(
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.frequencyHz,
            _that.mode,
            _that.source,
            _that.callsign,
            _that.name,
            _that.manager,
            _that.shiftHz,
            _that.shiftRaw,
            _that.region,
            _that.provinceCode,
            _that.locality,
            _that.locator,
            _that.lat,
            _that.lon,
            _that.distanceM,
            _that.accesses);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RepeaterModel implements RepeaterModel {
  const _RepeaterModel(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'frequency_hz') required this.frequencyHz,
      required this.mode,
      required this.source,
      this.callsign,
      this.name,
      this.manager,
      @JsonKey(name: 'shift_hz') this.shiftHz,
      @JsonKey(name: 'shift_raw') this.shiftRaw,
      this.region,
      @JsonKey(name: 'province_code') this.provinceCode,
      this.locality,
      this.locator,
      this.lat,
      this.lon,
      @JsonKey(name: 'distance_m') this.distanceM,
      @JsonKey(name: 'accesses', fromJson: _accessesFromJson)
      final List<RepeaterAccessModel>? accesses})
      : _accesses = accesses;
  factory _RepeaterModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'frequency_hz')
  final int frequencyHz;
  @override
  final String mode;
  @override
  final String source;
  @override
  final String? callsign;
  @override
  final String? name;
  @override
  final String? manager;
  @override
  @JsonKey(name: 'shift_hz')
  final int? shiftHz;
  @override
  @JsonKey(name: 'shift_raw')
  final String? shiftRaw;
  @override
  final String? region;
  @override
  @JsonKey(name: 'province_code')
  final String? provinceCode;
  @override
  final String? locality;
  @override
  final String? locator;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  @JsonKey(name: 'distance_m')
  final double? distanceM;
  final List<RepeaterAccessModel>? _accesses;
  @override
  @JsonKey(name: 'accesses', fromJson: _accessesFromJson)
  List<RepeaterAccessModel>? get accesses {
    final value = _accesses;
    if (value == null) return null;
    if (_accesses is EqualUnmodifiableListView) return _accesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of RepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterModelCopyWith<_RepeaterModel> get copyWith =>
      __$RepeaterModelCopyWithImpl<_RepeaterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RepeaterModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.frequencyHz, frequencyHz) ||
                other.frequencyHz == frequencyHz) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.shiftHz, shiftHz) || other.shiftHz == shiftHz) &&
            (identical(other.shiftRaw, shiftRaw) ||
                other.shiftRaw == shiftRaw) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.distanceM, distanceM) ||
                other.distanceM == distanceM) &&
            const DeepCollectionEquality().equals(other._accesses, _accesses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        updatedAt,
        frequencyHz,
        mode,
        source,
        callsign,
        name,
        manager,
        shiftHz,
        shiftRaw,
        region,
        provinceCode,
        locality,
        locator,
        lat,
        lon,
        distanceM,
        const DeepCollectionEquality().hash(_accesses)
      ]);

  @override
  String toString() {
    return 'RepeaterModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, frequencyHz: $frequencyHz, mode: $mode, source: $source, callsign: $callsign, name: $name, manager: $manager, shiftHz: $shiftHz, shiftRaw: $shiftRaw, region: $region, provinceCode: $provinceCode, locality: $locality, locator: $locator, lat: $lat, lon: $lon, distanceM: $distanceM, accesses: $accesses)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterModelCopyWith<$Res>
    implements $RepeaterModelCopyWith<$Res> {
  factory _$RepeaterModelCopyWith(
          _RepeaterModel value, $Res Function(_RepeaterModel) _then) =
      __$RepeaterModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'frequency_hz') int frequencyHz,
      String mode,
      String source,
      String? callsign,
      String? name,
      String? manager,
      @JsonKey(name: 'shift_hz') int? shiftHz,
      @JsonKey(name: 'shift_raw') String? shiftRaw,
      String? region,
      @JsonKey(name: 'province_code') String? provinceCode,
      String? locality,
      String? locator,
      double? lat,
      double? lon,
      @JsonKey(name: 'distance_m') double? distanceM,
      @JsonKey(name: 'accesses', fromJson: _accessesFromJson)
      List<RepeaterAccessModel>? accesses});
}

/// @nodoc
class __$RepeaterModelCopyWithImpl<$Res>
    implements _$RepeaterModelCopyWith<$Res> {
  __$RepeaterModelCopyWithImpl(this._self, this._then);

  final _RepeaterModel _self;
  final $Res Function(_RepeaterModel) _then;

  /// Create a copy of RepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? frequencyHz = null,
    Object? mode = null,
    Object? source = null,
    Object? callsign = freezed,
    Object? name = freezed,
    Object? manager = freezed,
    Object? shiftHz = freezed,
    Object? shiftRaw = freezed,
    Object? region = freezed,
    Object? provinceCode = freezed,
    Object? locality = freezed,
    Object? locator = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? distanceM = freezed,
    Object? accesses = freezed,
  }) {
    return _then(_RepeaterModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyHz: null == frequencyHz
          ? _self.frequencyHz
          : frequencyHz // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      manager: freezed == manager
          ? _self.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftHz: freezed == shiftHz
          ? _self.shiftHz
          : shiftHz // ignore: cast_nullable_to_non_nullable
              as int?,
      shiftRaw: freezed == shiftRaw
          ? _self.shiftRaw
          : shiftRaw // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceCode: freezed == provinceCode
          ? _self.provinceCode
          : provinceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _self.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      locator: freezed == locator
          ? _self.locator
          : locator // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceM: freezed == distanceM
          ? _self.distanceM
          : distanceM // ignore: cast_nullable_to_non_nullable
              as double?,
      accesses: freezed == accesses
          ? _self._accesses
          : accesses // ignore: cast_nullable_to_non_nullable
              as List<RepeaterAccessModel>?,
    ));
  }
}

// dart format on
