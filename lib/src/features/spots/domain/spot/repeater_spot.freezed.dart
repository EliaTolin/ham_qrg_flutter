// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_spot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterSpot {
  String get id;
  String get userId;
  String get repeaterId;
  DateTime get startedAt;
  String? get callsignSnapshot;
  String? get spottedCallsign;
  String? get accessId;
  AccessMode? get accessMode;
  int? get durationMinutes;
  DateTime? get expiresAt;
  DateTime? get closedAt;
  String? get repeaterCallsign;
  String? get repeaterName;
  String? get spotterFirstName;

  /// Create a copy of RepeaterSpot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterSpotCopyWith<RepeaterSpot> get copyWith =>
      _$RepeaterSpotCopyWithImpl<RepeaterSpot>(
          this as RepeaterSpot, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterSpot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.callsignSnapshot, callsignSnapshot) ||
                other.callsignSnapshot == callsignSnapshot) &&
            (identical(other.spottedCallsign, spottedCallsign) ||
                other.spottedCallsign == spottedCallsign) &&
            (identical(other.accessId, accessId) ||
                other.accessId == accessId) &&
            (identical(other.accessMode, accessMode) ||
                other.accessMode == accessMode) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.repeaterCallsign, repeaterCallsign) ||
                other.repeaterCallsign == repeaterCallsign) &&
            (identical(other.repeaterName, repeaterName) ||
                other.repeaterName == repeaterName) &&
            (identical(other.spotterFirstName, spotterFirstName) ||
                other.spotterFirstName == spotterFirstName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      repeaterId,
      startedAt,
      callsignSnapshot,
      spottedCallsign,
      accessId,
      accessMode,
      durationMinutes,
      expiresAt,
      closedAt,
      repeaterCallsign,
      repeaterName,
      spotterFirstName);

  @override
  String toString() {
    return 'RepeaterSpot(id: $id, userId: $userId, repeaterId: $repeaterId, startedAt: $startedAt, callsignSnapshot: $callsignSnapshot, spottedCallsign: $spottedCallsign, accessId: $accessId, accessMode: $accessMode, durationMinutes: $durationMinutes, expiresAt: $expiresAt, closedAt: $closedAt, repeaterCallsign: $repeaterCallsign, repeaterName: $repeaterName, spotterFirstName: $spotterFirstName)';
  }
}

/// @nodoc
abstract mixin class $RepeaterSpotCopyWith<$Res> {
  factory $RepeaterSpotCopyWith(
          RepeaterSpot value, $Res Function(RepeaterSpot) _then) =
      _$RepeaterSpotCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String repeaterId,
      DateTime startedAt,
      String? callsignSnapshot,
      String? spottedCallsign,
      String? accessId,
      AccessMode? accessMode,
      int? durationMinutes,
      DateTime? expiresAt,
      DateTime? closedAt,
      String? repeaterCallsign,
      String? repeaterName,
      String? spotterFirstName});
}

/// @nodoc
class _$RepeaterSpotCopyWithImpl<$Res> implements $RepeaterSpotCopyWith<$Res> {
  _$RepeaterSpotCopyWithImpl(this._self, this._then);

  final RepeaterSpot _self;
  final $Res Function(RepeaterSpot) _then;

  /// Create a copy of RepeaterSpot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? repeaterId = null,
    Object? startedAt = null,
    Object? callsignSnapshot = freezed,
    Object? spottedCallsign = freezed,
    Object? accessId = freezed,
    Object? accessMode = freezed,
    Object? durationMinutes = freezed,
    Object? expiresAt = freezed,
    Object? closedAt = freezed,
    Object? repeaterCallsign = freezed,
    Object? repeaterName = freezed,
    Object? spotterFirstName = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      callsignSnapshot: freezed == callsignSnapshot
          ? _self.callsignSnapshot
          : callsignSnapshot // ignore: cast_nullable_to_non_nullable
              as String?,
      spottedCallsign: freezed == spottedCallsign
          ? _self.spottedCallsign
          : spottedCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      accessId: freezed == accessId
          ? _self.accessId
          : accessId // ignore: cast_nullable_to_non_nullable
              as String?,
      accessMode: freezed == accessMode
          ? _self.accessMode
          : accessMode // ignore: cast_nullable_to_non_nullable
              as AccessMode?,
      durationMinutes: freezed == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedAt: freezed == closedAt
          ? _self.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      repeaterCallsign: freezed == repeaterCallsign
          ? _self.repeaterCallsign
          : repeaterCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      repeaterName: freezed == repeaterName
          ? _self.repeaterName
          : repeaterName // ignore: cast_nullable_to_non_nullable
              as String?,
      spotterFirstName: freezed == spotterFirstName
          ? _self.spotterFirstName
          : spotterFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RepeaterSpot].
