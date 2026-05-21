// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sota_spot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SotaSpot {
  int get id;
  DateTime get timestamp;
  String get activator;
  String get summitCode;
  String get summitName;
  int get altitudeM;
  int get altitudeFt;
  int get points;
  double get frequencyMhz;
  String get mode;
  SotaSpotType get type;
  String? get activatorName;
  String? get comments;
  String? get spotter;

  /// Create a copy of SotaSpot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SotaSpotCopyWith<SotaSpot> get copyWith =>
      _$SotaSpotCopyWithImpl<SotaSpot>(this as SotaSpot, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SotaSpot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.activator, activator) ||
                other.activator == activator) &&
            (identical(other.summitCode, summitCode) ||
                other.summitCode == summitCode) &&
            (identical(other.summitName, summitName) ||
                other.summitName == summitName) &&
            (identical(other.altitudeM, altitudeM) ||
                other.altitudeM == altitudeM) &&
            (identical(other.altitudeFt, altitudeFt) ||
                other.altitudeFt == altitudeFt) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.frequencyMhz, frequencyMhz) ||
                other.frequencyMhz == frequencyMhz) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.activatorName, activatorName) ||
                other.activatorName == activatorName) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.spotter, spotter) || other.spotter == spotter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      activator,
      summitCode,
      summitName,
      altitudeM,
      altitudeFt,
      points,
      frequencyMhz,
      mode,
      type,
      activatorName,
      comments,
      spotter);

  @override
  String toString() {
    return 'SotaSpot(id: $id, timestamp: $timestamp, activator: $activator, summitCode: $summitCode, summitName: $summitName, altitudeM: $altitudeM, altitudeFt: $altitudeFt, points: $points, frequencyMhz: $frequencyMhz, mode: $mode, type: $type, activatorName: $activatorName, comments: $comments, spotter: $spotter)';
  }
}

/// @nodoc
abstract mixin class $SotaSpotCopyWith<$Res> {
  factory $SotaSpotCopyWith(SotaSpot value, $Res Function(SotaSpot) _then) =
      _$SotaSpotCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      DateTime timestamp,
      String activator,
      String summitCode,
      String summitName,
      int altitudeM,
      int altitudeFt,
      int points,
      double frequencyMhz,
      String mode,
      SotaSpotType type,
      String? activatorName,
      String? comments,
      String? spotter});
}

/// @nodoc
class _$SotaSpotCopyWithImpl<$Res> implements $SotaSpotCopyWith<$Res> {
  _$SotaSpotCopyWithImpl(this._self, this._then);

  final SotaSpot _self;
  final $Res Function(SotaSpot) _then;

  /// Create a copy of SotaSpot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? activator = null,
    Object? summitCode = null,
    Object? summitName = null,
    Object? altitudeM = null,
    Object? altitudeFt = null,
    Object? points = null,
    Object? frequencyMhz = null,
    Object? mode = null,
    Object? type = null,
    Object? activatorName = freezed,
    Object? comments = freezed,
    Object? spotter = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activator: null == activator
          ? _self.activator
          : activator // ignore: cast_nullable_to_non_nullable
              as String,
      summitCode: null == summitCode
          ? _self.summitCode
          : summitCode // ignore: cast_nullable_to_non_nullable
              as String,
      summitName: null == summitName
          ? _self.summitName
          : summitName // ignore: cast_nullable_to_non_nullable
              as String,
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
      frequencyMhz: null == frequencyMhz
          ? _self.frequencyMhz
          : frequencyMhz // ignore: cast_nullable_to_non_nullable
              as double,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SotaSpotType,
      activatorName: freezed == activatorName
          ? _self.activatorName
          : activatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      spotter: freezed == spotter
          ? _self.spotter
          : spotter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SotaSpot].
