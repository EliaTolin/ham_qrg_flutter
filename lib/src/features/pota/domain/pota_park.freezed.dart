// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pota_park.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PotaPark {
  String get reference;
  String get name;
  double? get latitude;
  double? get longitude;
  String? get grid4;
  String? get grid6;
  String? get parktypeDesc;
  String? get locationName;
  String? get entityName;
  String? get website;
  String? get accessMethods;
  String? get firstActivator;
  String? get firstActivationDate;

  /// Create a copy of PotaPark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PotaParkCopyWith<PotaPark> get copyWith =>
      _$PotaParkCopyWithImpl<PotaPark>(this as PotaPark, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PotaPark &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.grid4, grid4) || other.grid4 == grid4) &&
            (identical(other.grid6, grid6) || other.grid6 == grid6) &&
            (identical(other.parktypeDesc, parktypeDesc) ||
                other.parktypeDesc == parktypeDesc) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.accessMethods, accessMethods) ||
                other.accessMethods == accessMethods) &&
            (identical(other.firstActivator, firstActivator) ||
                other.firstActivator == firstActivator) &&
            (identical(other.firstActivationDate, firstActivationDate) ||
                other.firstActivationDate == firstActivationDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      reference,
      name,
      latitude,
      longitude,
      grid4,
      grid6,
      parktypeDesc,
      locationName,
      entityName,
      website,
      accessMethods,
      firstActivator,
      firstActivationDate);

  @override
  String toString() {
    return 'PotaPark(reference: $reference, name: $name, latitude: $latitude, longitude: $longitude, grid4: $grid4, grid6: $grid6, parktypeDesc: $parktypeDesc, locationName: $locationName, entityName: $entityName, website: $website, accessMethods: $accessMethods, firstActivator: $firstActivator, firstActivationDate: $firstActivationDate)';
  }
}

/// @nodoc
abstract mixin class $PotaParkCopyWith<$Res> {
  factory $PotaParkCopyWith(PotaPark value, $Res Function(PotaPark) _then) =
      _$PotaParkCopyWithImpl;
  @useResult
  $Res call(
      {String reference,
      String name,
      double? latitude,
      double? longitude,
      String? grid4,
      String? grid6,
      String? parktypeDesc,
      String? locationName,
      String? entityName,
      String? website,
      String? accessMethods,
      String? firstActivator,
      String? firstActivationDate});
}

/// @nodoc
class _$PotaParkCopyWithImpl<$Res> implements $PotaParkCopyWith<$Res> {
  _$PotaParkCopyWithImpl(this._self, this._then);

  final PotaPark _self;
  final $Res Function(PotaPark) _then;

