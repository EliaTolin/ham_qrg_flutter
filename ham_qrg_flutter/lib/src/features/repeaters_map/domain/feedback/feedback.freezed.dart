// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Feedback {
  String get id;
  String get repeaterId;
  String get userId;
  FeedbackType get type;
  StationKind get station;
  double get latitude;
  double get longitude;
  String get comment;
  DateTime get createdAt;

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedbackCopyWith<Feedback> get copyWith =>
      _$FeedbackCopyWithImpl<Feedback>(this as Feedback, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Feedback &&
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
    return 'Feedback(id: $id, repeaterId: $repeaterId, userId: $userId, type: $type, station: $station, latitude: $latitude, longitude: $longitude, comment: $comment, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $FeedbackCopyWith<$Res> {
  factory $FeedbackCopyWith(Feedback value, $Res Function(Feedback) _then) =
      _$FeedbackCopyWithImpl;
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
class _$FeedbackCopyWithImpl<$Res> implements $FeedbackCopyWith<$Res> {
  _$FeedbackCopyWithImpl(this._self, this._then);

  final Feedback _self;
  final $Res Function(Feedback) _then;

  /// Create a copy of Feedback
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

/// Adds pattern-matching-related methods to [Feedback].
extension FeedbackPatterns on Feedback {
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
    TResult Function(_Feedback value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Feedback() when $default != null:
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
    TResult Function(_Feedback value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Feedback():
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
    TResult? Function(_Feedback value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Feedback() when $default != null:
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
      case _Feedback() when $default != null:
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
      case _Feedback():
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
      case _Feedback() when $default != null:
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

class _Feedback implements Feedback {
  const _Feedback(
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

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeedbackCopyWith<_Feedback> get copyWith =>
      __$FeedbackCopyWithImpl<_Feedback>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Feedback &&
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
    return 'Feedback(id: $id, repeaterId: $repeaterId, userId: $userId, type: $type, station: $station, latitude: $latitude, longitude: $longitude, comment: $comment, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$FeedbackCopyWith<$Res>
    implements $FeedbackCopyWith<$Res> {
  factory _$FeedbackCopyWith(_Feedback value, $Res Function(_Feedback) _then) =
      __$FeedbackCopyWithImpl;
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
class __$FeedbackCopyWithImpl<$Res> implements _$FeedbackCopyWith<$Res> {
  __$FeedbackCopyWithImpl(this._self, this._then);

  final _Feedback _self;
  final $Res Function(_Feedback) _then;

  /// Create a copy of Feedback
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
    return _then(_Feedback(
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

