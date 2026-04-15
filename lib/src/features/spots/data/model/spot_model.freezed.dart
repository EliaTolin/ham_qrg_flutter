// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpotModel {
  String get id;
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'repeater_id')
  String get repeaterId;
  @JsonKey(name: 'started_at')
  DateTime get startedAt;
  @JsonKey(name: 'callsign_snapshot')
  String? get callsignSnapshot;
  @JsonKey(name: 'spotted_callsign')
  String? get spottedCallsign;
  @JsonKey(name: 'access_id')
  String? get accessId;
  @JsonKey(name: 'duration_minutes')
  int? get durationMinutes;
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @JsonKey(name: 'closed_at')
  DateTime? get closedAt;
  @JsonKey(name: 'profiles')
  SpotProfileModel? get profile;
  @JsonKey(name: 'repeaters')
  SpotRepeaterModel? get repeater;
  @JsonKey(name: 'repeater_access')
  SpotAccessModel? get access;

  /// Create a copy of SpotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpotModelCopyWith<SpotModel> get copyWith =>
      _$SpotModelCopyWithImpl<SpotModel>(this as SpotModel, _$identity);

  /// Serializes this SpotModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpotModel &&
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
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.access, access) || other.access == access));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      durationMinutes,
      expiresAt,
      closedAt,
      profile,
      repeater,
      access);

  @override
  String toString() {
    return 'SpotModel(id: $id, userId: $userId, repeaterId: $repeaterId, startedAt: $startedAt, callsignSnapshot: $callsignSnapshot, spottedCallsign: $spottedCallsign, accessId: $accessId, durationMinutes: $durationMinutes, expiresAt: $expiresAt, closedAt: $closedAt, profile: $profile, repeater: $repeater, access: $access)';
  }
}

/// @nodoc
abstract mixin class $SpotModelCopyWith<$Res> {
  factory $SpotModelCopyWith(SpotModel value, $Res Function(SpotModel) _then) =
      _$SpotModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'repeater_id') String repeaterId,
      @JsonKey(name: 'started_at') DateTime startedAt,
      @JsonKey(name: 'callsign_snapshot') String? callsignSnapshot,
      @JsonKey(name: 'spotted_callsign') String? spottedCallsign,
      @JsonKey(name: 'access_id') String? accessId,
      @JsonKey(name: 'duration_minutes') int? durationMinutes,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'closed_at') DateTime? closedAt,
      @JsonKey(name: 'profiles') SpotProfileModel? profile,
      @JsonKey(name: 'repeaters') SpotRepeaterModel? repeater,
      @JsonKey(name: 'repeater_access') SpotAccessModel? access});

  $SpotProfileModelCopyWith<$Res>? get profile;
  $SpotRepeaterModelCopyWith<$Res>? get repeater;
  $SpotAccessModelCopyWith<$Res>? get access;
}

/// @nodoc
class _$SpotModelCopyWithImpl<$Res> implements $SpotModelCopyWith<$Res> {
  _$SpotModelCopyWithImpl(this._self, this._then);

  final SpotModel _self;
  final $Res Function(SpotModel) _then;

