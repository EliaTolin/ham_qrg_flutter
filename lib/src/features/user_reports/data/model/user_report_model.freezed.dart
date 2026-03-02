// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserReportModel {
  String get id;
  @JsonKey(name: 'repeater_id')
  String get repeaterId;
  String get description;
  String get status;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  Map<String, dynamic>? get repeater;

  /// Create a copy of UserReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserReportModelCopyWith<UserReportModel> get copyWith =>
      _$UserReportModelCopyWithImpl<UserReportModel>(
          this as UserReportModel, _$identity);

  /// Serializes this UserReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserReportModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.repeater, repeater));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeaterId,
      description,
      status,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(repeater));

  @override
  String toString() {
    return 'UserReportModel(id: $id, repeaterId: $repeaterId, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, repeater: $repeater)';
  }
}

/// @nodoc
abstract mixin class $UserReportModelCopyWith<$Res> {
  factory $UserReportModelCopyWith(
          UserReportModel value, $Res Function(UserReportModel) _then) =
      _$UserReportModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'repeater_id') String repeaterId,
      String description,
      String status,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      Map<String, dynamic>? repeater});
}

/// @nodoc
class _$UserReportModelCopyWithImpl<$Res>
    implements $UserReportModelCopyWith<$Res> {
  _$UserReportModelCopyWithImpl(this._self, this._then);

  final UserReportModel _self;
  final $Res Function(UserReportModel) _then;

  /// Create a copy of UserReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repeaterId = null,
    Object? description = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? repeater = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      repeater: freezed == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserReportModel].
extension UserReportModelPatterns on UserReportModel {
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
    TResult Function(_UserReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserReportModel() when $default != null:
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
    TResult Function(_UserReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReportModel():
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
    TResult? Function(_UserReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReportModel() when $default != null:
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
            @JsonKey(name: 'repeater_id') String repeaterId,
            String description,
            String status,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            Map<String, dynamic>? repeater)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserReportModel() when $default != null:
        return $default(_that.id, _that.repeaterId, _that.description,
            _that.status, _that.createdAt, _that.updatedAt, _that.repeater);
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
            @JsonKey(name: 'repeater_id') String repeaterId,
            String description,
            String status,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            Map<String, dynamic>? repeater)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReportModel():
        return $default(_that.id, _that.repeaterId, _that.description,
            _that.status, _that.createdAt, _that.updatedAt, _that.repeater);
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
            @JsonKey(name: 'repeater_id') String repeaterId,
            String description,
            String status,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            Map<String, dynamic>? repeater)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReportModel() when $default != null:
        return $default(_that.id, _that.repeaterId, _that.description,
            _that.status, _that.createdAt, _that.updatedAt, _that.repeater);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserReportModel implements UserReportModel {
  const _UserReportModel(
      {required this.id,
      @JsonKey(name: 'repeater_id') required this.repeaterId,
      required this.description,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      final Map<String, dynamic>? repeater})
      : _repeater = repeater;
  factory _UserReportModel.fromJson(Map<String, dynamic> json) =>
      _$UserReportModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'repeater_id')
  final String repeaterId;
  @override
  final String description;
  @override
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final Map<String, dynamic>? _repeater;
  @override
  Map<String, dynamic>? get repeater {
    final value = _repeater;
    if (value == null) return null;
    if (_repeater is EqualUnmodifiableMapView) return _repeater;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of UserReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserReportModelCopyWith<_UserReportModel> get copyWith =>
      __$UserReportModelCopyWithImpl<_UserReportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserReportModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._repeater, _repeater));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeaterId,
      description,
      status,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_repeater));

  @override
  String toString() {
    return 'UserReportModel(id: $id, repeaterId: $repeaterId, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, repeater: $repeater)';
  }
}

/// @nodoc
abstract mixin class _$UserReportModelCopyWith<$Res>
    implements $UserReportModelCopyWith<$Res> {
  factory _$UserReportModelCopyWith(
          _UserReportModel value, $Res Function(_UserReportModel) _then) =
      __$UserReportModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'repeater_id') String repeaterId,
      String description,
      String status,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      Map<String, dynamic>? repeater});
}

/// @nodoc
class __$UserReportModelCopyWithImpl<$Res>
    implements _$UserReportModelCopyWith<$Res> {
  __$UserReportModelCopyWithImpl(this._self, this._then);

  final _UserReportModel _self;
  final $Res Function(_UserReportModel) _then;

  /// Create a copy of UserReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? repeaterId = null,
    Object? description = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? repeater = freezed,
  }) {
    return _then(_UserReportModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      repeater: freezed == repeater
          ? _self._repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