extension RepeaterSpotPatterns on RepeaterSpot {
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
    TResult Function(_RepeaterSpot value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterSpot() when $default != null:
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
    TResult Function(_RepeaterSpot value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterSpot():
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
    TResult? Function(_RepeaterSpot value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterSpot() when $default != null:
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
            String userId,
            String repeaterId,
            DateTime startedAt,
            String? callsignSnapshot,
            String? spottedCallsign,
            String? accessId,
            AccessMode? accessMode,
            int? durationMinutes,
            DateTime? expiresAt,
            DateTime? closedAt,
            String? repeaterCallsign,
            String? repeaterName,
            String? spotterFirstName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterSpot() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.repeaterId,
            _that.startedAt,
            _that.callsignSnapshot,
            _that.spottedCallsign,
            _that.accessId,
            _that.accessMode,
            _that.durationMinutes,
            _that.expiresAt,
            _that.closedAt,
            _that.repeaterCallsign,
            _that.repeaterName,
            _that.spotterFirstName);
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
            String userId,
            String repeaterId,
            DateTime startedAt,
            String? callsignSnapshot,
            String? spottedCallsign,
            String? accessId,
            AccessMode? accessMode,
            int? durationMinutes,
            DateTime? expiresAt,
            DateTime? closedAt,
            String? repeaterCallsign,
            String? repeaterName,
            String? spotterFirstName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterSpot():
        return $default(
            _that.id,
            _that.userId,
            _that.repeaterId,
            _that.startedAt,
            _that.callsignSnapshot,
            _that.spottedCallsign,
            _that.accessId,
            _that.accessMode,
            _that.durationMinutes,
            _that.expiresAt,
            _that.closedAt,
            _that.repeaterCallsign,
            _that.repeaterName,
            _that.spotterFirstName);
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
            String userId,
            String repeaterId,
            DateTime startedAt,
            String? callsignSnapshot,
            String? spottedCallsign,
            String? accessId,
            AccessMode? accessMode,
            int? durationMinutes,
            DateTime? expiresAt,
            DateTime? closedAt,
            String? repeaterCallsign,
            String? repeaterName,
            String? spotterFirstName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterSpot() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.repeaterId,
            _that.startedAt,
            _that.callsignSnapshot,
            _that.spottedCallsign,
            _that.accessId,
            _that.accessMode,
            _that.durationMinutes,
            _that.expiresAt,
            _that.closedAt,
            _that.repeaterCallsign,
            _that.repeaterName,
            _that.spotterFirstName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeaterSpot implements RepeaterSpot {
  const _RepeaterSpot(
      {required this.id,
      required this.userId,
      required this.repeaterId,
      required this.startedAt,
      this.callsignSnapshot,
      this.spottedCallsign,
      this.accessId,
      this.accessMode,
      this.durationMinutes,
      this.expiresAt,
      this.closedAt,
      this.repeaterCallsign,
      this.repeaterName,
      this.spotterFirstName});

  @override
  final String id;
  @override
  final String userId;
  @override
  final String repeaterId;
  @override
  final DateTime startedAt;
  @override
  final String? callsignSnapshot;
  @override
  final String? spottedCallsign;
  @override
  final String? accessId;
  @override
  final AccessMode? accessMode;
  @override
  final int? durationMinutes;
  @override
  final DateTime? expiresAt;
  @override
  final DateTime? closedAt;
  @override
  final String? repeaterCallsign;
  @override
  final String? repeaterName;
  @override
  final String? spotterFirstName;

  /// Create a copy of RepeaterSpot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterSpotCopyWith<_RepeaterSpot> get copyWith =>
      __$RepeaterSpotCopyWithImpl<_RepeaterSpot>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterSpot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.callsignSnapshot, callsignSnapshot) ||
                other.callsignSnapshot == callsignSnapshot) &&
            (identical(other.spottedCallsign, spottedCallsign) ||
                other.spottedCallsign == spottedCallsign) &&
            (identical(other.accessId, accessId) ||
                other.accessId == accessId) &&
            (identical(other.accessMode, accessMode) ||
                other.accessMode == accessMode) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.repeaterCallsign, repeaterCallsign) ||
                other.repeaterCallsign == repeaterCallsign) &&
            (identical(other.repeaterName, repeaterName) ||
                other.repeaterName == repeaterName) &&
            (identical(other.spotterFirstName, spotterFirstName) ||
                other.spotterFirstName == spotterFirstName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      repeaterId,
      startedAt,
      callsignSnapshot,
      spottedCallsign,
      accessId,
      accessMode,
      durationMinutes,
      expiresAt,
      closedAt,
      repeaterCallsign,
      repeaterName,
      spotterFirstName);

  @override
  String toString() {
    return 'RepeaterSpot(id: $id, userId: $userId, repeaterId: $repeaterId, startedAt: $startedAt, callsignSnapshot: $callsignSnapshot, spottedCallsign: $spottedCallsign, accessId: $accessId, accessMode: $accessMode, durationMinutes: $durationMinutes, expiresAt: $expiresAt, closedAt: $closedAt, repeaterCallsign: $repeaterCallsign, repeaterName: $repeaterName, spotterFirstName: $spotterFirstName)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterSpotCopyWith<$Res>
    implements $RepeaterSpotCopyWith<$Res> {
  factory _$RepeaterSpotCopyWith(
          _RepeaterSpot value, $Res Function(_RepeaterSpot) _then) =
      __$RepeaterSpotCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String repeaterId,
      DateTime startedAt,
      String? callsignSnapshot,
      String? spottedCallsign,
      String? accessId,
      AccessMode? accessMode,
      int? durationMinutes,
      DateTime? expiresAt,
      DateTime? closedAt,
      String? repeaterCallsign,
      String? repeaterName,
      String? spotterFirstName});
}