  /// Create a copy of SpotModel
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
    Object? durationMinutes = freezed,
    Object? expiresAt = freezed,
    Object? closedAt = freezed,
    Object? profile = freezed,
    Object? repeater = freezed,
    Object? access = freezed,
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
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as SpotProfileModel?,
      repeater: freezed == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as SpotRepeaterModel?,
      access: freezed == access
          ? _self.access
          : access // ignore: cast_nullable_to_non_nullable
              as SpotAccessModel?,
    ));
  }

  /// Create a copy of SpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotProfileModelCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $SpotProfileModelCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of SpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotRepeaterModelCopyWith<$Res>? get repeater {
    if (_self.repeater == null) {
      return null;
    }

    return $SpotRepeaterModelCopyWith<$Res>(_self.repeater!, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of SpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotAccessModelCopyWith<$Res>? get access {
    if (_self.access == null) {
      return null;
    }

    return $SpotAccessModelCopyWith<$Res>(_self.access!, (value) {
      return _then(_self.copyWith(access: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SpotModel].
extension SpotModelPatterns on SpotModel {
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
    TResult Function(_SpotModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotModel() when $default != null:
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
    TResult Function(_SpotModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotModel():
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
    TResult? Function(_SpotModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotModel() when $default != null:
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
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'repeater_id') String repeaterId,
            @JsonKey(name: 'started_at') DateTime startedAt,
            @JsonKey(name: 'callsign_snapshot') String? callsignSnapshot,
            @JsonKey(name: 'spotted_callsign') String? spottedCallsign,
            @JsonKey(name: 'access_id') String? accessId,
            @JsonKey(name: 'duration_minutes') int? durationMinutes,
            @JsonKey(name: 'expires_at') DateTime? expiresAt,
            @JsonKey(name: 'closed_at') DateTime? closedAt,
            @JsonKey(name: 'profiles') SpotProfileModel? profile,
            @JsonKey(name: 'repeaters') SpotRepeaterModel? repeater,
            @JsonKey(name: 'repeater_access') SpotAccessModel? access)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotModel() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.repeaterId,
            _that.startedAt,
            _that.callsignSnapshot,
            _that.spottedCallsign,
            _that.accessId,
            _that.durationMinutes,
            _that.expiresAt,
            _that.closedAt,
            _that.profile,
            _that.repeater,
            _that.access);
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
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'repeater_id') String repeaterId,
            @JsonKey(name: 'started_at') DateTime startedAt,
            @JsonKey(name: 'callsign_snapshot') String? callsignSnapshot,
            @JsonKey(name: 'spotted_callsign') String? spottedCallsign,
            @JsonKey(name: 'access_id') String? accessId,
            @JsonKey(name: 'duration_minutes') int? durationMinutes,
            @JsonKey(name: 'expires_at') DateTime? expiresAt,
            @JsonKey(name: 'closed_at') DateTime? closedAt,
            @JsonKey(name: 'profiles') SpotProfileModel? profile,
            @JsonKey(name: 'repeaters') SpotRepeaterModel? repeater,
            @JsonKey(name: 'repeater_access') SpotAccessModel? access)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotModel():
        return $default(
            _that.id,
            _that.userId,
            _that.repeaterId,
            _that.startedAt,
            _that.callsignSnapshot,
            _that.spottedCallsign,
            _that.accessId,
            _that.durationMinutes,
            _that.expiresAt,
            _that.closedAt,
            _that.profile,
            _that.repeater,
            _that.access);
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
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'repeater_id') String repeaterId,
            @JsonKey(name: 'started_at') DateTime startedAt,
            @JsonKey(name: 'callsign_snapshot') String? callsignSnapshot,
            @JsonKey(name: 'spotted_callsign') String? spottedCallsign,
            @JsonKey(name: 'access_id') String? accessId,
            @JsonKey(name: 'duration_minutes') int? durationMinutes,
            @JsonKey(name: 'expires_at') DateTime? expiresAt,
            @JsonKey(name: 'closed_at') DateTime? closedAt,
            @JsonKey(name: 'profiles') SpotProfileModel? profile,
            @JsonKey(name: 'repeaters') SpotRepeaterModel? repeater,
            @JsonKey(name: 'repeater_access') SpotAccessModel? access)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotModel() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.repeaterId,
            _that.startedAt,
            _that.callsignSnapshot,
            _that.spottedCallsign,
            _that.accessId,
            _that.durationMinutes,
            _that.expiresAt,
            _that.closedAt,
            _that.profile,
            _that.repeater,
            _that.access);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SpotModel implements SpotModel {
  const _SpotModel(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'repeater_id') required this.repeaterId,
      @JsonKey(name: 'started_at') required this.startedAt,
      @JsonKey(name: 'callsign_snapshot') this.callsignSnapshot,
      @JsonKey(name: 'spotted_callsign') this.spottedCallsign,
      @JsonKey(name: 'access_id') this.accessId,
      @JsonKey(name: 'duration_minutes') this.durationMinutes,
      @JsonKey(name: 'expires_at') this.expiresAt,
      @JsonKey(name: 'closed_at') this.closedAt,
      @JsonKey(name: 'profiles') this.profile,
      @JsonKey(name: 'repeaters') this.repeater,
      @JsonKey(name: 'repeater_access') this.access});
  factory _SpotModel.fromJson(Map<String, dynamic> json) =>
      _$SpotModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'repeater_id')
  final String repeaterId;
  @override
  @JsonKey(name: 'started_at')
  final DateTime startedAt;
  @override
  @JsonKey(name: 'callsign_snapshot')
  final String? callsignSnapshot;
  @override
  @JsonKey(name: 'spotted_callsign')
  final String? spottedCallsign;
  @override
  @JsonKey(name: 'access_id')
  final String? accessId;
  @override
  @JsonKey(name: 'duration_minutes')
  final int? durationMinutes;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @JsonKey(name: 'closed_at')
  final DateTime? closedAt;
  @override
  @JsonKey(name: 'profiles')
  final SpotProfileModel? profile;
  @override
  @JsonKey(name: 'repeaters')
  final SpotRepeaterModel? repeater;
  @override
  @JsonKey(name: 'repeater_access')
  final SpotAccessModel? access;

  /// Create a copy of SpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpotModelCopyWith<_SpotModel> get copyWith =>
      __$SpotModelCopyWithImpl<_SpotModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SpotModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpotModel &&
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
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.access, access) || other.access == access));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      durationMinutes,
      expiresAt,
      closedAt,
      profile,
      repeater,
      access);

  @override
  String toString() {
    return 'SpotModel(id: $id, userId: $userId, repeaterId: $repeaterId, startedAt: $startedAt, callsignSnapshot: $callsignSnapshot, spottedCallsign: $spottedCallsign, accessId: $accessId, durationMinutes: $durationMinutes, expiresAt: $expiresAt, closedAt: $closedAt, profile: $profile, repeater: $repeater, access: $access)';
  }
}

