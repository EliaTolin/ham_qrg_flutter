// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bm_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BmDeviceModel {
  int get id;
  String? get callsign;
  String? get hardware;
  String? get firmware;
  String? get tx;
  String? get rx;
  @JsonKey(name: 'colorcode')
  int? get colorCode;
  int? get status;
  double? get lat;
  double? get lng;
  String? get city;
  String? get website;
  int? get pep;
  int? get agl;
  String? get description;
  @JsonKey(name: 'last_seen')
  String? get lastSeen;

  /// Create a copy of BmDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BmDeviceModelCopyWith<BmDeviceModel> get copyWith =>
      _$BmDeviceModelCopyWithImpl<BmDeviceModel>(
          this as BmDeviceModel, _$identity);

  /// Serializes this BmDeviceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BmDeviceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.hardware, hardware) ||
                other.hardware == hardware) &&
            (identical(other.firmware, firmware) ||
                other.firmware == firmware) &&
            (identical(other.tx, tx) || other.tx == tx) &&
            (identical(other.rx, rx) || other.rx == rx) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.pep, pep) || other.pep == pep) &&
            (identical(other.agl, agl) || other.agl == agl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      callsign,
      hardware,
      firmware,
      tx,
      rx,
      colorCode,
      status,
      lat,
      lng,
      city,
      website,
      pep,
      agl,
      description,
      lastSeen);

  @override
  String toString() {
    return 'BmDeviceModel(id: $id, callsign: $callsign, hardware: $hardware, firmware: $firmware, tx: $tx, rx: $rx, colorCode: $colorCode, status: $status, lat: $lat, lng: $lng, city: $city, website: $website, pep: $pep, agl: $agl, description: $description, lastSeen: $lastSeen)';
  }
}

/// @nodoc
abstract mixin class $BmDeviceModelCopyWith<$Res> {
  factory $BmDeviceModelCopyWith(
          BmDeviceModel value, $Res Function(BmDeviceModel) _then) =
      _$BmDeviceModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? callsign,
      String? hardware,
      String? firmware,
      String? tx,
      String? rx,
      @JsonKey(name: 'colorcode') int? colorCode,
      int? status,
      double? lat,
      double? lng,
      String? city,
      String? website,
      int? pep,
      int? agl,
      String? description,
      @JsonKey(name: 'last_seen') String? lastSeen});
}

