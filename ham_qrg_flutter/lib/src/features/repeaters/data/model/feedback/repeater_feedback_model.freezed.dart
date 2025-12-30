// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_feedback_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterFeedbackModel {
  String get id;
  @JsonKey(name: 'repeater_id')
  String get repeaterId;
  @JsonKey(name: 'user_id')
  String get userId;
  String get type;
  String get station;
  double get lat;
  double get lon;
  String get comment;
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of RepeaterFeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterFeedbackModelCopyWith<RepeaterFeedbackModel> get copyWith =>
      _$RepeaterFeedbackModelCopyWithImpl<RepeaterFeedbackModel>(
          this as RepeaterFeedbackModel, _$identity);

  /// Serializes this RepeaterFeedbackModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterFeedbackModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, repeaterId, userId, type,
      station, lat, lon, comment, createdAt);

  @override
  String toString() {
    return 'RepeaterFeedbackModel(id: $id, repeaterId: $repeaterId, userId: $userId, type: $type, station: $station, lat: $lat, lon: $lon, comment: $comment, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $RepeaterFeedbackModelCopyWith<$Res> {
  factory $RepeaterFeedbackModelCopyWith(RepeaterFeedbackModel value,
          $Res Function(RepeaterFeedbackModel) _then) =
      _$RepeaterFeedbackModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'repeater_id') String repeaterId,
      @JsonKey(name: 'user_id') String userId,
      String type,
      String station,
      double lat,
      double lon,
      String comment,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$RepeaterFeedbackModelCopyWithImpl<$Res>
    implements $RepeaterFeedbackModelCopyWith<$Res> {
  _$RepeaterFeedbackModelCopyWithImpl(this._self, this._then);

  final RepeaterFeedbackModel _self;
  final $Res Function(RepeaterFeedbackModel) _then;

  /// Create a copy of RepeaterFeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repeaterId = null,
    Object? userId = null,
    Object? type = null,
    Object? station = null,
    Object? lat = null,
    Object? lon = null,
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
              as String,
      station: null == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [RepeaterFeedbackModel].
extension RepeaterFeedbackModelPatterns on RepeaterFeedbackModel {
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
    TResult Function(_RepeaterFeedbackModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackModel() when $default != null:
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
    TResult Function(_RepeaterFeedbackModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackModel():
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
    TResult? Function(_RepeaterFeedbackModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackModel() when $default != null:
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
            @JsonKey(name: 'user_id') String userId,
            String type,
            String station,
            double lat,
            double lon,
            String comment,
            @JsonKey(name: 'created_at') String createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackModel() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.userId,
            _that.type,
            _that.station,
            _that.lat,
            _that.lon,
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
            @JsonKey(name: 'repeater_id') String repeaterId,
            @JsonKey(name: 'user_id') String userId,
            String type,
            String station,
            double lat,
            double lon,
            String comment,
            @JsonKey(name: 'created_at') String createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackModel():
        return $default(
            _that.id,
            _that.repeaterId,
            _that.userId,
            _that.type,
            _that.station,
            _that.lat,
            _that.lon,
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
            @JsonKey(name: 'repeater_id') String repeaterId,
            @JsonKey(name: 'user_id') String userId,
            String type,
            String station,
            double lat,
            double lon,
            String comment,
            @JsonKey(name: 'created_at') String createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackModel() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.userId,
            _that.type,
            _that.station,
            _that.lat,
            _that.lon,
            _that.comment,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RepeaterFeedbackModel implements RepeaterFeedbackModel {
  const _RepeaterFeedbackModel(
      {required this.id,
      @JsonKey(name: 'repeater_id') required this.repeaterId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.type,
      required this.station,
      required this.lat,
      required this.lon,
      required this.comment,
      @JsonKey(name: 'created_at') required this.createdAt});
  factory _RepeaterFeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterFeedbackModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'repeater_id')
  final String repeaterId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String type;
  @override
  final String station;
  @override
  final double lat;
  @override
  final double lon;
  @override
  final String comment;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  /// Create a copy of RepeaterFeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterFeedbackModelCopyWith<_RepeaterFeedbackModel> get copyWith =>
      __$RepeaterFeedbackModelCopyWithImpl<_RepeaterFeedbackModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RepeaterFeedbackModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterFeedbackModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, repeaterId, userId, type,
      station, lat, lon, comment, createdAt);

  @override
  String toString() {
    return 'RepeaterFeedbackModel(id: $id, repeaterId: $repeaterId, userId: $userId, type: $type, station: $station, lat: $lat, lon: $lon, comment: $comment, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterFeedbackModelCopyWith<$Res>
    implements $RepeaterFeedbackModelCopyWith<$Res> {
  factory _$RepeaterFeedbackModelCopyWith(_RepeaterFeedbackModel value,
          $Res Function(_RepeaterFeedbackModel) _then) =
      __$RepeaterFeedbackModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'repeater_id') String repeaterId,
      @JsonKey(name: 'user_id') String userId,
      String type,
      String station,
      double lat,
      double lon,
      String comment,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$RepeaterFeedbackModelCopyWithImpl<$Res>
    implements _$RepeaterFeedbackModelCopyWith<$Res> {
  __$RepeaterFeedbackModelCopyWithImpl(this._self, this._then);

  final _RepeaterFeedbackModel _self;
  final $Res Function(_RepeaterFeedbackModel) _then;

  /// Create a copy of RepeaterFeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? repeaterId = null,
    Object? userId = null,
    Object? type = null,
    Object? station = null,
    Object? lat = null,
    Object? lon = null,
    Object? comment = null,
    Object? createdAt = null,
  }) {
    return _then(_RepeaterFeedbackModel(
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
              as String,
      station: null == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
