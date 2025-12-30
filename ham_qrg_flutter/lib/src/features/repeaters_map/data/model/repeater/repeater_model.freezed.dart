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
  String? get callsign;
  String? get name;
  @JsonKey(name: 'node_number')
  int? get nodeNumber;
  @JsonKey(name: 'manager_callsign')
  String? get managerCallsign;
  @JsonKey(name: 'shift_hz')
  int? get shiftHz;
  @JsonKey(name: 'shift_raw')
  String? get shiftRaw;
  @JsonKey(name: 'tone_raw')
  String? get toneRaw;
  @JsonKey(name: 'ctcss_hz')
  double? get ctcssHz;
  String? get network;
  String? get region;
  @JsonKey(name: 'province_code')
  String? get provinceCode;
  String? get locality;
  String? get locator;
  double? get lat;
  double? get lon;
  @JsonKey(name: 'distance_m')
  double? get distanceM;

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
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nodeNumber, nodeNumber) ||
                other.nodeNumber == nodeNumber) &&
            (identical(other.managerCallsign, managerCallsign) ||
                other.managerCallsign == managerCallsign) &&
            (identical(other.shiftHz, shiftHz) || other.shiftHz == shiftHz) &&
            (identical(other.shiftRaw, shiftRaw) ||
                other.shiftRaw == shiftRaw) &&
            (identical(other.toneRaw, toneRaw) || other.toneRaw == toneRaw) &&
            (identical(other.ctcssHz, ctcssHz) || other.ctcssHz == ctcssHz) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.distanceM, distanceM) ||
                other.distanceM == distanceM));
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
        callsign,
        name,
        nodeNumber,
        managerCallsign,
        shiftHz,
        shiftRaw,
        toneRaw,
        ctcssHz,
        network,
        region,
        provinceCode,
        locality,
        locator,
        lat,
        lon,
        distanceM
      ]);

  @override
  String toString() {
    return 'RepeaterModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, frequencyHz: $frequencyHz, mode: $mode, callsign: $callsign, name: $name, nodeNumber: $nodeNumber, managerCallsign: $managerCallsign, shiftHz: $shiftHz, shiftRaw: $shiftRaw, toneRaw: $toneRaw, ctcssHz: $ctcssHz, network: $network, region: $region, provinceCode: $provinceCode, locality: $locality, locator: $locator, lat: $lat, lon: $lon, distanceM: $distanceM)';
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
      String? callsign,
      String? name,
      @JsonKey(name: 'node_number') int? nodeNumber,
      @JsonKey(name: 'manager_callsign') String? managerCallsign,
      @JsonKey(name: 'shift_hz') int? shiftHz,
      @JsonKey(name: 'shift_raw') String? shiftRaw,
      @JsonKey(name: 'tone_raw') String? toneRaw,
      @JsonKey(name: 'ctcss_hz') double? ctcssHz,
      String? network,
      String? region,
      @JsonKey(name: 'province_code') String? provinceCode,
      String? locality,
      String? locator,
      double? lat,
      double? lon,
      @JsonKey(name: 'distance_m') double? distanceM});
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
    Object? callsign = freezed,
    Object? name = freezed,
    Object? nodeNumber = freezed,
    Object? managerCallsign = freezed,
    Object? shiftHz = freezed,
    Object? shiftRaw = freezed,
    Object? toneRaw = freezed,
    Object? ctcssHz = freezed,
    Object? network = freezed,
    Object? region = freezed,
    Object? provinceCode = freezed,
    Object? locality = freezed,
    Object? locator = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? distanceM = freezed,
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
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nodeNumber: freezed == nodeNumber
          ? _self.nodeNumber
          : nodeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      managerCallsign: freezed == managerCallsign
          ? _self.managerCallsign
          : managerCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftHz: freezed == shiftHz
          ? _self.shiftHz
          : shiftHz // ignore: cast_nullable_to_non_nullable
              as int?,
      shiftRaw: freezed == shiftRaw
          ? _self.shiftRaw
          : shiftRaw // ignore: cast_nullable_to_non_nullable
              as String?,
      toneRaw: freezed == toneRaw
          ? _self.toneRaw
          : toneRaw // ignore: cast_nullable_to_non_nullable
              as String?,
      ctcssHz: freezed == ctcssHz
          ? _self.ctcssHz
          : ctcssHz // ignore: cast_nullable_to_non_nullable
              as double?,
      network: freezed == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
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
            String? callsign,
            String? name,
            @JsonKey(name: 'node_number') int? nodeNumber,
            @JsonKey(name: 'manager_callsign') String? managerCallsign,
            @JsonKey(name: 'shift_hz') int? shiftHz,
            @JsonKey(name: 'shift_raw') String? shiftRaw,
            @JsonKey(name: 'tone_raw') String? toneRaw,
            @JsonKey(name: 'ctcss_hz') double? ctcssHz,
            String? network,
            String? region,
            @JsonKey(name: 'province_code') String? provinceCode,
            String? locality,
            String? locator,
            double? lat,
            double? lon,
            @JsonKey(name: 'distance_m') double? distanceM)?
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
            _that.callsign,
            _that.name,
            _that.nodeNumber,
            _that.managerCallsign,
            _that.shiftHz,
            _that.shiftRaw,
            _that.toneRaw,
            _that.ctcssHz,
            _that.network,
            _that.region,
            _that.provinceCode,
            _that.locality,
            _that.locator,
            _that.lat,
            _that.lon,
            _that.distanceM);
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
            String? callsign,
            String? name,
            @JsonKey(name: 'node_number') int? nodeNumber,
            @JsonKey(name: 'manager_callsign') String? managerCallsign,
            @JsonKey(name: 'shift_hz') int? shiftHz,
            @JsonKey(name: 'shift_raw') String? shiftRaw,
            @JsonKey(name: 'tone_raw') String? toneRaw,
            @JsonKey(name: 'ctcss_hz') double? ctcssHz,
            String? network,
            String? region,
            @JsonKey(name: 'province_code') String? provinceCode,
            String? locality,
            String? locator,
            double? lat,
            double? lon,
            @JsonKey(name: 'distance_m') double? distanceM)
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
            _that.callsign,
            _that.name,
            _that.nodeNumber,
            _that.managerCallsign,
            _that.shiftHz,
            _that.shiftRaw,
            _that.toneRaw,
            _that.ctcssHz,
            _that.network,
            _that.region,
            _that.provinceCode,
            _that.locality,
            _that.locator,
            _that.lat,
            _that.lon,
            _that.distanceM);
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
            String? callsign,
            String? name,
            @JsonKey(name: 'node_number') int? nodeNumber,
            @JsonKey(name: 'manager_callsign') String? managerCallsign,
            @JsonKey(name: 'shift_hz') int? shiftHz,
            @JsonKey(name: 'shift_raw') String? shiftRaw,
            @JsonKey(name: 'tone_raw') String? toneRaw,
            @JsonKey(name: 'ctcss_hz') double? ctcssHz,
            String? network,
            String? region,
            @JsonKey(name: 'province_code') String? provinceCode,
            String? locality,
            String? locator,
            double? lat,
            double? lon,
            @JsonKey(name: 'distance_m') double? distanceM)?
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
            _that.callsign,
            _that.name,
            _that.nodeNumber,
            _that.managerCallsign,
            _that.shiftHz,
            _that.shiftRaw,
            _that.toneRaw,
            _that.ctcssHz,
            _that.network,
            _that.region,
            _that.provinceCode,
            _that.locality,
            _that.locator,
            _that.lat,
            _that.lon,
            _that.distanceM);
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
      this.callsign,
      this.name,
      @JsonKey(name: 'node_number') this.nodeNumber,
      @JsonKey(name: 'manager_callsign') this.managerCallsign,
      @JsonKey(name: 'shift_hz') this.shiftHz,
      @JsonKey(name: 'shift_raw') this.shiftRaw,
      @JsonKey(name: 'tone_raw') this.toneRaw,
      @JsonKey(name: 'ctcss_hz') this.ctcssHz,
      this.network,
      this.region,
      @JsonKey(name: 'province_code') this.provinceCode,
      this.locality,
      this.locator,
      this.lat,
      this.lon,
      @JsonKey(name: 'distance_m') this.distanceM});
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
  final String? callsign;
  @override
  final String? name;
  @override
  @JsonKey(name: 'node_number')
  final int? nodeNumber;
  @override
  @JsonKey(name: 'manager_callsign')
  final String? managerCallsign;
  @override
  @JsonKey(name: 'shift_hz')
  final int? shiftHz;
  @override
  @JsonKey(name: 'shift_raw')
  final String? shiftRaw;
  @override
  @JsonKey(name: 'tone_raw')
  final String? toneRaw;
  @override
  @JsonKey(name: 'ctcss_hz')
  final double? ctcssHz;
  @override
  final String? network;
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
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nodeNumber, nodeNumber) ||
                other.nodeNumber == nodeNumber) &&
            (identical(other.managerCallsign, managerCallsign) ||
                other.managerCallsign == managerCallsign) &&
            (identical(other.shiftHz, shiftHz) || other.shiftHz == shiftHz) &&
            (identical(other.shiftRaw, shiftRaw) ||
                other.shiftRaw == shiftRaw) &&
            (identical(other.toneRaw, toneRaw) || other.toneRaw == toneRaw) &&
            (identical(other.ctcssHz, ctcssHz) || other.ctcssHz == ctcssHz) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.distanceM, distanceM) ||
                other.distanceM == distanceM));
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
        callsign,
        name,
        nodeNumber,
        managerCallsign,
        shiftHz,
        shiftRaw,
        toneRaw,
        ctcssHz,
        network,
        region,
        provinceCode,
        locality,
        locator,
        lat,
        lon,
        distanceM
      ]);

  @override
  String toString() {
    return 'RepeaterModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, frequencyHz: $frequencyHz, mode: $mode, callsign: $callsign, name: $name, nodeNumber: $nodeNumber, managerCallsign: $managerCallsign, shiftHz: $shiftHz, shiftRaw: $shiftRaw, toneRaw: $toneRaw, ctcssHz: $ctcssHz, network: $network, region: $region, provinceCode: $provinceCode, locality: $locality, locator: $locator, lat: $lat, lon: $lon, distanceM: $distanceM)';
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
      String? callsign,
      String? name,
      @JsonKey(name: 'node_number') int? nodeNumber,
      @JsonKey(name: 'manager_callsign') String? managerCallsign,
      @JsonKey(name: 'shift_hz') int? shiftHz,
      @JsonKey(name: 'shift_raw') String? shiftRaw,
      @JsonKey(name: 'tone_raw') String? toneRaw,
      @JsonKey(name: 'ctcss_hz') double? ctcssHz,
      String? network,
      String? region,
      @JsonKey(name: 'province_code') String? provinceCode,
      String? locality,
      String? locator,
      double? lat,
      double? lon,
      @JsonKey(name: 'distance_m') double? distanceM});
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
    Object? callsign = freezed,
    Object? name = freezed,
    Object? nodeNumber = freezed,
    Object? managerCallsign = freezed,
    Object? shiftHz = freezed,
    Object? shiftRaw = freezed,
    Object? toneRaw = freezed,
    Object? ctcssHz = freezed,
    Object? network = freezed,
    Object? region = freezed,
    Object? provinceCode = freezed,
    Object? locality = freezed,
    Object? locator = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? distanceM = freezed,
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
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nodeNumber: freezed == nodeNumber
          ? _self.nodeNumber
          : nodeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      managerCallsign: freezed == managerCallsign
          ? _self.managerCallsign
          : managerCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftHz: freezed == shiftHz
          ? _self.shiftHz
          : shiftHz // ignore: cast_nullable_to_non_nullable
              as int?,
      shiftRaw: freezed == shiftRaw
          ? _self.shiftRaw
          : shiftRaw // ignore: cast_nullable_to_non_nullable
              as String?,
      toneRaw: freezed == toneRaw
          ? _self.toneRaw
          : toneRaw // ignore: cast_nullable_to_non_nullable
              as String?,
      ctcssHz: freezed == ctcssHz
          ? _self.ctcssHz
          : ctcssHz // ignore: cast_nullable_to_non_nullable
              as double?,
      network: freezed == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

// dart format on
