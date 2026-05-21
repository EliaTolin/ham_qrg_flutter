// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sota_summit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SotaSummit {
  String get code;
  String get name;
  String get associationName;
  String get associationCode;
  String get regionName;
  String get regionCode;
  double get latitude;
  double get longitude;
  int get altitudeM;
  int get altitudeFt;
  int get points;
  String get locator;
  DateTime get validFrom;
  DateTime get validTo;
  bool get valid;
  bool get hasRestrictions;
  List<String> get restrictions;
  String? get notes;

  /// Create a copy of SotaSummit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SotaSummitCopyWith<SotaSummit> get copyWith =>
      _$SotaSummitCopyWithImpl<SotaSummit>(this as SotaSummit, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SotaSummit &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.associationName, associationName) ||
                other.associationName == associationName) &&
            (identical(other.associationCode, associationCode) ||
                other.associationCode == associationCode) &&
            (identical(other.regionName, regionName) ||
                other.regionName == regionName) &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.altitudeM, altitudeM) ||
                other.altitudeM == altitudeM) &&
            (identical(other.altitudeFt, altitudeFt) ||
                other.altitudeFt == altitudeFt) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.hasRestrictions, hasRestrictions) ||
                other.hasRestrictions == hasRestrictions) &&
            const DeepCollectionEquality()
                .equals(other.restrictions, restrictions) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      associationName,
      associationCode,
      regionName,
      regionCode,
      latitude,
      longitude,
      altitudeM,
      altitudeFt,
      points,
      locator,
      validFrom,
      validTo,
      valid,
      hasRestrictions,
      const DeepCollectionEquality().hash(restrictions),
      notes);

  @override
  String toString() {
    return 'SotaSummit(code: $code, name: $name, associationName: $associationName, associationCode: $associationCode, regionName: $regionName, regionCode: $regionCode, latitude: $latitude, longitude: $longitude, altitudeM: $altitudeM, altitudeFt: $altitudeFt, points: $points, locator: $locator, validFrom: $validFrom, validTo: $validTo, valid: $valid, hasRestrictions: $hasRestrictions, restrictions: $restrictions, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $SotaSummitCopyWith<$Res> {
  factory $SotaSummitCopyWith(
          SotaSummit value, $Res Function(SotaSummit) _then) =
      _$SotaSummitCopyWithImpl;
  @useResult
  $Res call(
      {String code,
      String name,
      String associationName,
      String associationCode,
      String regionName,
      String regionCode,
      double latitude,
      double longitude,
      int altitudeM,
      int altitudeFt,
      int points,
      String locator,
      DateTime validFrom,
      DateTime validTo,
      bool valid,
      bool hasRestrictions,
      List<String> restrictions,
      String? notes});
}

/// @nodoc
class _$SotaSummitCopyWithImpl<$Res> implements $SotaSummitCopyWith<$Res> {
  _$SotaSummitCopyWithImpl(this._self, this._then);

  final SotaSummit _self;
  final $Res Function(SotaSummit) _then;

  /// Create a copy of SotaSummit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? associationName = null,
    Object? associationCode = null,
    Object? regionName = null,
    Object? regionCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? altitudeM = null,
    Object? altitudeFt = null,
    Object? points = null,
    Object? locator = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? valid = null,
    Object? hasRestrictions = null,
    Object? restrictions = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      associationName: null == associationName
          ? _self.associationName
          : associationName // ignore: cast_nullable_to_non_nullable
              as String,
      associationCode: null == associationCode
          ? _self.associationCode
          : associationCode // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: null == regionName
          ? _self.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      regionCode: null == regionCode
          ? _self.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      altitudeM: null == altitudeM
          ? _self.altitudeM
          : altitudeM // ignore: cast_nullable_to_non_nullable
              as int,
      altitudeFt: null == altitudeFt
          ? _self.altitudeFt
          : altitudeFt // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      locator: null == locator
          ? _self.locator
          : locator // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: null == validFrom
          ? _self.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validTo: null == validTo
          ? _self.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      hasRestrictions: null == hasRestrictions
          ? _self.hasRestrictions
          : hasRestrictions // ignore: cast_nullable_to_non_nullable
              as bool,
      restrictions: null == restrictions
          ? _self.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SotaSummit].