/// @nodoc
abstract mixin class _$SpotModelCopyWith<$Res>
    implements $SpotModelCopyWith<$Res> {
  factory _$SpotModelCopyWith(
          _SpotModel value, $Res Function(_SpotModel) _then) =
      __$SpotModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'repeater_id') String repeaterId,
      @JsonKey(name: 'started_at') DateTime startedAt,
      @JsonKey(name: 'callsign_snapshot') String? callsignSnapshot,
      @JsonKey(name: 'spotted_callsign') String? spottedCallsign,
      @JsonKey(name: 'access_id') String? accessId,
      @JsonKey(name: 'duration_minutes') int? durationMinutes,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'closed_at') DateTime? closedAt,
      @JsonKey(name: 'profiles') SpotProfileModel? profile,
      @JsonKey(name: 'repeaters') SpotRepeaterModel? repeater,
      @JsonKey(name: 'repeater_access') SpotAccessModel? access});

  @override
  $SpotProfileModelCopyWith<$Res>? get profile;
  @override
  $SpotRepeaterModelCopyWith<$Res>? get repeater;
  @override
  $SpotAccessModelCopyWith<$Res>? get access;
}

/// @nodoc
class __$SpotModelCopyWithImpl<$Res> implements _$SpotModelCopyWith<$Res> {
  __$SpotModelCopyWithImpl(this._self, this._then);

  final _SpotModel _self;
  final $Res Function(_SpotModel) _then;

