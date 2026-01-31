// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Repeater {
  String get id;
  DateTime get createdAt;
  DateTime get updatedAt;
  int get frequencyHz;
  RepeaterMode get mode;
  String get source;
  String? get callsign;
  String? get name;
  String? get manager;
  int? get shiftHz;
  String? get shiftRaw;
  String? get region;
  String? get provinceCode;
  String? get locality;
  String? get locator;
  double? get latitude;
  double? get longitude;
  double? get distanceMeters;
  List<RepeaterAccess> get accesses;

  /// Create a copy of Repeater
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<Repeater> get copyWith =>
      _$RepeaterCopyWithImpl<Repeater>(this as Repeater, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Repeater &&
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
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            const DeepCollectionEquality().equals(other.accesses, accesses));
  }

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
        latitude,
        longitude,
        distanceMeters,
        const DeepCollectionEquality().hash(accesses)
      ]);

  @override
  String toString() {
    return 'Repeater(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, frequencyHz: $frequencyHz, mode: $mode, source: $source, callsign: $callsign, name: $name, manager: $manager, shiftHz: $shiftHz, shiftRaw: $shiftRaw, region: $region, provinceCode: $provinceCode, locality: $locality, locator: $locator, latitude: $latitude, longitude: $longitude, distanceMeters: $distanceMeters, accesses: $accesses)';
  }
}

/// @nodoc
abstract mixin class $RepeaterCopyWith<$Res> {
  factory $RepeaterCopyWith(Repeater value, $Res Function(Repeater) _then) =
      _$RepeaterCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      int frequencyHz,
      RepeaterMode mode,
      String source,
      String? callsign,
      String? name,
      String? manager,
      int? shiftHz,
      String? shiftRaw,
      String? region,
      String? provinceCode,
      String? locality,
      String? locator,
      double? latitude,
      double? longitude,
      double? distanceMeters,
      List<RepeaterAccess> accesses});
}

/// @nodoc
class _$RepeaterCopyWithImpl<$Res> implements $RepeaterCopyWith<$Res> {
  _$RepeaterCopyWithImpl(this._self, this._then);

  final Repeater _self;
  final $Res Function(Repeater) _then;

  /// Create a copy of Repeater
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
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? distanceMeters = freezed,
    Object? accesses = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frequencyHz: null == frequencyHz
          ? _self.frequencyHz
          : frequencyHz // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as RepeaterMode,
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
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceMeters: freezed == distanceMeters
          ? _self.distanceMeters
          : distanceMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      accesses: null == accesses
          ? _self.accesses
          : accesses // ignore: cast_nullable_to_non_nullable
              as List<RepeaterAccess>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Repeater].