  /// Create a copy of PotaPark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? grid4 = freezed,
    Object? grid6 = freezed,
    Object? parktypeDesc = freezed,
    Object? locationName = freezed,
    Object? entityName = freezed,
    Object? website = freezed,
    Object? accessMethods = freezed,
    Object? firstActivator = freezed,
    Object? firstActivationDate = freezed,
  }) {
    return _then(_self.copyWith(
      reference: null == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      grid4: freezed == grid4
          ? _self.grid4
          : grid4 // ignore: cast_nullable_to_non_nullable
              as String?,
      grid6: freezed == grid6
          ? _self.grid6
          : grid6 // ignore: cast_nullable_to_non_nullable
              as String?,
      parktypeDesc: freezed == parktypeDesc
          ? _self.parktypeDesc
          : parktypeDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _self.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _self.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      accessMethods: freezed == accessMethods
          ? _self.accessMethods
          : accessMethods // ignore: cast_nullable_to_non_nullable
              as String?,
      firstActivator: freezed == firstActivator
          ? _self.firstActivator
          : firstActivator // ignore: cast_nullable_to_non_nullable
              as String?,
      firstActivationDate: freezed == firstActivationDate
          ? _self.firstActivationDate
          : firstActivationDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PotaPark].
extension PotaParkPatterns on PotaPark {
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
    TResult Function(_PotaPark value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaPark() when $default != null:
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
    TResult Function(_PotaPark value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaPark():
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
    TResult? Function(_PotaPark value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaPark() when $default != null:
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
            String reference,
            String name,
            double? latitude,
            double? longitude,
            String? grid4,
            String? grid6,
            String? parktypeDesc,
            String? locationName,
            String? entityName,
            String? website,
            String? accessMethods,
            String? firstActivator,
            String? firstActivationDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaPark() when $default != null:
        return $default(
            _that.reference,
            _that.name,
            _that.latitude,
            _that.longitude,
            _that.grid4,
            _that.grid6,
            _that.parktypeDesc,
            _that.locationName,
            _that.entityName,
            _that.website,
            _that.accessMethods,
            _that.firstActivator,
            _that.firstActivationDate);
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
            String reference,
            String name,
            double? latitude,
            double? longitude,
            String? grid4,
            String? grid6,
            String? parktypeDesc,
            String? locationName,
            String? entityName,
            String? website,
            String? accessMethods,
            String? firstActivator,
            String? firstActivationDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaPark():
        return $default(
            _that.reference,
            _that.name,
            _that.latitude,
            _that.longitude,
            _that.grid4,
            _that.grid6,
            _that.parktypeDesc,
            _that.locationName,
            _that.entityName,
            _that.website,
            _that.accessMethods,
            _that.firstActivator,
            _that.firstActivationDate);
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
            String reference,
            String name,
            double? latitude,
            double? longitude,
            String? grid4,
            String? grid6,
            String? parktypeDesc,
            String? locationName,
            String? entityName,
            String? website,
            String? accessMethods,
            String? firstActivator,
            String? firstActivationDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaPark() when $default != null:
        return $default(
            _that.reference,
            _that.name,
            _that.latitude,
            _that.longitude,
            _that.grid4,
            _that.grid6,
            _that.parktypeDesc,
            _that.locationName,
            _that.entityName,
            _that.website,
            _that.accessMethods,
            _that.firstActivator,
            _that.firstActivationDate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PotaPark implements PotaPark {
  const _PotaPark(
      {required this.reference,
      required this.name,
      this.latitude,
      this.longitude,
      this.grid4,
      this.grid6,
      this.parktypeDesc,
      this.locationName,
      this.entityName,
      this.website,
      this.accessMethods,
      this.firstActivator,
      this.firstActivationDate});

  @override
  final String reference;
  @override
  final String name;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? grid4;
  @override
  final String? grid6;
  @override
  final String? parktypeDesc;
  @override
  final String? locationName;
  @override
  final String? entityName;
  @override
  final String? website;
  @override
  final String? accessMethods;
  @override
  final String? firstActivator;
  @override
  final String? firstActivationDate;

  /// Create a copy of PotaPark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PotaParkCopyWith<_PotaPark> get copyWith =>
      __$PotaParkCopyWithImpl<_PotaPark>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PotaPark &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.grid4, grid4) || other.grid4 == grid4) &&
            (identical(other.grid6, grid6) || other.grid6 == grid6) &&
            (identical(other.parktypeDesc, parktypeDesc) ||
                other.parktypeDesc == parktypeDesc) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.accessMethods, accessMethods) ||
                other.accessMethods == accessMethods) &&
            (identical(other.firstActivator, firstActivator) ||
                other.firstActivator == firstActivator) &&
            (identical(other.firstActivationDate, firstActivationDate) ||
                other.firstActivationDate == firstActivationDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      reference,
      name,
      latitude,
      longitude,
      grid4,
      grid6,
      parktypeDesc,
      locationName,
      entityName,
      website,
      accessMethods,
      firstActivator,
      firstActivationDate);

  @override
  String toString() {
    return 'PotaPark(reference: $reference, name: $name, latitude: $latitude, longitude: $longitude, grid4: $grid4, grid6: $grid6, parktypeDesc: $parktypeDesc, locationName: $locationName, entityName: $entityName, website: $website, accessMethods: $accessMethods, firstActivator: $firstActivator, firstActivationDate: $firstActivationDate)';
  }
}

/// @nodoc
abstract mixin class _$PotaParkCopyWith<$Res>
    implements $PotaParkCopyWith<$Res> {
  factory _$PotaParkCopyWith(_PotaPark value, $Res Function(_PotaPark) _then) =
      __$PotaParkCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String reference,
      String name,
      double? latitude,
      double? longitude,
      String? grid4,
      String? grid6,
      String? parktypeDesc,
      String? locationName,
      String? entityName,
      String? website,
      String? accessMethods,
      String? firstActivator,
      String? firstActivationDate});
}

/// @nodoc
class __$PotaParkCopyWithImpl<$Res> implements _$PotaParkCopyWith<$Res> {
  __$PotaParkCopyWithImpl(this._self, this._then);

  final _PotaPark _self;
  final $Res Function(_PotaPark) _then;

  /// Create a copy of PotaPark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reference = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? grid4 = freezed,
    Object? grid6 = freezed,
    Object? parktypeDesc = freezed,
    Object? locationName = freezed,
    Object? entityName = freezed,
    Object? website = freezed,
    Object? accessMethods = freezed,
    Object? firstActivator = freezed,
    Object? firstActivationDate = freezed,
  }) {
    return _then(_PotaPark(
      reference: null == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      grid4: freezed == grid4
          ? _self.grid4
          : grid4 // ignore: cast_nullable_to_non_nullable
              as String?,
      grid6: freezed == grid6
          ? _self.grid6
          : grid6 // ignore: cast_nullable_to_non_nullable
              as String?,
      parktypeDesc: freezed == parktypeDesc
          ? _self.parktypeDesc
          : parktypeDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _self.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _self.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      accessMethods: freezed == accessMethods
          ? _self.accessMethods
          : accessMethods // ignore: cast_nullable_to_non_nullable
              as String?,
      firstActivator: freezed == firstActivator
          ? _self.firstActivator
          : firstActivator // ignore: cast_nullable_to_non_nullable
              as String?,
      firstActivationDate: freezed == firstActivationDate
          ? _self.firstActivationDate
          : firstActivationDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