/// @nodoc
class _$BmDeviceModelCopyWithImpl<$Res>
    implements $BmDeviceModelCopyWith<$Res> {
  _$BmDeviceModelCopyWithImpl(this._self, this._then);

  final BmDeviceModel _self;
  final $Res Function(BmDeviceModel) _then;

  /// Create a copy of BmDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? callsign = freezed,
    Object? hardware = freezed,
    Object? firmware = freezed,
    Object? tx = freezed,
    Object? rx = freezed,
    Object? colorCode = freezed,
    Object? status = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? city = freezed,
    Object? website = freezed,
    Object? pep = freezed,
    Object? agl = freezed,
    Object? description = freezed,
    Object? lastSeen = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      hardware: freezed == hardware
          ? _self.hardware
          : hardware // ignore: cast_nullable_to_non_nullable
              as String?,
      firmware: freezed == firmware
          ? _self.firmware
          : firmware // ignore: cast_nullable_to_non_nullable
              as String?,
      tx: freezed == tx
          ? _self.tx
          : tx // ignore: cast_nullable_to_non_nullable
              as String?,
      rx: freezed == rx
          ? _self.rx
          : rx // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      pep: freezed == pep
          ? _self.pep
          : pep // ignore: cast_nullable_to_non_nullable
              as int?,
      agl: freezed == agl
          ? _self.agl
          : agl // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: freezed == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BmDeviceModel].
extension BmDeviceModelPatterns on BmDeviceModel {
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
    TResult Function(_BmDeviceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BmDeviceModel() when $default != null:
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
    TResult Function(_BmDeviceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmDeviceModel():
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
    TResult? Function(_BmDeviceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmDeviceModel() when $default != null:
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
            int id,
            String? callsign,
            String? hardware,
            String? firmware,
            String? tx,
            String? rx,
            @JsonKey(name: 'colorcode') int? colorCode,
            int? status,
            double? lat,
            double? lng,
            String? city,
            String? website,
            int? pep,
            int? agl,
            String? description,
            @JsonKey(name: 'last_seen') String? lastSeen)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BmDeviceModel() when $default != null:
        return $default(
            _that.id,
            _that.callsign,
            _that.hardware,
            _that.firmware,
            _that.tx,
            _that.rx,
            _that.colorCode,
            _that.status,
            _that.lat,
            _that.lng,
            _that.city,
            _that.website,
            _that.pep,
            _that.agl,
            _that.description,
            _that.lastSeen);
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
            int id,
            String? callsign,
            String? hardware,
            String? firmware,
            String? tx,
            String? rx,
            @JsonKey(name: 'colorcode') int? colorCode,
            int? status,
            double? lat,
            double? lng,
            String? city,
            String? website,
            int? pep,
            int? agl,
            String? description,
            @JsonKey(name: 'last_seen') String? lastSeen)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmDeviceModel():
        return $default(
            _that.id,
            _that.callsign,
            _that.hardware,
            _that.firmware,
            _that.tx,
            _that.rx,
            _that.colorCode,
            _that.status,
            _that.lat,
            _that.lng,
            _that.city,
            _that.website,
            _that.pep,
            _that.agl,
            _that.description,
            _that.lastSeen);
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
            int id,
            String? callsign,
            String? hardware,
            String? firmware,
            String? tx,
            String? rx,
            @JsonKey(name: 'colorcode') int? colorCode,
            int? status,
            double? lat,
            double? lng,
            String? city,
            String? website,
            int? pep,
            int? agl,
            String? description,
            @JsonKey(name: 'last_seen') String? lastSeen)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmDeviceModel() when $default != null:
        return $default(
            _that.id,
            _that.callsign,
            _that.hardware,
            _that.firmware,
            _that.tx,
            _that.rx,
            _that.colorCode,
            _that.status,
            _that.lat,
            _that.lng,
            _that.city,
            _that.website,
            _that.pep,
            _that.agl,
            _that.description,
            _that.lastSeen);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BmDeviceModel implements BmDeviceModel {
  const _BmDeviceModel(
      {required this.id,
      this.callsign,
      this.hardware,
      this.firmware,
      this.tx,
      this.rx,
      @JsonKey(name: 'colorcode') this.colorCode,
      this.status,
      this.lat,
      this.lng,
      this.city,
      this.website,
      this.pep,
      this.agl,
      this.description,
      @JsonKey(name: 'last_seen') this.lastSeen});
  factory _BmDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$BmDeviceModelFromJson(json);

  @override
  final int id;
  @override
  final String? callsign;
  @override
  final String? hardware;
  @override
  final String? firmware;
  @override
  final String? tx;
  @override
  final String? rx;
  @override
  @JsonKey(name: 'colorcode')
  final int? colorCode;
  @override
  final int? status;
  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final String? city;
  @override
  final String? website;
  @override
  final int? pep;
  @override
  final int? agl;
  @override
  final String? description;
  @override
  @JsonKey(name: 'last_seen')
  final String? lastSeen;

  /// Create a copy of BmDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BmDeviceModelCopyWith<_BmDeviceModel> get copyWith =>
      __$BmDeviceModelCopyWithImpl<_BmDeviceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BmDeviceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BmDeviceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.hardware, hardware) ||
                other.hardware == hardware) &&
            (identical(other.firmware, firmware) ||
                other.firmware == firmware) &&
            (identical(other.tx, tx) || other.tx == tx) &&
            (identical(other.rx, rx) || other.rx == rx) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.pep, pep) || other.pep == pep) &&
            (identical(other.agl, agl) || other.agl == agl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      callsign,
      hardware,
      firmware,
      tx,
      rx,
      colorCode,
      status,
      lat,
      lng,
      city,
      website,
      pep,
      agl,
      description,
      lastSeen);

  @override
  String toString() {
    return 'BmDeviceModel(id: $id, callsign: $callsign, hardware: $hardware, firmware: $firmware, tx: $tx, rx: $rx, colorCode: $colorCode, status: $status, lat: $lat, lng: $lng, city: $city, website: $website, pep: $pep, agl: $agl, description: $description, lastSeen: $lastSeen)';
  }
}

/// @nodoc
abstract mixin class _$BmDeviceModelCopyWith<$Res>
    implements $BmDeviceModelCopyWith<$Res> {
  factory _$BmDeviceModelCopyWith(
          _BmDeviceModel value, $Res Function(_BmDeviceModel) _then) =
      __$BmDeviceModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? callsign,
      String? hardware,
      String? firmware,
      String? tx,
      String? rx,
      @JsonKey(name: 'colorcode') int? colorCode,
      int? status,
      double? lat,
      double? lng,
      String? city,
      String? website,
      int? pep,
      int? agl,
      String? description,
      @JsonKey(name: 'last_seen') String? lastSeen});
}

/// @nodoc
class __$BmDeviceModelCopyWithImpl<$Res>
    implements _$BmDeviceModelCopyWith<$Res> {
  __$BmDeviceModelCopyWithImpl(this._self, this._then);

  final _BmDeviceModel _self;
  final $Res Function(_BmDeviceModel) _then;

  /// Create a copy of BmDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? callsign = freezed,
    Object? hardware = freezed,
    Object? firmware = freezed,
    Object? tx = freezed,
    Object? rx = freezed,
    Object? colorCode = freezed,
    Object? status = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? city = freezed,
    Object? website = freezed,
    Object? pep = freezed,
    Object? agl = freezed,
    Object? description = freezed,
    Object? lastSeen = freezed,
  }) {
    return _then(_BmDeviceModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      hardware: freezed == hardware
          ? _self.hardware
          : hardware // ignore: cast_nullable_to_non_nullable
              as String?,
      firmware: freezed == firmware
          ? _self.firmware
          : firmware // ignore: cast_nullable_to_non_nullable
              as String?,
      tx: freezed == tx
          ? _self.tx
          : tx // ignore: cast_nullable_to_non_nullable
              as String?,
      rx: freezed == rx
          ? _self.rx
          : rx // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      pep: freezed == pep
          ? _self.pep
          : pep // ignore: cast_nullable_to_non_nullable
              as int?,
      agl: freezed == agl
          ? _self.agl
          : agl // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: freezed == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