extension RepeaterPatterns on Repeater {
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
    TResult Function(_Repeater value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Repeater() when $default != null:
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
    TResult Function(_Repeater value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Repeater():
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
    TResult? Function(_Repeater value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Repeater() when $default != null:
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
            DateTime createdAt,
            DateTime updatedAt,
            int frequencyHz,
            RepeaterMode mode,
            String source,
            String? callsign,
            String? name,
            String? manager,
            int? shiftHz,
            String? shiftRaw,
            String? region,
            String? provinceCode,
            String? locality,
            String? locator,
            double? latitude,
            double? longitude,
            double? distanceMeters,
            List<RepeaterAccess> accesses)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Repeater() when $default != null:
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
            _that.latitude,
            _that.longitude,
            _that.distanceMeters,
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
            DateTime createdAt,
            DateTime updatedAt,
            int frequencyHz,
            RepeaterMode mode,
            String source,
            String? callsign,
            String? name,
            String? manager,
            int? shiftHz,
            String? shiftRaw,
            String? region,
            String? provinceCode,
            String? locality,
            String? locator,
            double? latitude,
            double? longitude,
            double? distanceMeters,
            List<RepeaterAccess> accesses)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Repeater():
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
            _that.latitude,
            _that.longitude,
            _that.distanceMeters,
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
            DateTime createdAt,
            DateTime updatedAt,
            int frequencyHz,
            RepeaterMode mode,
            String source,
            String? callsign,
            String? name,
            String? manager,
            int? shiftHz,
            String? shiftRaw,
            String? region,
            String? provinceCode,
            String? locality,
            String? locator,
            double? latitude,
            double? longitude,
            double? distanceMeters,
            List<RepeaterAccess> accesses)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Repeater() when $default != null:
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
            _that.latitude,
            _that.longitude,
            _that.distanceMeters,
            _that.accesses);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Repeater implements Repeater {
  const _Repeater(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.frequencyHz,
      required this.mode,
      required this.source,
      this.callsign,
      this.name,
      this.manager,
      this.shiftHz,
      this.shiftRaw,
      this.region,
      this.provinceCode,
      this.locality,
      this.locator,
      this.latitude,
      this.longitude,
      this.distanceMeters,
      final List<RepeaterAccess> accesses = const []})
      : _accesses = accesses;

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int frequencyHz;
  @override
  final RepeaterMode mode;
  @override
  final String source;
  @override
  final String? callsign;
  @override
  final String? name;
  @override
  final String? manager;
  @override
  final int? shiftHz;
  @override
  final String? shiftRaw;
  @override
  final String? region;
  @override
  final String? provinceCode;
  @override
  final String? locality;
  @override
  final String? locator;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? distanceMeters;
  final List<RepeaterAccess> _accesses;
  @override
  @JsonKey()
  List<RepeaterAccess> get accesses {
    if (_accesses is EqualUnmodifiableListView) return _accesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accesses);
  }

  /// Create a copy of Repeater
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterCopyWith<_Repeater> get copyWith =>
      __$RepeaterCopyWithImpl<_Repeater>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Repeater &&
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
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            const DeepCollectionEquality().equals(other._accesses, _accesses));
  }

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
        latitude,
        longitude,
        distanceMeters,
        const DeepCollectionEquality().hash(_accesses)
      ]);

  @override
  String toString() {
    return 'Repeater(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, frequencyHz: $frequencyHz, mode: $mode, source: $source, callsign: $callsign, name: $name, manager: $manager, shiftHz: $shiftHz, shiftRaw: $shiftRaw, region: $region, provinceCode: $provinceCode, locality: $locality, locator: $locator, latitude: $latitude, longitude: $longitude, distanceMeters: $distanceMeters, accesses: $accesses)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterCopyWith<$Res>
    implements $RepeaterCopyWith<$Res> {
  factory _$RepeaterCopyWith(_Repeater value, $Res Function(_Repeater) _then) =
      __$RepeaterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      int frequencyHz,
      RepeaterMode mode,
      String source,
      String? callsign,
      String? name,
      String? manager,
      int? shiftHz,
      String? shiftRaw,
      String? region,
      String? provinceCode,
      String? locality,
      String? locator,
      double? latitude,
      double? longitude,
      double? distanceMeters,
      List<RepeaterAccess> accesses});
}

/// @nodoc
class __$RepeaterCopyWithImpl<$Res> implements _$RepeaterCopyWith<$Res> {
  __$RepeaterCopyWithImpl(this._self, this._then);

  final _Repeater _self;
  final $Res Function(_Repeater) _then;

  /// Create a copy of Repeater
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
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? distanceMeters = freezed,
    Object? accesses = null,
  }) {
    return _then(_Repeater(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frequencyHz: null == frequencyHz
          ? _self.frequencyHz
          : frequencyHz // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as RepeaterMode,
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
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceMeters: freezed == distanceMeters
          ? _self.distanceMeters
          : distanceMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      accesses: null == accesses
          ? _self._accesses
          : accesses // ignore: cast_nullable_to_non_nullable
              as List<RepeaterAccess>,
    ));
  }
}

// dart format on