extension SotaSummitPatterns on SotaSummit {
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
    TResult Function(_SotaSummit value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSummit() when $default != null:
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
    TResult Function(_SotaSummit value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSummit():
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
    TResult? Function(_SotaSummit value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSummit() when $default != null:
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
            String code,
            String name,
            String associationName,
            String associationCode,
            String regionName,
            String regionCode,
            double latitude,
            double longitude,
            int altitudeM,
            int altitudeFt,
            int points,
            String locator,
            DateTime validFrom,
            DateTime validTo,
            bool valid,
            bool hasRestrictions,
            List<String> restrictions,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSummit() when $default != null:
        return $default(
            _that.code,
            _that.name,
            _that.associationName,
            _that.associationCode,
            _that.regionName,
            _that.regionCode,
            _that.latitude,
            _that.longitude,
            _that.altitudeM,
            _that.altitudeFt,
            _that.points,
            _that.locator,
            _that.validFrom,
            _that.validTo,
            _that.valid,
            _that.hasRestrictions,
            _that.restrictions,
            _that.notes);
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
            String code,
            String name,
            String associationName,
            String associationCode,
            String regionName,
            String regionCode,
            double latitude,
            double longitude,
            int altitudeM,
            int altitudeFt,
            int points,
            String locator,
            DateTime validFrom,
            DateTime validTo,
            bool valid,
            bool hasRestrictions,
            List<String> restrictions,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSummit():
        return $default(
            _that.code,
            _that.name,
            _that.associationName,
            _that.associationCode,
            _that.regionName,
            _that.regionCode,
            _that.latitude,
            _that.longitude,
            _that.altitudeM,
            _that.altitudeFt,
            _that.points,
            _that.locator,
            _that.validFrom,
            _that.validTo,
            _that.valid,
            _that.hasRestrictions,
            _that.restrictions,
            _that.notes);
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
            String code,
            String name,
            String associationName,
            String associationCode,
            String regionName,
            String regionCode,
            double latitude,
            double longitude,
            int altitudeM,
            int altitudeFt,
            int points,
            String locator,
            DateTime validFrom,
            DateTime validTo,
            bool valid,
            bool hasRestrictions,
            List<String> restrictions,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSummit() when $default != null:
        return $default(
            _that.code,
            _that.name,
            _that.associationName,
            _that.associationCode,
            _that.regionName,
            _that.regionCode,
            _that.latitude,
            _that.longitude,
            _that.altitudeM,
            _that.altitudeFt,
            _that.points,
            _that.locator,
            _that.validFrom,
            _that.validTo,
            _that.valid,
            _that.hasRestrictions,
            _that.restrictions,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SotaSummit implements SotaSummit {
  const _SotaSummit(
      {required this.code,
      required this.name,
      required this.associationName,
      required this.associationCode,
      required this.regionName,
      required this.regionCode,
      required this.latitude,
      required this.longitude,
      required this.altitudeM,
      required this.altitudeFt,
      required this.points,
      required this.locator,
      required this.validFrom,
      required this.validTo,
      required this.valid,
      required this.hasRestrictions,
      final List<String> restrictions = const <String>[],
      this.notes})
      : _restrictions = restrictions;

  @override
  final String code;
  @override
  final String name;
  @override
  final String associationName;
  @override
  final String associationCode;
  @override
  final String regionName;
  @override
  final String regionCode;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int altitudeM;
  @override
  final int altitudeFt;
  @override
  final int points;
  @override
  final String locator;
  @override
  final DateTime validFrom;
  @override
  final DateTime validTo;
  @override
  final bool valid;
  @override
  final bool hasRestrictions;
  final List<String> _restrictions;
  @override
  @JsonKey()
  List<String> get restrictions {
    if (_restrictions is EqualUnmodifiableListView) return _restrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restrictions);
  }

  @override
  final String? notes;

  /// Create a copy of SotaSummit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SotaSummitCopyWith<_SotaSummit> get copyWith =>
      __$SotaSummitCopyWithImpl<_SotaSummit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SotaSummit &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.associationName, associationName) ||
                other.associationName == associationName) &&
            (identical(other.associationCode, associationCode) ||
                other.associationCode == associationCode) &&
            (identical(other.regionName, regionName) ||
                other.regionName == regionName) &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.altitudeM, altitudeM) ||
                other.altitudeM == altitudeM) &&
            (identical(other.altitudeFt, altitudeFt) ||
                other.altitudeFt == altitudeFt) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.hasRestrictions, hasRestrictions) ||
                other.hasRestrictions == hasRestrictions) &&
            const DeepCollectionEquality()
                .equals(other._restrictions, _restrictions) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      associationName,
      associationCode,
      regionName,
      regionCode,
      latitude,
      longitude,
      altitudeM,
      altitudeFt,
      points,
      locator,
      validFrom,
      validTo,
      valid,
      hasRestrictions,
      const DeepCollectionEquality().hash(_restrictions),
      notes);

  @override
  String toString() {
    return 'SotaSummit(code: $code, name: $name, associationName: $associationName, associationCode: $associationCode, regionName: $regionName, regionCode: $regionCode, latitude: $latitude, longitude: $longitude, altitudeM: $altitudeM, altitudeFt: $altitudeFt, points: $points, locator: $locator, validFrom: $validFrom, validTo: $validTo, valid: $valid, hasRestrictions: $hasRestrictions, restrictions: $restrictions, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$SotaSummitCopyWith<$Res>
    implements $SotaSummitCopyWith<$Res> {
  factory _$SotaSummitCopyWith(
          _SotaSummit value, $Res Function(_SotaSummit) _then) =
      __$SotaSummitCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String associationName,
      String associationCode,
      String regionName,
      String regionCode,
      double latitude,
      double longitude,
      int altitudeM,
      int altitudeFt,
      int points,
      String locator,
      DateTime validFrom,
      DateTime validTo,
      bool valid,
      bool hasRestrictions,
      List<String> restrictions,
      String? notes});
}

