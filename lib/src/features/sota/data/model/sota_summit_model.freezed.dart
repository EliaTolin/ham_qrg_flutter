// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sota_summit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SotaSummitModel {
  String get summitCode;
  String get name;
  String get associationName;
  String get associationCode;
  String get regionName;
  String get regionCode;
  double get latitude;
  double get longitude;
  int get altM;
  int get altFt;
  int get points;
  String get locator;
  String get validFrom;
  String get validTo;
  bool get valid;
  bool get restrictionMask;
  List<String> get restrictionList;
  String? get notes;
  String? get gridRef1;
  String? get gridRef2;

  /// Create a copy of SotaSummitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SotaSummitModelCopyWith<SotaSummitModel> get copyWith =>
      _$SotaSummitModelCopyWithImpl<SotaSummitModel>(
          this as SotaSummitModel, _$identity);

  /// Serializes this SotaSummitModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SotaSummitModel &&
            (identical(other.summitCode, summitCode) ||
                other.summitCode == summitCode) &&
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
            (identical(other.altM, altM) || other.altM == altM) &&
            (identical(other.altFt, altFt) || other.altFt == altFt) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.restrictionMask, restrictionMask) ||
                other.restrictionMask == restrictionMask) &&
            const DeepCollectionEquality()
                .equals(other.restrictionList, restrictionList) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.gridRef1, gridRef1) ||
                other.gridRef1 == gridRef1) &&
            (identical(other.gridRef2, gridRef2) ||
                other.gridRef2 == gridRef2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        summitCode,
        name,
        associationName,
        associationCode,
        regionName,
        regionCode,
        latitude,
        longitude,
        altM,
        altFt,
        points,
        locator,
        validFrom,
        validTo,
        valid,
        restrictionMask,
        const DeepCollectionEquality().hash(restrictionList),
        notes,
        gridRef1,
        gridRef2
      ]);

  @override
  String toString() {
    return 'SotaSummitModel(summitCode: $summitCode, name: $name, associationName: $associationName, associationCode: $associationCode, regionName: $regionName, regionCode: $regionCode, latitude: $latitude, longitude: $longitude, altM: $altM, altFt: $altFt, points: $points, locator: $locator, validFrom: $validFrom, validTo: $validTo, valid: $valid, restrictionMask: $restrictionMask, restrictionList: $restrictionList, notes: $notes, gridRef1: $gridRef1, gridRef2: $gridRef2)';
  }
}

/// @nodoc
abstract mixin class $SotaSummitModelCopyWith<$Res> {
  factory $SotaSummitModelCopyWith(
          SotaSummitModel value, $Res Function(SotaSummitModel) _then) =
      _$SotaSummitModelCopyWithImpl;
  @useResult
  $Res call(
      {String summitCode,
      String name,
      String associationName,
      String associationCode,
      String regionName,
      String regionCode,
      double latitude,
      double longitude,
      int altM,
      int altFt,
      int points,
      String locator,
      String validFrom,
      String validTo,
      bool valid,
      bool restrictionMask,
      List<String> restrictionList,
      String? notes,
      String? gridRef1,
      String? gridRef2});
}