  /// Create a copy of SpotModel
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
    Object? durationMinutes = freezed,
    Object? expiresAt = freezed,
    Object? closedAt = freezed,
    Object? profile = freezed,
    Object? repeater = freezed,
    Object? access = freezed,
  }) {
    return _then(_SpotModel(
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
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as SpotProfileModel?,
      repeater: freezed == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as SpotRepeaterModel?,
      access: freezed == access
          ? _self.access
          : access // ignore: cast_nullable_to_non_nullable
              as SpotAccessModel?,
    ));
  }

  /// Create a copy of SpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotProfileModelCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $SpotProfileModelCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of SpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotRepeaterModelCopyWith<$Res>? get repeater {
    if (_self.repeater == null) {
      return null;
    }

    return $SpotRepeaterModelCopyWith<$Res>(_self.repeater!, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of SpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotAccessModelCopyWith<$Res>? get access {
    if (_self.access == null) {
      return null;
    }

    return $SpotAccessModelCopyWith<$Res>(_self.access!, (value) {
      return _then(_self.copyWith(access: value));
    });
  }
}

/// @nodoc
mixin _$SpotProfileModel {
  String get id;
  String? get callsign;
  @JsonKey(name: 'first_name')
  String? get firstName;

  /// Create a copy of SpotProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpotProfileModelCopyWith<SpotProfileModel> get copyWith =>
      _$SpotProfileModelCopyWithImpl<SpotProfileModel>(
          this as SpotProfileModel, _$identity);

  /// Serializes this SpotProfileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpotProfileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, callsign, firstName);

  @override
  String toString() {
    return 'SpotProfileModel(id: $id, callsign: $callsign, firstName: $firstName)';
  }
}

/// @nodoc
abstract mixin class $SpotProfileModelCopyWith<$Res> {
  factory $SpotProfileModelCopyWith(
          SpotProfileModel value, $Res Function(SpotProfileModel) _then) =
      _$SpotProfileModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? callsign,
      @JsonKey(name: 'first_name') String? firstName});
}

/// @nodoc
class _$SpotProfileModelCopyWithImpl<$Res>
    implements $SpotProfileModelCopyWith<$Res> {
  _$SpotProfileModelCopyWithImpl(this._self, this._then);

  final SpotProfileModel _self;
  final $Res Function(SpotProfileModel) _then;

  /// Create a copy of SpotProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? callsign = freezed,
    Object? firstName = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SpotProfileModel].
