// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bm_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BmDevice {
  int get id;
  String? get callsign;
  String? get hardware;
  String? get firmware;
  String? get txFrequency;
  String? get rxFrequency;
  int? get colorCode;
  int? get status;
  double? get latitude;
  double? get longitude;
  String? get city;
  String? get website;

  /// Power in watts
  int? get powerWatts;

  /// Antenna height above ground level (m)
  int? get antennaHeightM;
  String? get description;
  DateTime? get lastSeen;

  /// Create a copy of BmDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BmDeviceCopyWith<BmDevice> get copyWith =>
      _$BmDeviceCopyWithImpl<BmDevice>(this as BmDevice, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BmDevice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.hardware, hardware) ||
                other.hardware == hardware) &&
            (identical(other.firmware, firmware) ||
                other.firmware == firmware) &&
            (identical(other.txFrequency, txFrequency) ||
                other.txFrequency == txFrequency) &&
            (identical(other.rxFrequency, rxFrequency) ||
                other.rxFrequency == rxFrequency) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.powerWatts, powerWatts) ||
                other.powerWatts == powerWatts) &&
            (identical(other.antennaHeightM, antennaHeightM) ||
                other.antennaHeightM == antennaHeightM) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      callsign,
      hardware,
      firmware,
      txFrequency,
      rxFrequency,
      colorCode,
      status,
      latitude,
      longitude,
      city,
      website,
      powerWatts,
      antennaHeightM,
      description,
      lastSeen);

  @override
  String toString() {
    return 'BmDevice(id: $id, callsign: $callsign, hardware: $hardware, firmware: $firmware, txFrequency: $txFrequency, rxFrequency: $rxFrequency, colorCode: $colorCode, status: $status, latitude: $latitude, longitude: $longitude, city: $city, website: $website, powerWatts: $powerWatts, antennaHeightM: $antennaHeightM, description: $description, lastSeen: $lastSeen)';
  }
}

/// @nodoc
abstract mixin class $BmDeviceCopyWith<$Res> {
  factory $BmDeviceCopyWith(BmDevice value, $Res Function(BmDevice) _then) =
      _$BmDeviceCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? callsign,
      String? hardware,
      String? firmware,
      String? txFrequency,
      String? rxFrequency,
      int? colorCode,
      int? status,
      double? latitude,
      double? longitude,
      String? city,
      String? website,
      int? powerWatts,
      int? antennaHeightM,
      String? description,
      DateTime? lastSeen});
}

/// @nodoc
class _$BmDeviceCopyWithImpl<$Res> implements $BmDeviceCopyWith<$Res> {
  _$BmDeviceCopyWithImpl(this._self, this._then);

  final BmDevice _self;
  final $Res Function(BmDevice) _then;

