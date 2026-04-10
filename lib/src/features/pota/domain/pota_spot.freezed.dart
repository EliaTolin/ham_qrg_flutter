// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pota_spot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PotaSpot {
  int get spotId;
  DateTime get spotTime;
  String get activator;
  String get frequency;
  String get mode;
  String get reference;
  String get name;
  String? get locationDesc;
  String? get spotter;
  String? get comments;
  String? get source;

  /// Create a copy of PotaSpot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PotaSpotCopyWith<PotaSpot> get copyWith =>
      _$PotaSpotCopyWithImpl<PotaSpot>(this as PotaSpot, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PotaSpot &&
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
    return 'PotaSpot(spotId: $spotId, spotTime: $spotTime, activator: $activator, frequency: $frequency, mode: $mode, reference: $reference, name: $name, locationDesc: $locationDesc, spotter: $spotter, comments: $comments, source: $source)';
  }
}

/// @nodoc
abstract mixin class $PotaSpotCopyWith<$Res> {
  factory $PotaSpotCopyWith(PotaSpot value, $Res Function(PotaSpot) _then) =
      _$PotaSpotCopyWithImpl;
  @useResult
  $Res call(
      {int spotId,
      DateTime spotTime,
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
class _$PotaSpotCopyWithImpl<$Res> implements $PotaSpotCopyWith<$Res> {
  _$PotaSpotCopyWithImpl(this._self, this._then);

  final PotaSpot _self;
  final $Res Function(PotaSpot) _then;

  /// Create a copy of PotaSpot
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
              as DateTime,
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

/// Adds pattern-matching-related methods to [PotaSpot].
extension PotaSpotPatterns on PotaSpot {
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
    TResult Function(_PotaSpot value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaSpot() when $default != null:
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
    TResult Function(_PotaSpot value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpot():
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
    TResult? Function(_PotaSpot value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpot() when $default != null:
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
            DateTime spotTime,
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
      case _PotaSpot() when $default != null:
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
            DateTime spotTime,
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
      case _PotaSpot():
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
            DateTime spotTime,
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
      case _PotaSpot() when $default != null:
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

class _PotaSpot implements PotaSpot {
  const _PotaSpot(
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

  @override
  final int spotId;
  @override
  final DateTime spotTime;
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

  /// Create a copy of PotaSpot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PotaSpotCopyWith<_PotaSpot> get copyWith =>
      __$PotaSpotCopyWithImpl<_PotaSpot>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PotaSpot &&
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
    return 'PotaSpot(spotId: $spotId, spotTime: $spotTime, activator: $activator, frequency: $frequency, mode: $mode, reference: $reference, name: $name, locationDesc: $locationDesc, spotter: $spotter, comments: $comments, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$PotaSpotCopyWith<$Res>
    implements $PotaSpotCopyWith<$Res> {
  factory _$PotaSpotCopyWith(_PotaSpot value, $Res Function(_PotaSpot) _then) =
      __$PotaSpotCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int spotId,
      DateTime spotTime,
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
class __$PotaSpotCopyWithImpl<$Res> implements _$PotaSpotCopyWith<$Res> {
  __$PotaSpotCopyWithImpl(this._self, this._then);

  final _PotaSpot _self;
  final $Res Function(_PotaSpot) _then;

  /// Create a copy of PotaSpot
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
    return _then(_PotaSpot(
      spotId: null == spotId
          ? _self.spotId
          : spotId // ignore: cast_nullable_to_non_nullable
              as int,
      spotTime: null == spotTime
          ? _self.spotTime
          : spotTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
