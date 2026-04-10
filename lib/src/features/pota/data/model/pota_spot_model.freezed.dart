// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pota_spot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PotaSpotModel {
  int get spotId;
  String get spotTime;
  String get activator;
  String get frequency;
  String get mode;
  String get reference;
  String get name;
  String? get locationDesc;
  String? get spotter;
  String? get comments;
  String? get source;

  /// Create a copy of PotaSpotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PotaSpotModelCopyWith<PotaSpotModel> get copyWith =>
      _$PotaSpotModelCopyWithImpl<PotaSpotModel>(
          this as PotaSpotModel, _$identity);

  /// Serializes this PotaSpotModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PotaSpotModel &&
            (identical(other.spotId, spotId) || other.spotId == spotId) &&
            (identical(other.spotTime, spotTime) ||
                other.spotTime == spotTime) &&
            (identical(other.activator, activator) ||
                other.activator == activator) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.locationDesc, locationDesc) ||
                other.locationDesc == locationDesc) &&
            (identical(other.spotter, spotter) || other.spotter == spotter) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      spotId,
      spotTime,
      activator,
      frequency,
      mode,
      reference,
      name,
      locationDesc,
      spotter,
      comments,
      source);

  @override
  String toString() {
    return 'PotaSpotModel(spotId: $spotId, spotTime: $spotTime, activator: $activator, frequency: $frequency, mode: $mode, reference: $reference, name: $name, locationDesc: $locationDesc, spotter: $spotter, comments: $comments, source: $source)';
  }
}

/// @nodoc
abstract mixin class $PotaSpotModelCopyWith<$Res> {
  factory $PotaSpotModelCopyWith(
          PotaSpotModel value, $Res Function(PotaSpotModel) _then) =
      _$PotaSpotModelCopyWithImpl;
  @useResult
  $Res call(
      {int spotId,
      String spotTime,
      String activator,
      String frequency,
      String mode,
      String reference,
      String name,
      String? locationDesc,
      String? spotter,
      String? comments,
      String? source});
}

