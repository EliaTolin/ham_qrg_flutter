// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserReport {
  String get id;
  String get repeaterId;
  String get repeaterCallsign;
  String? get repeaterName;
  String get description;
  UserReportStatus get status;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of UserReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserReportCopyWith<UserReport> get copyWith =>
      _$UserReportCopyWithImpl<UserReport>(this as UserReport, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserReport &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.repeaterCallsign, repeaterCallsign) ||
                other.repeaterCallsign == repeaterCallsign) &&
            (identical(other.repeaterName, repeaterName) ||
                other.repeaterName == repeaterName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, repeaterId, repeaterCallsign,
      repeaterName, description, status, createdAt, updatedAt);

  @override
  String toString() {
    return 'UserReport(id: $id, repeaterId: $repeaterId, repeaterCallsign: $repeaterCallsign, repeaterName: $repeaterName, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $UserReportCopyWith<$Res> {
  factory $UserReportCopyWith(
          UserReport value, $Res Function(UserReport) _then) =
      _$UserReportCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String repeaterId,
      String repeaterCallsign,
      String? repeaterName,
      String description,
      UserReportStatus status,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserReportCopyWithImpl<$Res> implements $UserReportCopyWith<$Res> {
  _$UserReportCopyWithImpl(this._self, this._then);

  final UserReport _self;
  final $Res Function(UserReport) _then;

  /// Create a copy of UserReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repeaterId = null,
    Object? repeaterCallsign = null,
    Object? repeaterName = freezed,
    Object? description = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      repeaterCallsign: null == repeaterCallsign
          ? _self.repeaterCallsign
          : repeaterCallsign // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterName: freezed == repeaterName
          ? _self.repeaterName
          : repeaterName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserReportStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserReport].
extension UserReportPatterns on UserReport {
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
    TResult Function(_UserReport value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserReport() when $default != null:
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
    TResult Function(_UserReport value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReport():
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
    TResult? Function(_UserReport value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReport() when $default != null:
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
            String repeaterId,
            String repeaterCallsign,
            String? repeaterName,
            String description,
            UserReportStatus status,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserReport() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.repeaterCallsign,
            _that.repeaterName,
            _that.description,
            _that.status,
            _that.createdAt,
            _that.updatedAt);
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
            String repeaterId,
            String repeaterCallsign,
            String? repeaterName,
            String description,
            UserReportStatus status,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReport():
        return $default(
            _that.id,
            _that.repeaterId,
            _that.repeaterCallsign,
            _that.repeaterName,
            _that.description,
            _that.status,
            _that.createdAt,
            _that.updatedAt);
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
            String repeaterId,
            String repeaterCallsign,
            String? repeaterName,
            String description,
            UserReportStatus status,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReport() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.repeaterCallsign,
            _that.repeaterName,
            _that.description,
            _that.status,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserReport implements UserReport {
  const _UserReport(
      {required this.id,
      required this.repeaterId,
      required this.repeaterCallsign,
      required this.repeaterName,
      required this.description,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String id;
  @override
  final String repeaterId;
  @override
  final String repeaterCallsign;
  @override
  final String? repeaterName;
  @override
  final String description;
  @override
  final UserReportStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of UserReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserReportCopyWith<_UserReport> get copyWith =>
      __$UserReportCopyWithImpl<_UserReport>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserReport &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.repeaterCallsign, repeaterCallsign) ||
                other.repeaterCallsign == repeaterCallsign) &&
            (identical(other.repeaterName, repeaterName) ||
                other.repeaterName == repeaterName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, repeaterId, repeaterCallsign,
      repeaterName, description, status, createdAt, updatedAt);

  @override
  String toString() {
    return 'UserReport(id: $id, repeaterId: $repeaterId, repeaterCallsign: $repeaterCallsign, repeaterName: $repeaterName, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserReportCopyWith<$Res>
    implements $UserReportCopyWith<$Res> {
  factory _$UserReportCopyWith(
          _UserReport value, $Res Function(_UserReport) _then) =
      __$UserReportCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String repeaterId,
      String repeaterCallsign,
      String? repeaterName,
      String description,
      UserReportStatus status,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$UserReportCopyWithImpl<$Res> implements _$UserReportCopyWith<$Res> {
  __$UserReportCopyWithImpl(this._self, this._then);

  final _UserReport _self;
  final $Res Function(_UserReport) _then;

  /// Create a copy of UserReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? repeaterId = null,
    Object? repeaterCallsign = null,
    Object? repeaterName = freezed,
    Object? description = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_UserReport(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterCallsign: null == repeaterCallsign
          ? _self.repeaterCallsign
          : repeaterCallsign // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterName: freezed == repeaterName
          ? _self.repeaterName
          : repeaterName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserReportStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
