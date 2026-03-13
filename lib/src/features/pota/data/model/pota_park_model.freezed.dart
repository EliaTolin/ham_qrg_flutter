// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pota_park_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PotaParkModel {
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

  /// Create a copy of PotaParkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PotaParkModelCopyWith<PotaParkModel> get copyWith =>
      _$PotaParkModelCopyWithImpl<PotaParkModel>(
          this as PotaParkModel, _$identity);

  /// Serializes this PotaParkModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PotaParkModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PotaParkModel(reference: $reference, name: $name, latitude: $latitude, longitude: $longitude, grid4: $grid4, grid6: $grid6, parktypeDesc: $parktypeDesc, locationName: $locationName, entityName: $entityName, website: $website, accessMethods: $accessMethods, firstActivator: $firstActivator, firstActivationDate: $firstActivationDate)';
  }
}

/// @nodoc
abstract mixin class $PotaParkModelCopyWith<$Res> {
  factory $PotaParkModelCopyWith(
          PotaParkModel value, $Res Function(PotaParkModel) _then) =
      _$PotaParkModelCopyWithImpl;
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
class _$PotaParkModelCopyWithImpl<$Res>
    implements $PotaParkModelCopyWith<$Res> {
  _$PotaParkModelCopyWithImpl(this._self, this._then);

  final PotaParkModel _self;
  final $Res Function(PotaParkModel) _then;

  /// Create a copy of PotaParkModel
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

/// Adds pattern-matching-related methods to [PotaParkModel].
extension PotaParkModelPatterns on PotaParkModel {
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
    TResult Function(_PotaParkModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaParkModel() when $default != null:
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
    TResult Function(_PotaParkModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaParkModel():
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
    TResult? Function(_PotaParkModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaParkModel() when $default != null:
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
      case _PotaParkModel() when $default != null:
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
      case _PotaParkModel():
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
      case _PotaParkModel() when $default != null:
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
@JsonSerializable()
class _PotaParkModel implements PotaParkModel {
  const _PotaParkModel(
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
  factory _PotaParkModel.fromJson(Map<String, dynamic> json) =>
      _$PotaParkModelFromJson(json);

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

  /// Create a copy of PotaParkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PotaParkModelCopyWith<_PotaParkModel> get copyWith =>
      __$PotaParkModelCopyWithImpl<_PotaParkModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PotaParkModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PotaParkModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PotaParkModel(reference: $reference, name: $name, latitude: $latitude, longitude: $longitude, grid4: $grid4, grid6: $grid6, parktypeDesc: $parktypeDesc, locationName: $locationName, entityName: $entityName, website: $website, accessMethods: $accessMethods, firstActivator: $firstActivator, firstActivationDate: $firstActivationDate)';
  }
}

/// @nodoc
abstract mixin class _$PotaParkModelCopyWith<$Res>
    implements $PotaParkModelCopyWith<$Res> {
  factory _$PotaParkModelCopyWith(
          _PotaParkModel value, $Res Function(_PotaParkModel) _then) =
      __$PotaParkModelCopyWithImpl;
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
class __$PotaParkModelCopyWithImpl<$Res>
    implements _$PotaParkModelCopyWith<$Res> {
  __$PotaParkModelCopyWithImpl(this._self, this._then);

  final _PotaParkModel _self;
  final $Res Function(_PotaParkModel) _then;

  /// Create a copy of PotaParkModel
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
    return _then(_PotaParkModel(
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