/// @nodoc
class _$PotaSpotModelCopyWithImpl<$Res>
    implements $PotaSpotModelCopyWith<$Res> {
  _$PotaSpotModelCopyWithImpl(this._self, this._then);

  final PotaSpotModel _self;
  final $Res Function(PotaSpotModel) _then;

  /// Create a copy of PotaSpotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotId = null,
    Object? spotTime = null,
    Object? activator = null,
    Object? frequency = null,
    Object? mode = null,
    Object? reference = null,
    Object? name = null,
    Object? locationDesc = freezed,
    Object? spotter = freezed,
    Object? comments = freezed,
    Object? source = freezed,
  }) {
    return _then(_self.copyWith(
      spotId: null == spotId
          ? _self.spotId
          : spotId // ignore: cast_nullable_to_non_nullable
              as int,
      spotTime: null == spotTime
          ? _self.spotTime
          : spotTime // ignore: cast_nullable_to_non_nullable
              as String,
      activator: null == activator
          ? _self.activator
          : activator // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      locationDesc: freezed == locationDesc
          ? _self.locationDesc
          : locationDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      spotter: freezed == spotter
          ? _self.spotter
          : spotter // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PotaSpotModel].
extension PotaSpotModelPatterns on PotaSpotModel {
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
    TResult Function(_PotaSpotModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaSpotModel() when $default != null:
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
    TResult Function(_PotaSpotModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotModel():
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
    TResult? Function(_PotaSpotModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotModel() when $default != null:
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
            int spotId,
            String spotTime,
            String activator,
            String frequency,
            String mode,
            String reference,
            String name,
            String? locationDesc,
            String? spotter,
            String? comments,
            String? source)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaSpotModel() when $default != null:
        return $default(
            _that.spotId,
            _that.spotTime,
            _that.activator,
            _that.frequency,
            _that.mode,
            _that.reference,
            _that.name,
            _that.locationDesc,
            _that.spotter,
            _that.comments,
            _that.source);
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
            int spotId,
            String spotTime,
            String activator,
            String frequency,
            String mode,
            String reference,
            String name,
            String? locationDesc,
            String? spotter,
            String? comments,
            String? source)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotModel():
        return $default(
            _that.spotId,
            _that.spotTime,
            _that.activator,
            _that.frequency,
            _that.mode,
            _that.reference,
            _that.name,
            _that.locationDesc,
            _that.spotter,
            _that.comments,
            _that.source);
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
            int spotId,
            String spotTime,
            String activator,
            String frequency,
            String mode,
            String reference,
            String name,
            String? locationDesc,
            String? spotter,
            String? comments,
            String? source)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotModel() when $default != null:
        return $default(
            _that.spotId,
            _that.spotTime,
            _that.activator,
            _that.frequency,
            _that.mode,
            _that.reference,
            _that.name,
            _that.locationDesc,
            _that.spotter,
            _that.comments,
            _that.source);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PotaSpotModel implements PotaSpotModel {
  const _PotaSpotModel(
      {required this.spotId,
      required this.spotTime,
      required this.activator,
      required this.frequency,
      required this.mode,
      required this.reference,
      required this.name,
      this.locationDesc,
      this.spotter,
      this.comments,
      this.source});
  factory _PotaSpotModel.fromJson(Map<String, dynamic> json) =>
      _$PotaSpotModelFromJson(json);

  @override
  final int spotId;
  @override
  final String spotTime;
  @override
  final String activator;
  @override
  final String frequency;
  @override
  final String mode;
  @override
  final String reference;
  @override
  final String name;
  @override
  final String? locationDesc;
  @override
  final String? spotter;
  @override
  final String? comments;
  @override
  final String? source;

  /// Create a copy of PotaSpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PotaSpotModelCopyWith<_PotaSpotModel> get copyWith =>
      __$PotaSpotModelCopyWithImpl<_PotaSpotModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PotaSpotModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PotaSpotModel &&
            (identical(other.spotId, spotId) || other.spotId == spotId) &&
            (identical(other.spotTime, spotTime) ||
                other.spotTime == spotTime) &&
            (identical(other.activator, activator) ||
                other.activator == activator) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.locationDesc, locationDesc) ||
                other.locationDesc == locationDesc) &&
            (identical(other.spotter, spotter) || other.spotter == spotter) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      spotId,
      spotTime,
      activator,
      frequency,
      mode,
      reference,
      name,
      locationDesc,
      spotter,
      comments,
      source);

  @override
  String toString() {
    return 'PotaSpotModel(spotId: $spotId, spotTime: $spotTime, activator: $activator, frequency: $frequency, mode: $mode, reference: $reference, name: $name, locationDesc: $locationDesc, spotter: $spotter, comments: $comments, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$PotaSpotModelCopyWith<$Res>
    implements $PotaSpotModelCopyWith<$Res> {
  factory _$PotaSpotModelCopyWith(
          _PotaSpotModel value, $Res Function(_PotaSpotModel) _then) =
      __$PotaSpotModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int spotId,
      String spotTime,
      String activator,
      String frequency,
      String mode,
      String reference,
      String name,
      String? locationDesc,
      String? spotter,
      String? comments,
      String? source});
}

/// @nodoc
class __$PotaSpotModelCopyWithImpl<$Res>
    implements _$PotaSpotModelCopyWith<$Res> {
  __$PotaSpotModelCopyWithImpl(this._self, this._then);

  final _PotaSpotModel _self;
  final $Res Function(_PotaSpotModel) _then;

  /// Create a copy of PotaSpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? spotId = null,
    Object? spotTime = null,
    Object? activator = null,
    Object? frequency = null,
    Object? mode = null,
    Object? reference = null,
    Object? name = null,
    Object? locationDesc = freezed,
    Object? spotter = freezed,
    Object? comments = freezed,
    Object? source = freezed,
  }) {
    return _then(_PotaSpotModel(
      spotId: null == spotId
          ? _self.spotId
          : spotId // ignore: cast_nullable_to_non_nullable
              as int,
      spotTime: null == spotTime
          ? _self.spotTime
          : spotTime // ignore: cast_nullable_to_non_nullable
              as String,
      activator: null == activator
          ? _self.activator
          : activator // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      locationDesc: freezed == locationDesc
          ? _self.locationDesc
          : locationDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      spotter: freezed == spotter
          ? _self.spotter
          : spotter // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