  /// Create a copy of BmDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? callsign = freezed,
    Object? hardware = freezed,
    Object? firmware = freezed,
    Object? txFrequency = freezed,
    Object? rxFrequency = freezed,
    Object? colorCode = freezed,
    Object? status = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? city = freezed,
    Object? website = freezed,
    Object? powerWatts = freezed,
    Object? antennaHeightM = freezed,
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
      txFrequency: freezed == txFrequency
          ? _self.txFrequency
          : txFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      rxFrequency: freezed == rxFrequency
          ? _self.rxFrequency
          : rxFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      powerWatts: freezed == powerWatts
          ? _self.powerWatts
          : powerWatts // ignore: cast_nullable_to_non_nullable
              as int?,
      antennaHeightM: freezed == antennaHeightM
          ? _self.antennaHeightM
          : antennaHeightM // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: freezed == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BmDevice].
extension BmDevicePatterns on BmDevice {
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
    TResult Function(_BmDevice value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BmDevice() when $default != null:
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
    TResult Function(_BmDevice value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmDevice():
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
    TResult? Function(_BmDevice value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmDevice() when $default != null:
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
            String? txFrequency,
            String? rxFrequency,
            int? colorCode,
            int? status,
            double? latitude,
            double? longitude,
            String? city,
            String? website,
            int? powerWatts,
            int? antennaHeightM,
            String? description,
            DateTime? lastSeen)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BmDevice() when $default != null:
        return $default(
            _that.id,
            _that.callsign,
            _that.hardware,
            _that.firmware,
            _that.txFrequency,
            _that.rxFrequency,
            _that.colorCode,
            _that.status,
            _that.latitude,
            _that.longitude,
            _that.city,
            _that.website,
            _that.powerWatts,
            _that.antennaHeightM,
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
            String? txFrequency,
            String? rxFrequency,
            int? colorCode,
            int? status,
            double? latitude,
            double? longitude,
            String? city,
            String? website,
            int? powerWatts,
            int? antennaHeightM,
            String? description,
            DateTime? lastSeen)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmDevice():
        return $default(
            _that.id,
            _that.callsign,
            _that.hardware,
            _that.firmware,
            _that.txFrequency,
            _that.rxFrequency,
            _that.colorCode,
            _that.status,
            _that.latitude,
            _that.longitude,
            _that.city,
            _that.website,
            _that.powerWatts,
            _that.antennaHeightM,
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
            String? txFrequency,
            String? rxFrequency,
            int? colorCode,
            int? status,
            double? latitude,
            double? longitude,
            String? city,
            String? website,
            int? powerWatts,
            int? antennaHeightM,
            String? description,
            DateTime? lastSeen)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmDevice() when $default != null:
        return $default(
            _that.id,
            _that.callsign,
            _that.hardware,
            _that.firmware,
            _that.txFrequency,
            _that.rxFrequency,
            _that.colorCode,
            _that.status,
            _that.latitude,
            _that.longitude,
            _that.city,
            _that.website,
            _that.powerWatts,
            _that.antennaHeightM,
            _that.description,
            _that.lastSeen);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BmDevice implements BmDevice {
  const _BmDevice(
      {required this.id,
      this.callsign,
      this.hardware,
      this.firmware,
      this.txFrequency,
      this.rxFrequency,
      this.colorCode,
      this.status,
      this.latitude,
      this.longitude,
      this.city,
      this.website,
      this.powerWatts,
      this.antennaHeightM,
      this.description,
      this.lastSeen});

  @override
  final int id;
  @override
  final String? callsign;
  @override
  final String? hardware;
  @override
  final String? firmware;
  @override
  final String? txFrequency;
  @override
  final String? rxFrequency;
  @override
  final int? colorCode;
  @override
  final int? status;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? city;
  @override
  final String? website;

  /// Power in watts
  @override
  final int? powerWatts;

  /// Antenna height above ground level (m)
  @override
  final int? antennaHeightM;
  @override
  final String? description;
  @override
  final DateTime? lastSeen;

  /// Create a copy of BmDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BmDeviceCopyWith<_BmDevice> get copyWith =>
      __$BmDeviceCopyWithImpl<_BmDevice>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BmDevice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.hardware, hardware) ||
                other.hardware == hardware) &&
            (identical(other.firmware, firmware) ||
                other.firmware == firmware) &&
            (identical(other.txFrequency, txFrequency) ||
                other.txFrequency == txFrequency) &&
            (identical(other.rxFrequency, rxFrequency) ||
                other.rxFrequency == rxFrequency) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.powerWatts, powerWatts) ||
                other.powerWatts == powerWatts) &&
            (identical(other.antennaHeightM, antennaHeightM) ||
                other.antennaHeightM == antennaHeightM) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      callsign,
      hardware,
      firmware,
      txFrequency,
      rxFrequency,
      colorCode,
      status,
      latitude,
      longitude,
      city,
      website,
      powerWatts,
      antennaHeightM,
      description,
      lastSeen);

  @override
  String toString() {
    return 'BmDevice(id: $id, callsign: $callsign, hardware: $hardware, firmware: $firmware, txFrequency: $txFrequency, rxFrequency: $rxFrequency, colorCode: $colorCode, status: $status, latitude: $latitude, longitude: $longitude, city: $city, website: $website, powerWatts: $powerWatts, antennaHeightM: $antennaHeightM, description: $description, lastSeen: $lastSeen)';
  }
}

/// @nodoc
abstract mixin class _$BmDeviceCopyWith<$Res>
    implements $BmDeviceCopyWith<$Res> {
  factory _$BmDeviceCopyWith(_BmDevice value, $Res Function(_BmDevice) _then) =
      __$BmDeviceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? callsign,
      String? hardware,
      String? firmware,
      String? txFrequency,
      String? rxFrequency,
      int? colorCode,
      int? status,
      double? latitude,
      double? longitude,
      String? city,
      String? website,
      int? powerWatts,
      int? antennaHeightM,
      String? description,
      DateTime? lastSeen});
}

/// @nodoc
class __$BmDeviceCopyWithImpl<$Res> implements _$BmDeviceCopyWith<$Res> {
  __$BmDeviceCopyWithImpl(this._self, this._then);

  final _BmDevice _self;
  final $Res Function(_BmDevice) _then;

  /// Create a copy of BmDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? callsign = freezed,
    Object? hardware = freezed,
    Object? firmware = freezed,
    Object? txFrequency = freezed,
    Object? rxFrequency = freezed,
    Object? colorCode = freezed,
    Object? status = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? city = freezed,
    Object? website = freezed,
    Object? powerWatts = freezed,
    Object? antennaHeightM = freezed,
    Object? description = freezed,
    Object? lastSeen = freezed,
  }) {
    return _then(_BmDevice(
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
      txFrequency: freezed == txFrequency
          ? _self.txFrequency
          : txFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      rxFrequency: freezed == rxFrequency
          ? _self.rxFrequency
          : rxFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      powerWatts: freezed == powerWatts
          ? _self.powerWatts
          : powerWatts // ignore: cast_nullable_to_non_nullable
              as int?,
      antennaHeightM: freezed == antennaHeightM
          ? _self.antennaHeightM
          : antennaHeightM // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: freezed == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