extension SpotProfileModelPatterns on SpotProfileModel {
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
    TResult Function(_SpotProfileModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotProfileModel() when $default != null:
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
    TResult Function(_SpotProfileModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotProfileModel():
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
    TResult? Function(_SpotProfileModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotProfileModel() when $default != null:
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
    TResult Function(String id, String? callsign,
            @JsonKey(name: 'first_name') String? firstName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotProfileModel() when $default != null:
        return $default(_that.id, _that.callsign, _that.firstName);
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
    TResult Function(String id, String? callsign,
            @JsonKey(name: 'first_name') String? firstName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotProfileModel():
        return $default(_that.id, _that.callsign, _that.firstName);
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
    TResult? Function(String id, String? callsign,
            @JsonKey(name: 'first_name') String? firstName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotProfileModel() when $default != null:
        return $default(_that.id, _that.callsign, _that.firstName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SpotProfileModel implements SpotProfileModel {
  const _SpotProfileModel(
      {required this.id,
      this.callsign,
      @JsonKey(name: 'first_name') this.firstName});
  factory _SpotProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SpotProfileModelFromJson(json);

  @override
  final String id;
  @override
  final String? callsign;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;

  /// Create a copy of SpotProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpotProfileModelCopyWith<_SpotProfileModel> get copyWith =>
      __$SpotProfileModelCopyWithImpl<_SpotProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SpotProfileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpotProfileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, callsign, firstName);

  @override
  String toString() {
    return 'SpotProfileModel(id: $id, callsign: $callsign, firstName: $firstName)';
  }
}

/// @nodoc
abstract mixin class _$SpotProfileModelCopyWith<$Res>
    implements $SpotProfileModelCopyWith<$Res> {
  factory _$SpotProfileModelCopyWith(
          _SpotProfileModel value, $Res Function(_SpotProfileModel) _then) =
      __$SpotProfileModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String? callsign,
      @JsonKey(name: 'first_name') String? firstName});
}

/// @nodoc
class __$SpotProfileModelCopyWithImpl<$Res>
    implements _$SpotProfileModelCopyWith<$Res> {
  __$SpotProfileModelCopyWithImpl(this._self, this._then);

  final _SpotProfileModel _self;
  final $Res Function(_SpotProfileModel) _then;

  /// Create a copy of SpotProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? callsign = freezed,
    Object? firstName = freezed,
  }) {
    return _then(_SpotProfileModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SpotRepeaterModel {
  String get id;
  String? get callsign;
  String? get name;

  /// Create a copy of SpotRepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpotRepeaterModelCopyWith<SpotRepeaterModel> get copyWith =>
      _$SpotRepeaterModelCopyWithImpl<SpotRepeaterModel>(
          this as SpotRepeaterModel, _$identity);

  /// Serializes this SpotRepeaterModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpotRepeaterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, callsign, name);

  @override
  String toString() {
    return 'SpotRepeaterModel(id: $id, callsign: $callsign, name: $name)';
  }
}

/// @nodoc
abstract mixin class $SpotRepeaterModelCopyWith<$Res> {
  factory $SpotRepeaterModelCopyWith(
          SpotRepeaterModel value, $Res Function(SpotRepeaterModel) _then) =
      _$SpotRepeaterModelCopyWithImpl;
  @useResult
  $Res call({String id, String? callsign, String? name});
}

/// @nodoc
class _$SpotRepeaterModelCopyWithImpl<$Res>
    implements $SpotRepeaterModelCopyWith<$Res> {
  _$SpotRepeaterModelCopyWithImpl(this._self, this._then);

  final SpotRepeaterModel _self;
  final $Res Function(SpotRepeaterModel) _then;

  /// Create a copy of SpotRepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? callsign = freezed,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SpotRepeaterModel].
extension SpotRepeaterModelPatterns on SpotRepeaterModel {
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
    TResult Function(_SpotRepeaterModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotRepeaterModel() when $default != null:
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
    TResult Function(_SpotRepeaterModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotRepeaterModel():
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
    TResult? Function(_SpotRepeaterModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotRepeaterModel() when $default != null:
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
    TResult Function(String id, String? callsign, String? name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotRepeaterModel() when $default != null:
        return $default(_that.id, _that.callsign, _that.name);
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
    TResult Function(String id, String? callsign, String? name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotRepeaterModel():
        return $default(_that.id, _that.callsign, _that.name);
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
    TResult? Function(String id, String? callsign, String? name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotRepeaterModel() when $default != null:
        return $default(_that.id, _that.callsign, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SpotRepeaterModel implements SpotRepeaterModel {
  const _SpotRepeaterModel({required this.id, this.callsign, this.name});
  factory _SpotRepeaterModel.fromJson(Map<String, dynamic> json) =>
      _$SpotRepeaterModelFromJson(json);

  @override
  final String id;
  @override
  final String? callsign;
  @override
  final String? name;

  /// Create a copy of SpotRepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpotRepeaterModelCopyWith<_SpotRepeaterModel> get copyWith =>
      __$SpotRepeaterModelCopyWithImpl<_SpotRepeaterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SpotRepeaterModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpotRepeaterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, callsign, name);

  @override
  String toString() {
    return 'SpotRepeaterModel(id: $id, callsign: $callsign, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$SpotRepeaterModelCopyWith<$Res>
    implements $SpotRepeaterModelCopyWith<$Res> {
  factory _$SpotRepeaterModelCopyWith(
          _SpotRepeaterModel value, $Res Function(_SpotRepeaterModel) _then) =
      __$SpotRepeaterModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String? callsign, String? name});
}

/// @nodoc
class __$SpotRepeaterModelCopyWithImpl<$Res>
    implements _$SpotRepeaterModelCopyWith<$Res> {
  __$SpotRepeaterModelCopyWithImpl(this._self, this._then);

  final _SpotRepeaterModel _self;
  final $Res Function(_SpotRepeaterModel) _then;

  /// Create a copy of SpotRepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? callsign = freezed,
    Object? name = freezed,
  }) {
    return _then(_SpotRepeaterModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SpotAccessModel {
  String get id;
  String get mode;

  /// Create a copy of SpotAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpotAccessModelCopyWith<SpotAccessModel> get copyWith =>
      _$SpotAccessModelCopyWithImpl<SpotAccessModel>(
          this as SpotAccessModel, _$identity);

  /// Serializes this SpotAccessModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpotAccessModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, mode);

  @override
  String toString() {
    return 'SpotAccessModel(id: $id, mode: $mode)';
  }
}

/// @nodoc
abstract mixin class $SpotAccessModelCopyWith<$Res> {
  factory $SpotAccessModelCopyWith(
          SpotAccessModel value, $Res Function(SpotAccessModel) _then) =
      _$SpotAccessModelCopyWithImpl;
  @useResult
  $Res call({String id, String mode});
}

/// @nodoc
class _$SpotAccessModelCopyWithImpl<$Res>
    implements $SpotAccessModelCopyWith<$Res> {
  _$SpotAccessModelCopyWithImpl(this._self, this._then);

  final SpotAccessModel _self;
  final $Res Function(SpotAccessModel) _then;

  /// Create a copy of SpotAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mode = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SpotAccessModel].
extension SpotAccessModelPatterns on SpotAccessModel {
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
    TResult Function(_SpotAccessModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotAccessModel() when $default != null:
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
    TResult Function(_SpotAccessModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotAccessModel():
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
    TResult? Function(_SpotAccessModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotAccessModel() when $default != null:
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
    TResult Function(String id, String mode)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotAccessModel() when $default != null:
        return $default(_that.id, _that.mode);
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
    TResult Function(String id, String mode) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotAccessModel():
        return $default(_that.id, _that.mode);
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
    TResult? Function(String id, String mode)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotAccessModel() when $default != null:
        return $default(_that.id, _that.mode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SpotAccessModel implements SpotAccessModel {
  const _SpotAccessModel({required this.id, required this.mode});
  factory _SpotAccessModel.fromJson(Map<String, dynamic> json) =>
      _$SpotAccessModelFromJson(json);

  @override
  final String id;
  @override
  final String mode;

  /// Create a copy of SpotAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpotAccessModelCopyWith<_SpotAccessModel> get copyWith =>
      __$SpotAccessModelCopyWithImpl<_SpotAccessModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SpotAccessModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpotAccessModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, mode);

  @override
  String toString() {
    return 'SpotAccessModel(id: $id, mode: $mode)';
  }
}

/// @nodoc
abstract mixin class _$SpotAccessModelCopyWith<$Res>
    implements $SpotAccessModelCopyWith<$Res> {
  factory _$SpotAccessModelCopyWith(
          _SpotAccessModel value, $Res Function(_SpotAccessModel) _then) =
      __$SpotAccessModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String mode});
}

/// @nodoc
class __$SpotAccessModelCopyWithImpl<$Res>
    implements _$SpotAccessModelCopyWith<$Res> {
  __$SpotAccessModelCopyWithImpl(this._self, this._then);

  final _SpotAccessModel _self;
  final $Res Function(_SpotAccessModel) _then;

  /// Create a copy of SpotAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? mode = null,
  }) {
    return _then(_SpotAccessModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
