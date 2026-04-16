// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSubmission {
  String get id;
  String? get name;
  String? get callsign;
  int get frequencyHz;
  UserSubmissionStatus get status;
  DateTime get createdAt;
  String? get coordinatorResponse;
  DateTime? get respondedAt;

  /// Create a copy of UserSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserSubmissionCopyWith<UserSubmission> get copyWith =>
      _$UserSubmissionCopyWithImpl<UserSubmission>(
          this as UserSubmission, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserSubmission &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.frequencyHz, frequencyHz) ||
                other.frequencyHz == frequencyHz) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.coordinatorResponse, coordinatorResponse) ||
                other.coordinatorResponse == coordinatorResponse) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, callsign, frequencyHz,
      status, createdAt, coordinatorResponse, respondedAt);

  @override
  String toString() {
    return 'UserSubmission(id: $id, name: $name, callsign: $callsign, frequencyHz: $frequencyHz, status: $status, createdAt: $createdAt, coordinatorResponse: $coordinatorResponse, respondedAt: $respondedAt)';
  }
}

/// @nodoc
abstract mixin class $UserSubmissionCopyWith<$Res> {
  factory $UserSubmissionCopyWith(
          UserSubmission value, $Res Function(UserSubmission) _then) =
      _$UserSubmissionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? callsign,
      int frequencyHz,
      UserSubmissionStatus status,
      DateTime createdAt,
      String? coordinatorResponse,
      DateTime? respondedAt});
}

/// @nodoc
class _$UserSubmissionCopyWithImpl<$Res>
    implements $UserSubmissionCopyWith<$Res> {
  _$UserSubmissionCopyWithImpl(this._self, this._then);

  final UserSubmission _self;
  final $Res Function(UserSubmission) _then;

  /// Create a copy of UserSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? callsign = freezed,
    Object? frequencyHz = null,
    Object? status = null,
    Object? createdAt = null,
    Object? coordinatorResponse = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      frequencyHz: null == frequencyHz
          ? _self.frequencyHz
          : frequencyHz // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserSubmissionStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coordinatorResponse: freezed == coordinatorResponse
          ? _self.coordinatorResponse
          : coordinatorResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedAt: freezed == respondedAt
          ? _self.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserSubmission].
extension UserSubmissionPatterns on UserSubmission {
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
    TResult Function(_UserSubmission value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserSubmission() when $default != null:
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
    TResult Function(_UserSubmission value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSubmission():
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
    TResult? Function(_UserSubmission value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSubmission() when $default != null:
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
            String? name,
            String? callsign,
            int frequencyHz,
            UserSubmissionStatus status,
            DateTime createdAt,
            String? coordinatorResponse,
            DateTime? respondedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserSubmission() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.callsign,
            _that.frequencyHz,
            _that.status,
            _that.createdAt,
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
            String? name,
            String? callsign,
            int frequencyHz,
            UserSubmissionStatus status,
            DateTime createdAt,
            String? coordinatorResponse,
            DateTime? respondedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSubmission():
        return $default(
            _that.id,
            _that.name,
            _that.callsign,
            _that.frequencyHz,
            _that.status,
            _that.createdAt,
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
            String? name,
            String? callsign,
            int frequencyHz,
            UserSubmissionStatus status,
            DateTime createdAt,
            String? coordinatorResponse,
            DateTime? respondedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSubmission() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.callsign,
            _that.frequencyHz,
            _that.status,
            _that.createdAt,
            _that.coordinatorResponse,
            _that.respondedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserSubmission implements UserSubmission {
  const _UserSubmission(
      {required this.id,
      required this.name,
      required this.callsign,
      required this.frequencyHz,
      required this.status,
      required this.createdAt,
      this.coordinatorResponse,
      this.respondedAt});

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? callsign;
  @override
  final int frequencyHz;
  @override
  final UserSubmissionStatus status;
  @override
  final DateTime createdAt;
  @override
  final String? coordinatorResponse;
  @override
  final DateTime? respondedAt;

  /// Create a copy of UserSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserSubmissionCopyWith<_UserSubmission> get copyWith =>
      __$UserSubmissionCopyWithImpl<_UserSubmission>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserSubmission &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.frequencyHz, frequencyHz) ||
                other.frequencyHz == frequencyHz) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.coordinatorResponse, coordinatorResponse) ||
                other.coordinatorResponse == coordinatorResponse) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, callsign, frequencyHz,
      status, createdAt, coordinatorResponse, respondedAt);

  @override
  String toString() {
    return 'UserSubmission(id: $id, name: $name, callsign: $callsign, frequencyHz: $frequencyHz, status: $status, createdAt: $createdAt, coordinatorResponse: $coordinatorResponse, respondedAt: $respondedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserSubmissionCopyWith<$Res>
    implements $UserSubmissionCopyWith<$Res> {
  factory _$UserSubmissionCopyWith(
          _UserSubmission value, $Res Function(_UserSubmission) _then) =
      __$UserSubmissionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? callsign,
      int frequencyHz,
      UserSubmissionStatus status,
      DateTime createdAt,
      String? coordinatorResponse,
      DateTime? respondedAt});
}

/// @nodoc
class __$UserSubmissionCopyWithImpl<$Res>
    implements _$UserSubmissionCopyWith<$Res> {
  __$UserSubmissionCopyWithImpl(this._self, this._then);

  final _UserSubmission _self;
  final $Res Function(_UserSubmission) _then;

  /// Create a copy of UserSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? callsign = freezed,
    Object? frequencyHz = null,
    Object? status = null,
    Object? createdAt = null,
    Object? coordinatorResponse = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_UserSubmission(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      frequencyHz: null == frequencyHz
          ? _self.frequencyHz
          : frequencyHz // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserSubmissionStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coordinatorResponse: freezed == coordinatorResponse
          ? _self.coordinatorResponse
          : coordinatorResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedAt: freezed == respondedAt
          ? _self.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