/// @nodoc
class __$SotaSummitCopyWithImpl<$Res> implements _$SotaSummitCopyWith<$Res> {
  __$SotaSummitCopyWithImpl(this._self, this._then);

  final _SotaSummit _self;
  final $Res Function(_SotaSummit) _then;

  /// Create a copy of SotaSummit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? associationName = null,
    Object? associationCode = null,
    Object? regionName = null,
    Object? regionCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? altitudeM = null,
    Object? altitudeFt = null,
    Object? points = null,
    Object? locator = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? valid = null,
    Object? hasRestrictions = null,
    Object? restrictions = null,
    Object? notes = freezed,
  }) {
    return _then(_SotaSummit(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      associationName: null == associationName
          ? _self.associationName
          : associationName // ignore: cast_nullable_to_non_nullable
              as String,
      associationCode: null == associationCode
          ? _self.associationCode
          : associationCode // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: null == regionName
          ? _self.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      regionCode: null == regionCode
          ? _self.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      altitudeM: null == altitudeM
          ? _self.altitudeM
          : altitudeM // ignore: cast_nullable_to_non_nullable
              as int,
      altitudeFt: null == altitudeFt
          ? _self.altitudeFt
          : altitudeFt // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      locator: null == locator
          ? _self.locator
          : locator // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: null == validFrom
          ? _self.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validTo: null == validTo
          ? _self.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      hasRestrictions: null == hasRestrictions
          ? _self.hasRestrictions
          : hasRestrictions // ignore: cast_nullable_to_non_nullable
              as bool,
      restrictions: null == restrictions
          ? _self._restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
