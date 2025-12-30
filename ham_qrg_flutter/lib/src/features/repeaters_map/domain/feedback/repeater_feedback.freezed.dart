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
  String get repeaterId;
  String get userId;
  FeedbackType get type;
  StationKind get station;
  double get latitude;
  double get longitude;
  String get comment;
  DateTime get createdAt;

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
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, repeaterId, userId, type,
      station, latitude, longitude, comment, createdAt);

  @override
  String toString() {
    return 'RepeaterFeedback(id: $id, repeaterId: $repeaterId, userId: $userId, type: $type, station: $station, latitude: $latitude, longitude: $longitude, comment: $comment, createdAt: $createdAt)';
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
      String repeaterId,
      String userId,
      FeedbackType type,
      StationKind station,
      double latitude,
      double longitude,
      String comment,
      DateTime createdAt});
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
    Object? repeaterId = null,
    Object? userId = null,
    Object? type = null,
    Object? station = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? comment = null,
    Object? createdAt = null,
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
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
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
            String repeaterId,
            String userId,
            FeedbackType type,
            StationKind station,
            double latitude,
            double longitude,
            String comment,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedback() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.userId,
            _that.type,
            _that.station,
            _that.latitude,
            _that.longitude,
            _that.comment,
            _that.createdAt);
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
            String userId,
            FeedbackType type,
            StationKind station,
            double latitude,
            double longitude,
            String comment,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedback():
        return $default(
            _that.id,
            _that.repeaterId,
            _that.userId,
            _that.type,
            _that.station,
            _that.latitude,
            _that.longitude,
            _that.comment,
            _that.createdAt);
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
            String userId,
            FeedbackType type,
            StationKind station,
            double latitude,
            double longitude,
            String comment,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedback() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.userId,
            _that.type,
            _that.station,
            _that.latitude,
            _that.longitude,
            _that.comment,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeaterFeedback implements RepeaterFeedback {
  const _RepeaterFeedback(
      {required this.id,
      required this.repeaterId,
      required this.userId,
      required this.type,
      required this.station,
      required this.latitude,
      required this.longitude,
      required this.comment,
      required this.createdAt});

  @override
  final String id;
  @override
  final String repeaterId;
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
  final DateTime createdAt;

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
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, repeaterId, userId, type,
      station, latitude, longitude, comment, createdAt);

  @override
  String toString() {
    return 'RepeaterFeedback(id: $id, repeaterId: $repeaterId, userId: $userId, type: $type, station: $station, latitude: $latitude, longitude: $longitude, comment: $comment, createdAt: $createdAt)';
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
      String repeaterId,
      String userId,
      FeedbackType type,
      StationKind station,
      double latitude,
      double longitude,
      String comment,
      DateTime createdAt});
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
    Object? repeaterId = null,
    Object? userId = null,
    Object? type = null,
    Object? station = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? comment = null,
    Object? createdAt = null,
  }) {
    return _then(_RepeaterFeedback(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