extension SotaSpotPatterns on SotaSpot {
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
    TResult Function(_SotaSpot value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSpot() when $default != null:
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
    TResult Function(_SotaSpot value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpot():
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
    TResult? Function(_SotaSpot value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpot() when $default != null:
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
            DateTime timestamp,
            String activator,
            String summitCode,
            String summitName,
            int altitudeM,
            int altitudeFt,
            int points,
            double frequencyMhz,
            String mode,
            SotaSpotType type,
            String? activatorName,
            String? comments,
            String? spotter)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSpot() when $default != null:
        return $default(
            _that.id,
            _that.timestamp,
            _that.activator,
            _that.summitCode,
            _that.summitName,
            _that.altitudeM,
            _that.altitudeFt,
            _that.points,
            _that.frequencyMhz,
            _that.mode,
            _that.type,
            _that.activatorName,
            _that.comments,
            _that.spotter);
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
            DateTime timestamp,
            String activator,
            String summitCode,
            String summitName,
            int altitudeM,
            int altitudeFt,
            int points,
            double frequencyMhz,
            String mode,
            SotaSpotType type,
            String? activatorName,
            String? comments,
            String? spotter)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpot():
        return $default(
            _that.id,
            _that.timestamp,
            _that.activator,
            _that.summitCode,
            _that.summitName,
            _that.altitudeM,
            _that.altitudeFt,
            _that.points,
            _that.frequencyMhz,
            _that.mode,
            _that.type,
            _that.activatorName,
            _that.comments,
            _that.spotter);
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
            DateTime timestamp,
            String activator,
            String summitCode,
            String summitName,
            int altitudeM,
            int altitudeFt,
            int points,
            double frequencyMhz,
            String mode,
            SotaSpotType type,
            String? activatorName,
            String? comments,
            String? spotter)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpot() when $default != null:
        return $default(
            _that.id,
            _that.timestamp,
            _that.activator,
            _that.summitCode,
            _that.summitName,
            _that.altitudeM,
            _that.altitudeFt,
            _that.points,
            _that.frequencyMhz,
            _that.mode,
            _that.type,
            _that.activatorName,
            _that.comments,
            _that.spotter);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SotaSpot implements SotaSpot {
  const _SotaSpot(
      {required this.id,
      required this.timestamp,
      required this.activator,
      required this.summitCode,
      required this.summitName,
      required this.altitudeM,
      required this.altitudeFt,
      required this.points,
      required this.frequencyMhz,
      required this.mode,
      required this.type,
      this.activatorName,
      this.comments,
      this.spotter});

  @override
  final int id;
  @override
  final DateTime timestamp;
  @override
  final String activator;
  @override
  final String summitCode;
  @override
  final String summitName;
  @override
  final int altitudeM;
  @override
  final int altitudeFt;
  @override
  final int points;
  @override
  final double frequencyMhz;
  @override
  final String mode;
  @override
  final SotaSpotType type;
  @override
  final String? activatorName;
  @override
  final String? comments;
  @override
  final String? spotter;

  /// Create a copy of SotaSpot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SotaSpotCopyWith<_SotaSpot> get copyWith =>
      __$SotaSpotCopyWithImpl<_SotaSpot>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SotaSpot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.activator, activator) ||
                other.activator == activator) &&
            (identical(other.summitCode, summitCode) ||
                other.summitCode == summitCode) &&
            (identical(other.summitName, summitName) ||
                other.summitName == summitName) &&
            (identical(other.altitudeM, altitudeM) ||
                other.altitudeM == altitudeM) &&
            (identical(other.altitudeFt, altitudeFt) ||
                other.altitudeFt == altitudeFt) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.frequencyMhz, frequencyMhz) ||
                other.frequencyMhz == frequencyMhz) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.activatorName, activatorName) ||
                other.activatorName == activatorName) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.spotter, spotter) || other.spotter == spotter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      activator,
      summitCode,
      summitName,
      altitudeM,
      altitudeFt,
      points,
      frequencyMhz,
      mode,
      type,
      activatorName,
      comments,
      spotter);

  @override
  String toString() {
    return 'SotaSpot(id: $id, timestamp: $timestamp, activator: $activator, summitCode: $summitCode, summitName: $summitName, altitudeM: $altitudeM, altitudeFt: $altitudeFt, points: $points, frequencyMhz: $frequencyMhz, mode: $mode, type: $type, activatorName: $activatorName, comments: $comments, spotter: $spotter)';
  }
}

/// @nodoc
abstract mixin class _$SotaSpotCopyWith<$Res>
    implements $SotaSpotCopyWith<$Res> {
  factory _$SotaSpotCopyWith(_SotaSpot value, $Res Function(_SotaSpot) _then) =
      __$SotaSpotCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime timestamp,
      String activator,
      String summitCode,
      String summitName,
      int altitudeM,
      int altitudeFt,
      int points,
      double frequencyMhz,
      String mode,
      SotaSpotType type,
      String? activatorName,
      String? comments,
      String? spotter});
}

/// @nodoc
class __$SotaSpotCopyWithImpl<$Res> implements _$SotaSpotCopyWith<$Res> {
  __$SotaSpotCopyWithImpl(this._self, this._then);

  final _SotaSpot _self;
  final $Res Function(_SotaSpot) _then;

  /// Create a copy of SotaSpot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? activator = null,
    Object? summitCode = null,
    Object? summitName = null,
    Object? altitudeM = null,
    Object? altitudeFt = null,
    Object? points = null,
    Object? frequencyMhz = null,
    Object? mode = null,
    Object? type = null,
    Object? activatorName = freezed,
    Object? comments = freezed,
    Object? spotter = freezed,
  }) {
    return _then(_SotaSpot(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activator: null == activator
          ? _self.activator
          : activator // ignore: cast_nullable_to_non_nullable
              as String,
      summitCode: null == summitCode
          ? _self.summitCode
          : summitCode // ignore: cast_nullable_to_non_nullable
              as String,
      summitName: null == summitName
          ? _self.summitName
          : summitName // ignore: cast_nullable_to_non_nullable
              as String,
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
      frequencyMhz: null == frequencyMhz
          ? _self.frequencyMhz
          : frequencyMhz // ignore: cast_nullable_to_non_nullable
              as double,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SotaSpotType,
      activatorName: freezed == activatorName
          ? _self.activatorName
          : activatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      spotter: freezed == spotter
          ? _self.spotter
          : spotter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
