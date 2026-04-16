// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_submission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSubmissionModel {
  String get id;
  @JsonKey(name: 'frequency_hz')
  int get frequencyHz;
  String get status;
  @JsonKey(name: 'created_at')
  String get createdAt;
  String? get name;
  String? get callsign;
  @JsonKey(name: 'coordinator_response')
  String? get coordinatorResponse;
  @JsonKey(name: 'responded_at')
  String? get respondedAt;

  /// Create a copy of UserSubmissionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserSubmissionModelCopyWith<UserSubmissionModel> get copyWith =>
      _$UserSubmissionModelCopyWithImpl<UserSubmissionModel>(
          this as UserSubmissionModel, _$identity);

  /// Serializes this UserSubmissionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserSubmissionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.frequencyHz, frequencyHz) ||
                other.frequencyHz == frequencyHz) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.coordinatorResponse, coordinatorResponse) ||
                other.coordinatorResponse == coordinatorResponse) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, frequencyHz, status,
      createdAt, name, callsign, coordinatorResponse, respondedAt);

  @override
  String toString() {
    return 'UserSubmissionModel(id: $id, frequencyHz: $frequencyHz, status: $status, createdAt: $createdAt, name: $name, callsign: $callsign, coordinatorResponse: $coordinatorResponse, respondedAt: $respondedAt)';
  }
}

/// @nodoc
abstract mixin class $UserSubmissionModelCopyWith<$Res> {
  factory $UserSubmissionModelCopyWith(
          UserSubmissionModel value, $Res Function(UserSubmissionModel) _then) =
      _$UserSubmissionModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'frequency_hz') int frequencyHz,
      String status,
      @JsonKey(name: 'created_at') String createdAt,
      String? name,
      String? callsign,
      @JsonKey(name: 'coordinator_response') String? coordinatorResponse,
      @JsonKey(name: 'responded_at') String? respondedAt});
}

/// @nodoc
class _$UserSubmissionModelCopyWithImpl<$Res>
    implements $UserSubmissionModelCopyWith<$Res> {
  _$UserSubmissionModelCopyWithImpl(this._self, this._then);

  final UserSubmissionModel _self;
  final $Res Function(UserSubmissionModel) _then;

  /// Create a copy of UserSubmissionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? frequencyHz = null,
    Object? status = null,
    Object? createdAt = null,
    Object? name = freezed,
    Object? callsign = freezed,
    Object? coordinatorResponse = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyHz: null == frequencyHz
          ? _self.frequencyHz
          : frequencyHz // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinatorResponse: freezed == coordinatorResponse
          ? _self.coordinatorResponse
          : coordinatorResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedAt: freezed == respondedAt
          ? _self.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserSubmissionModel].
extension UserSubmissionModelPatterns on UserSubmissionModel {
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
    TResult Function(_UserSubmissionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserSubmissionModel() when $default != null:
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
    TResult Function(_UserSubmissionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSubmissionModel():
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
    TResult? Function(_UserSubmissionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSubmissionModel() when $default != null:
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
            @JsonKey(name: 'frequency_hz') int frequencyHz,
            String status,
            @JsonKey(name: 'created_at') String createdAt,
            String? name,
            String? callsign,
            @JsonKey(name: 'coordinator_response') String? coordinatorResponse,
            @JsonKey(name: 'responded_at') String? respondedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserSubmissionModel() when $default != null:
        return $default(
            _that.id,
            _that.frequencyHz,
            _that.status,
            _that.createdAt,
            _that.name,
            _that.callsign,
            _that.coordinatorResponse,
            _that.respondedAt);
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
            @JsonKey(name: 'frequency_hz') int frequencyHz,
            String status,
            @JsonKey(name: 'created_at') String createdAt,
            String? name,
            String? callsign,
            @JsonKey(name: 'coordinator_response') String? coordinatorResponse,
            @JsonKey(name: 'responded_at') String? respondedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSubmissionModel():
        return $default(
            _that.id,
            _that.frequencyHz,
            _that.status,
            _that.createdAt,
            _that.name,
            _that.callsign,
            _that.coordinatorResponse,
            _that.respondedAt);
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
            @JsonKey(name: 'frequency_hz') int frequencyHz,
            String status,
            @JsonKey(name: 'created_at') String createdAt,
            String? name,
            String? callsign,
            @JsonKey(name: 'coordinator_response') String? coordinatorResponse,
            @JsonKey(name: 'responded_at') String? respondedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSubmissionModel() when $default != null:
        return $default(
            _that.id,
            _that.frequencyHz,
            _that.status,
            _that.createdAt,
            _that.name,
            _that.callsign,
            _that.coordinatorResponse,
            _that.respondedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserSubmissionModel implements UserSubmissionModel {
  const _UserSubmissionModel(
      {required this.id,
      @JsonKey(name: 'frequency_hz') required this.frequencyHz,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      this.name,
      this.callsign,
      @JsonKey(name: 'coordinator_response') this.coordinatorResponse,
      @JsonKey(name: 'responded_at') this.respondedAt});
  factory _UserSubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$UserSubmissionModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'frequency_hz')
  final int frequencyHz;
  @override
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final String? name;
  @override
  final String? callsign;
  @override
  @JsonKey(name: 'coordinator_response')
  final String? coordinatorResponse;
  @override
  @JsonKey(name: 'responded_at')
  final String? respondedAt;

  /// Create a copy of UserSubmissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserSubmissionModelCopyWith<_UserSubmissionModel> get copyWith =>
      __$UserSubmissionModelCopyWithImpl<_UserSubmissionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserSubmissionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserSubmissionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.frequencyHz, frequencyHz) ||
                other.frequencyHz == frequencyHz) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.coordinatorResponse, coordinatorResponse) ||
                other.coordinatorResponse == coordinatorResponse) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, frequencyHz, status,
      createdAt, name, callsign, coordinatorResponse, respondedAt);

  @override
  String toString() {
    return 'UserSubmissionModel(id: $id, frequencyHz: $frequencyHz, status: $status, createdAt: $createdAt, name: $name, callsign: $callsign, coordinatorResponse: $coordinatorResponse, respondedAt: $respondedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserSubmissionModelCopyWith<$Res>
    implements $UserSubmissionModelCopyWith<$Res> {
  factory _$UserSubmissionModelCopyWith(_UserSubmissionModel value,
          $Res Function(_UserSubmissionModel) _then) =
      __$UserSubmissionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'frequency_hz') int frequencyHz,
      String status,
      @JsonKey(name: 'created_at') String createdAt,
      String? name,
      String? callsign,
      @JsonKey(name: 'coordinator_response') String? coordinatorResponse,
      @JsonKey(name: 'responded_at') String? respondedAt});
}

/// @nodoc
class __$UserSubmissionModelCopyWithImpl<$Res>
    implements _$UserSubmissionModelCopyWith<$Res> {
  __$UserSubmissionModelCopyWithImpl(this._self, this._then);

  final _UserSubmissionModel _self;
  final $Res Function(_UserSubmissionModel) _then;

  /// Create a copy of UserSubmissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? frequencyHz = null,
    Object? status = null,
    Object? createdAt = null,
    Object? name = freezed,
    Object? callsign = freezed,
    Object? coordinatorResponse = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_UserSubmissionModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyHz: null == frequencyHz
          ? _self.frequencyHz
          : frequencyHz // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinatorResponse: freezed == coordinatorResponse
          ? _self.coordinatorResponse
          : coordinatorResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedAt: freezed == respondedAt
          ? _self.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