/// @nodoc
class _$SotaSummitModelCopyWithImpl<$Res>
    implements $SotaSummitModelCopyWith<$Res> {
  _$SotaSummitModelCopyWithImpl(this._self, this._then);

  final SotaSummitModel _self;
  final $Res Function(SotaSummitModel) _then;

  /// Create a copy of SotaSummitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summitCode = null,
    Object? name = null,
    Object? associationName = null,
    Object? associationCode = null,
    Object? regionName = null,
    Object? regionCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? altM = null,
    Object? altFt = null,
    Object? points = null,
    Object? locator = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? valid = null,
    Object? restrictionMask = null,
    Object? restrictionList = null,
    Object? notes = freezed,
    Object? gridRef1 = freezed,
    Object? gridRef2 = freezed,
  }) {
    return _then(_self.copyWith(
      summitCode: null == summitCode
          ? _self.summitCode
          : summitCode // ignore: cast_nullable_to_non_nullable
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
      altM: null == altM
          ? _self.altM
          : altM // ignore: cast_nullable_to_non_nullable
              as int,
      altFt: null == altFt
          ? _self.altFt
          : altFt // ignore: cast_nullable_to_non_nullable
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
              as String,
      validTo: null == validTo
          ? _self.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as String,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      restrictionMask: null == restrictionMask
          ? _self.restrictionMask
          : restrictionMask // ignore: cast_nullable_to_non_nullable
              as bool,
      restrictionList: null == restrictionList
          ? _self.restrictionList
          : restrictionList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      gridRef1: freezed == gridRef1
          ? _self.gridRef1
          : gridRef1 // ignore: cast_nullable_to_non_nullable
              as String?,
      gridRef2: freezed == gridRef2
          ? _self.gridRef2
          : gridRef2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SotaSummitModel].
extension SotaSummitModelPatterns on SotaSummitModel {
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
    TResult Function(_SotaSummitModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSummitModel() when $default != null:
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
    TResult Function(_SotaSummitModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSummitModel():
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
    TResult? Function(_SotaSummitModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSummitModel() when $default != null:
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
            String summitCode,
            String name,
            String associationName,
            String associationCode,
            String regionName,
            String regionCode,
            double latitude,
            double longitude,
            int altM,
            int altFt,
            int points,
            String locator,
            String validFrom,
            String validTo,
            bool valid,
            bool restrictionMask,
            List<String> restrictionList,
            String? notes,
            String? gridRef1,
            String? gridRef2)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSummitModel() when $default != null:
        return $default(
            _that.summitCode,
            _that.name,
            _that.associationName,
            _that.associationCode,
            _that.regionName,
            _that.regionCode,
            _that.latitude,
            _that.longitude,
            _that.altM,
            _that.altFt,
            _that.points,
            _that.locator,
            _that.validFrom,
            _that.validTo,
            _that.valid,
            _that.restrictionMask,
            _that.restrictionList,
            _that.notes,
            _that.gridRef1,
            _that.gridRef2);
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
            String summitCode,
            String name,
            String associationName,
            String associationCode,
            String regionName,
            String regionCode,
            double latitude,
            double longitude,
            int altM,
            int altFt,
            int points,
            String locator,
            String validFrom,
            String validTo,
            bool valid,
            bool restrictionMask,
            List<String> restrictionList,
            String? notes,
            String? gridRef1,
            String? gridRef2)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSummitModel():
        return $default(
            _that.summitCode,
            _that.name,
            _that.associationName,
            _that.associationCode,
            _that.regionName,
            _that.regionCode,
            _that.latitude,
            _that.longitude,
            _that.altM,
            _that.altFt,
            _that.points,
            _that.locator,
            _that.validFrom,
            _that.validTo,
            _that.valid,
            _that.restrictionMask,
            _that.restrictionList,
            _that.notes,
            _that.gridRef1,
            _that.gridRef2);
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
            String summitCode,
            String name,
            String associationName,
            String associationCode,
            String regionName,
            String regionCode,
            double latitude,
            double longitude,
            int altM,
            int altFt,
            int points,
            String locator,
            String validFrom,
            String validTo,
            bool valid,
            bool restrictionMask,
            List<String> restrictionList,
            String? notes,
            String? gridRef1,
            String? gridRef2)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSummitModel() when $default != null:
        return $default(
            _that.summitCode,
            _that.name,
            _that.associationName,
            _that.associationCode,
            _that.regionName,
            _that.regionCode,
            _that.latitude,
            _that.longitude,
            _that.altM,
            _that.altFt,
            _that.points,
            _that.locator,
            _that.validFrom,
            _that.validTo,
            _that.valid,
            _that.restrictionMask,
            _that.restrictionList,
            _that.notes,
            _that.gridRef1,
            _that.gridRef2);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SotaSummitModel implements SotaSummitModel {
  const _SotaSummitModel(
      {required this.summitCode,
      required this.name,
      required this.associationName,
      required this.associationCode,
      required this.regionName,
      required this.regionCode,
      required this.latitude,
      required this.longitude,
      required this.altM,
      required this.altFt,
      required this.points,
      required this.locator,
      required this.validFrom,
      required this.validTo,
      required this.valid,
      required this.restrictionMask,
      final List<String> restrictionList = const <String>[],
      this.notes,
      this.gridRef1,
      this.gridRef2})
      : _restrictionList = restrictionList;
  factory _SotaSummitModel.fromJson(Map<String, dynamic> json) =>
      _$SotaSummitModelFromJson(json);

  @override
  final String summitCode;
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
  final int altM;
  @override
  final int altFt;
  @override
  final int points;
  @override
  final String locator;
  @override
  final String validFrom;
  @override
  final String validTo;
  @override
  final bool valid;
  @override
  final bool restrictionMask;
  final List<String> _restrictionList;
  @override
  @JsonKey()
  List<String> get restrictionList {
    if (_restrictionList is EqualUnmodifiableListView) return _restrictionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restrictionList);
  }

  @override
  final String? notes;
  @override
  final String? gridRef1;
  @override
  final String? gridRef2;

  /// Create a copy of SotaSummitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SotaSummitModelCopyWith<_SotaSummitModel> get copyWith =>
      __$SotaSummitModelCopyWithImpl<_SotaSummitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SotaSummitModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SotaSummitModel &&
            (identical(other.summitCode, summitCode) ||
                other.summitCode == summitCode) &&
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
            (identical(other.altM, altM) || other.altM == altM) &&
            (identical(other.altFt, altFt) || other.altFt == altFt) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.restrictionMask, restrictionMask) ||
                other.restrictionMask == restrictionMask) &&
            const DeepCollectionEquality()
                .equals(other._restrictionList, _restrictionList) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.gridRef1, gridRef1) ||
                other.gridRef1 == gridRef1) &&
            (identical(other.gridRef2, gridRef2) ||
                other.gridRef2 == gridRef2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        summitCode,
        name,
        associationName,
        associationCode,
        regionName,
        regionCode,
        latitude,
        longitude,
        altM,
        altFt,
        points,
        locator,
        validFrom,
        validTo,
        valid,
        restrictionMask,
        const DeepCollectionEquality().hash(_restrictionList),
        notes,
        gridRef1,
        gridRef2
      ]);

  @override
  String toString() {
    return 'SotaSummitModel(summitCode: $summitCode, name: $name, associationName: $associationName, associationCode: $associationCode, regionName: $regionName, regionCode: $regionCode, latitude: $latitude, longitude: $longitude, altM: $altM, altFt: $altFt, points: $points, locator: $locator, validFrom: $validFrom, validTo: $validTo, valid: $valid, restrictionMask: $restrictionMask, restrictionList: $restrictionList, notes: $notes, gridRef1: $gridRef1, gridRef2: $gridRef2)';
  }
}