/// @nodoc
class __$RepeaterSpotCopyWithImpl<$Res>
    implements _$RepeaterSpotCopyWith<$Res> {
  __$RepeaterSpotCopyWithImpl(this._self, this._then);

  final _RepeaterSpot _self;
  final $Res Function(_RepeaterSpot) _then;

  /// Create a copy of RepeaterSpot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? repeaterId = null,
    Object? startedAt = null,
    Object? callsignSnapshot = freezed,
    Object? spottedCallsign = freezed,
    Object? accessId = freezed,
    Object? accessMode = freezed,
    Object? durationMinutes = freezed,
    Object? expiresAt = freezed,
    Object? closedAt = freezed,
    Object? repeaterCallsign = freezed,
    Object? repeaterName = freezed,
    Object? spotterFirstName = freezed,
  }) {
    return _then(_RepeaterSpot(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      callsignSnapshot: freezed == callsignSnapshot
          ? _self.callsignSnapshot
          : callsignSnapshot // ignore: cast_nullable_to_non_nullable
              as String?,
      spottedCallsign: freezed == spottedCallsign
          ? _self.spottedCallsign
          : spottedCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      accessId: freezed == accessId
          ? _self.accessId
          : accessId // ignore: cast_nullable_to_non_nullable
              as String?,
      accessMode: freezed == accessMode
          ? _self.accessMode
          : accessMode // ignore: cast_nullable_to_non_nullable
              as AccessMode?,
      durationMinutes: freezed == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedAt: freezed == closedAt
          ? _self.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      repeaterCallsign: freezed == repeaterCallsign
          ? _self.repeaterCallsign
          : repeaterCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      repeaterName: freezed == repeaterName
          ? _self.repeaterName
          : repeaterName // ignore: cast_nullable_to_non_nullable
              as String?,
      spotterFirstName: freezed == spotterFirstName
          ? _self.spotterFirstName
          : spotterFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
