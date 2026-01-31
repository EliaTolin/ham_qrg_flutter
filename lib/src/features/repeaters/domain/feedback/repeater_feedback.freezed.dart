// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterFeedback {
  String get id;
  Repeater get repeater;
  String get userId;
  FeedbackType get type;
  StationKind get station;
  double get latitude;
  double get longitude;
  String get comment;
  RepeaterAccess get repeaterAccess;
  DateTime get createdAt;
  String? get userCallsign;
  String? get userDisplayName;
  String? get userAvatarUrl;

  /// Create a copy of RepeaterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterFeedbackCopyWith<RepeaterFeedback> get copyWith =>
      _$RepeaterFeedbackCopyWithImpl<RepeaterFeedback>(
          this as RepeaterFeedback, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterFeedback &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.repeaterAccess, repeaterAccess) ||
                other.repeaterAccess == repeaterAccess) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userCallsign, userCallsign) ||
                other.userCallsign == userCallsign) &&
            (identical(other.userDisplayName, userDisplayName) ||
                other.userDisplayName == userDisplayName) &&
            (identical(other.userAvatarUrl, userAvatarUrl) ||
                other.userAvatarUrl == userAvatarUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeater,
      userId,
      type,
      station,
      latitude,
      longitude,
      comment,
      repeaterAccess,
      createdAt,
      userCallsign,
      userDisplayName,
      userAvatarUrl);

  @override
  String toString() {
    return 'RepeaterFeedback(id: $id, repeater: $repeater, userId: $userId, type: $type, station: $station, latitude: $latitude, longitude: $longitude, comment: $comment, repeaterAccess: $repeaterAccess, createdAt: $createdAt, userCallsign: $userCallsign, userDisplayName: $userDisplayName, userAvatarUrl: $userAvatarUrl)';
  }
}

/// @nodoc
abstract mixin class $RepeaterFeedbackCopyWith<$Res> {
  factory $RepeaterFeedbackCopyWith(
          RepeaterFeedback value, $Res Function(RepeaterFeedback) _then) =
      _$RepeaterFeedbackCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      Repeater repeater,
      String userId,
      FeedbackType type,
      StationKind station,
      double latitude,
      double longitude,
      String comment,
      RepeaterAccess repeaterAccess,
      DateTime createdAt,
      String? userCallsign,
      String? userDisplayName,
      String? userAvatarUrl});

  $RepeaterCopyWith<$Res> get repeater;
  $RepeaterAccessCopyWith<$Res> get repeaterAccess;
}