/// @nodoc
abstract mixin class _$SotaSummitModelCopyWith<$Res>
    implements $SotaSummitModelCopyWith<$Res> {
  factory _$SotaSummitModelCopyWith(
          _SotaSummitModel value, $Res Function(_SotaSummitModel) _then) =
      __$SotaSummitModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String summitCode,
      String name,
      String associationName,
      String associationCode,
      String regionName,
      String regionCode,
      double latitude,
      double longitude,
      int altM,
      int altFt,
      int points,
      String locator,
      String validFrom,
      String validTo,
      bool valid,
      bool restrictionMask,
      List<String> restrictionList,
      String? notes,
      String? gridRef1,
      String? gridRef2});
}

/// @nodoc
class __$SotaSummitModelCopyWithImpl<$Res>
    implements _$SotaSummitModelCopyWith<$Res> {
  __$SotaSummitModelCopyWithImpl(this._self, this._then);

  final _SotaSummitModel _self;
  final $Res Function(_SotaSummitModel) _then;

  /// Create a copy of SotaSummitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summitCode = null,
    Object? name = null,
    Object? associationName = null,
    Object? associationCode = null,
    Object? regionName = null,
    Object? regionCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? altM = null,
    Object? altFt = null,
    Object? points = null,
    Object? locator = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? valid = null,
    Object? restrictionMask = null,
    Object? restrictionList = null,
    Object? notes = freezed,
    Object? gridRef1 = freezed,
    Object? gridRef2 = freezed,
  }) {
    return _then(_SotaSummitModel(
      summitCode: null == summitCode
          ? _self.summitCode
          : summitCode // ignore: cast_nullable_to_non_nullable
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
      altM: null == altM
          ? _self.altM
          : altM // ignore: cast_nullable_to_non_nullable
              as int,
      altFt: null == altFt
          ? _self.altFt
          : altFt // ignore: cast_nullable_to_non_nullable
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
              as String,
      validTo: null == validTo
          ? _self.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as String,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      restrictionMask: null == restrictionMask
          ? _self.restrictionMask
          : restrictionMask // ignore: cast_nullable_to_non_nullable
              as bool,
      restrictionList: null == restrictionList
          ? _self._restrictionList
          : restrictionList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      gridRef1: freezed == gridRef1
          ? _self.gridRef1
          : gridRef1 // ignore: cast_nullable_to_non_nullable
              as String?,
      gridRef2: freezed == gridRef2
          ? _self.gridRef2
          : gridRef2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