/// @nodoc
class _$RepeaterFeedbackCopyWithImpl<$Res>
    implements $RepeaterFeedbackCopyWith<$Res> {
  _$RepeaterFeedbackCopyWithImpl(this._self, this._then);

  final RepeaterFeedback _self;
  final $Res Function(RepeaterFeedback) _then;

  /// Create a copy of RepeaterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repeater = null,
    Object? userId = null,
    Object? type = null,
    Object? station = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? comment = null,
    Object? repeaterAccess = null,
    Object? createdAt = null,
    Object? userCallsign = freezed,
    Object? userDisplayName = freezed,
    Object? userAvatarUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      station: null == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as StationKind,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterAccess: null == repeaterAccess
          ? _self.repeaterAccess
          : repeaterAccess // ignore: cast_nullable_to_non_nullable
              as RepeaterAccess,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userCallsign: freezed == userCallsign
          ? _self.userCallsign
          : userCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      userDisplayName: freezed == userDisplayName
          ? _self.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      userAvatarUrl: freezed == userAvatarUrl
          ? _self.userAvatarUrl
          : userAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RepeaterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterAccessCopyWith<$Res> get repeaterAccess {
    return $RepeaterAccessCopyWith<$Res>(_self.repeaterAccess, (value) {
      return _then(_self.copyWith(repeaterAccess: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RepeaterFeedback].
extension RepeaterFeedbackPatterns on RepeaterFeedback {
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
    TResult Function(_RepeaterFeedback value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedback() when $default != null:
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
    TResult Function(_RepeaterFeedback value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedback():
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
    TResult? Function(_RepeaterFeedback value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedback() when $default != null:
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
            Repeater repeater,
            String userId,
            FeedbackType type,
            StationKind station,
            double latitude,
            double longitude,
            String comment,
            RepeaterAccess repeaterAccess,
            DateTime createdAt,
            String? userCallsign,
            String? userDisplayName,
            String? userAvatarUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedback() when $default != null:
        return $default(
            _that.id,
            _that.repeater,
            _that.userId,
            _that.type,
            _that.station,
            _that.latitude,
            _that.longitude,
            _that.comment,
            _that.repeaterAccess,
            _that.createdAt,
            _that.userCallsign,
            _that.userDisplayName,
            _that.userAvatarUrl);
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
            Repeater repeater,
            String userId,
            FeedbackType type,
            StationKind station,
            double latitude,
            double longitude,
            String comment,
            RepeaterAccess repeaterAccess,
            DateTime createdAt,
            String? userCallsign,
            String? userDisplayName,
            String? userAvatarUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedback():
        return $default(
            _that.id,
            _that.repeater,
            _that.userId,
            _that.type,
            _that.station,
            _that.latitude,
            _that.longitude,
            _that.comment,
            _that.repeaterAccess,
            _that.createdAt,
            _that.userCallsign,
            _that.userDisplayName,
            _that.userAvatarUrl);
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
            Repeater repeater,
            String userId,
            FeedbackType type,
            StationKind station,
            double latitude,
            double longitude,
            String comment,
            RepeaterAccess repeaterAccess,
            DateTime createdAt,
            String? userCallsign,
            String? userDisplayName,
            String? userAvatarUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedback() when $default != null:
        return $default(
            _that.id,
            _that.repeater,
            _that.userId,
            _that.type,
            _that.station,
            _that.latitude,
            _that.longitude,
            _that.comment,
            _that.repeaterAccess,
            _that.createdAt,
            _that.userCallsign,
            _that.userDisplayName,
            _that.userAvatarUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeaterFeedback implements RepeaterFeedback {
  const _RepeaterFeedback(
      {required this.id,
      required this.repeater,
      required this.userId,
      required this.type,
      required this.station,
      required this.latitude,
      required this.longitude,
      required this.comment,
      required this.repeaterAccess,
      required this.createdAt,
      this.userCallsign,
      this.userDisplayName,
      this.userAvatarUrl});

  @override
  final String id;
  @override
  final Repeater repeater;
  @override
  final String userId;
  @override
  final FeedbackType type;
  @override
  final StationKind station;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String comment;
  @override
  final RepeaterAccess repeaterAccess;
  @override
  final DateTime createdAt;
  @override
  final String? userCallsign;
  @override
  final String? userDisplayName;
  @override
  final String? userAvatarUrl;

  /// Create a copy of RepeaterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterFeedbackCopyWith<_RepeaterFeedback> get copyWith =>
      __$RepeaterFeedbackCopyWithImpl<_RepeaterFeedback>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterFeedback &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.repeaterAccess, repeaterAccess) ||
                other.repeaterAccess == repeaterAccess) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userCallsign, userCallsign) ||
                other.userCallsign == userCallsign) &&
            (identical(other.userDisplayName, userDisplayName) ||
                other.userDisplayName == userDisplayName) &&
            (identical(other.userAvatarUrl, userAvatarUrl) ||
                other.userAvatarUrl == userAvatarUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeater,
      userId,
      type,
      station,
      latitude,
      longitude,
      comment,
      repeaterAccess,
      createdAt,
      userCallsign,
      userDisplayName,
      userAvatarUrl);

  @override
  String toString() {
    return 'RepeaterFeedback(id: $id, repeater: $repeater, userId: $userId, type: $type, station: $station, latitude: $latitude, longitude: $longitude, comment: $comment, repeaterAccess: $repeaterAccess, createdAt: $createdAt, userCallsign: $userCallsign, userDisplayName: $userDisplayName, userAvatarUrl: $userAvatarUrl)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterFeedbackCopyWith<$Res>
    implements $RepeaterFeedbackCopyWith<$Res> {
  factory _$RepeaterFeedbackCopyWith(
          _RepeaterFeedback value, $Res Function(_RepeaterFeedback) _then) =
      __$RepeaterFeedbackCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      Repeater repeater,
      String userId,
      FeedbackType type,
      StationKind station,
      double latitude,
      double longitude,
      String comment,
      RepeaterAccess repeaterAccess,
      DateTime createdAt,
      String? userCallsign,
      String? userDisplayName,
      String? userAvatarUrl});

  @override
  $RepeaterCopyWith<$Res> get repeater;
  @override
  $RepeaterAccessCopyWith<$Res> get repeaterAccess;
}

/// @nodoc
class __$RepeaterFeedbackCopyWithImpl<$Res>
    implements _$RepeaterFeedbackCopyWith<$Res> {
  __$RepeaterFeedbackCopyWithImpl(this._self, this._then);

  final _RepeaterFeedback _self;
  final $Res Function(_RepeaterFeedback) _then;

  /// Create a copy of RepeaterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? repeater = null,
    Object? userId = null,
    Object? type = null,
    Object? station = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? comment = null,
    Object? repeaterAccess = null,
    Object? createdAt = null,
    Object? userCallsign = freezed,
    Object? userDisplayName = freezed,
    Object? userAvatarUrl = freezed,
  }) {
    return _then(_RepeaterFeedback(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      station: null == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as StationKind,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterAccess: null == repeaterAccess
          ? _self.repeaterAccess
          : repeaterAccess // ignore: cast_nullable_to_non_nullable
              as RepeaterAccess,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userCallsign: freezed == userCallsign
          ? _self.userCallsign
          : userCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      userDisplayName: freezed == userDisplayName
          ? _self.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      userAvatarUrl: freezed == userAvatarUrl
          ? _self.userAvatarUrl
          : userAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RepeaterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterAccessCopyWith<$Res> get repeaterAccess {
    return $RepeaterAccessCopyWith<$Res>(_self.repeaterAccess, (value) {
      return _then(_self.copyWith(repeaterAccess: value));
    });
  }
}

// dart format on
