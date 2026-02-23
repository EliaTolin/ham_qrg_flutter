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
  @JsonKey(name: 'repeater')
  RepeaterModel get repeater;
  @JsonKey(name: 'user_id')
  String get userId;
  String get type;
  String get station;
  double get lat;
  double get lon;
  String get comment;
  @JsonKey(name: 'repeater_access')
  RepeaterAccessModel get repeaterAccess;
  @JsonKey(name: 'created_at')
  String get createdAt;
  Map<String, dynamic>? get profile;

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
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.repeaterAccess, repeaterAccess) ||
                other.repeaterAccess == repeaterAccess) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.profile, profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeater,
      userId,
      type,
      station,
      lat,
      lon,
      comment,
      repeaterAccess,
      createdAt,
      const DeepCollectionEquality().hash(profile));

  @override
  String toString() {
    return 'RepeaterFeedbackModel(id: $id, repeater: $repeater, userId: $userId, type: $type, station: $station, lat: $lat, lon: $lon, comment: $comment, repeaterAccess: $repeaterAccess, createdAt: $createdAt, profile: $profile)';
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
      @JsonKey(name: 'repeater') RepeaterModel repeater,
      @JsonKey(name: 'user_id') String userId,
      String type,
      String station,
      double lat,
      double lon,
      String comment,
      @JsonKey(name: 'repeater_access') RepeaterAccessModel repeaterAccess,
      @JsonKey(name: 'created_at') String createdAt,
      Map<String, dynamic>? profile});

  $RepeaterModelCopyWith<$Res> get repeater;
  $RepeaterAccessModelCopyWith<$Res> get repeaterAccess;
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
    Object? repeater = null,
    Object? userId = null,
    Object? type = null,
    Object? station = null,
    Object? lat = null,
    Object? lon = null,
    Object? comment = null,
    Object? repeaterAccess = null,
    Object? createdAt = null,
    Object? profile = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as RepeaterModel,
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
      repeaterAccess: null == repeaterAccess
          ? _self.repeaterAccess
          : repeaterAccess // ignore: cast_nullable_to_non_nullable
              as RepeaterAccessModel,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of RepeaterFeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterModelCopyWith<$Res> get repeater {
    return $RepeaterModelCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterFeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterAccessModelCopyWith<$Res> get repeaterAccess {
    return $RepeaterAccessModelCopyWith<$Res>(_self.repeaterAccess, (value) {
      return _then(_self.copyWith(repeaterAccess: value));
    });
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
            @JsonKey(name: 'repeater') RepeaterModel repeater,
            @JsonKey(name: 'user_id') String userId,
            String type,
            String station,
            double lat,
            double lon,
            String comment,
            @JsonKey(name: 'repeater_access')
            RepeaterAccessModel repeaterAccess,
            @JsonKey(name: 'created_at') String createdAt,
            Map<String, dynamic>? profile)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackModel() when $default != null:
        return $default(
            _that.id,
            _that.repeater,
            _that.userId,
            _that.type,
            _that.station,
            _that.lat,
            _that.lon,
            _that.comment,
            _that.repeaterAccess,
            _that.createdAt,
            _that.profile);
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
            @JsonKey(name: 'repeater') RepeaterModel repeater,
            @JsonKey(name: 'user_id') String userId,
            String type,
            String station,
            double lat,
            double lon,
            String comment,
            @JsonKey(name: 'repeater_access')
            RepeaterAccessModel repeaterAccess,
            @JsonKey(name: 'created_at') String createdAt,
            Map<String, dynamic>? profile)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackModel():
        return $default(
            _that.id,
            _that.repeater,
            _that.userId,
            _that.type,
            _that.station,
            _that.lat,
            _that.lon,
            _that.comment,
            _that.repeaterAccess,
            _that.createdAt,
            _that.profile);
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
            @JsonKey(name: 'repeater') RepeaterModel repeater,
            @JsonKey(name: 'user_id') String userId,
            String type,
            String station,
            double lat,
            double lon,
            String comment,
            @JsonKey(name: 'repeater_access')
            RepeaterAccessModel repeaterAccess,
            @JsonKey(name: 'created_at') String createdAt,
            Map<String, dynamic>? profile)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackModel() when $default != null:
        return $default(
            _that.id,
            _that.repeater,
            _that.userId,
            _that.type,
            _that.station,
            _that.lat,
            _that.lon,
            _that.comment,
            _that.repeaterAccess,
            _that.createdAt,
            _that.profile);
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
      @JsonKey(name: 'repeater') required this.repeater,
      @JsonKey(name: 'user_id') required this.userId,
      required this.type,
      required this.station,
      required this.lat,
      required this.lon,
      required this.comment,
      @JsonKey(name: 'repeater_access') required this.repeaterAccess,
      @JsonKey(name: 'created_at') required this.createdAt,
      final Map<String, dynamic>? profile})
      : _profile = profile;
  factory _RepeaterFeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterFeedbackModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'repeater')
  final RepeaterModel repeater;
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
  @JsonKey(name: 'repeater_access')
  final RepeaterAccessModel repeaterAccess;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  final Map<String, dynamic>? _profile;
  @override
  Map<String, dynamic>? get profile {
    final value = _profile;
    if (value == null) return null;
    if (_profile is EqualUnmodifiableMapView) return _profile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.repeaterAccess, repeaterAccess) ||
                other.repeaterAccess == repeaterAccess) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._profile, _profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeater,
      userId,
      type,
      station,
      lat,
      lon,
      comment,
      repeaterAccess,
      createdAt,
      const DeepCollectionEquality().hash(_profile));

  @override
  String toString() {
    return 'RepeaterFeedbackModel(id: $id, repeater: $repeater, userId: $userId, type: $type, station: $station, lat: $lat, lon: $lon, comment: $comment, repeaterAccess: $repeaterAccess, createdAt: $createdAt, profile: $profile)';
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
      @JsonKey(name: 'repeater') RepeaterModel repeater,
      @JsonKey(name: 'user_id') String userId,
      String type,
      String station,
      double lat,
      double lon,
      String comment,
      @JsonKey(name: 'repeater_access') RepeaterAccessModel repeaterAccess,
      @JsonKey(name: 'created_at') String createdAt,
      Map<String, dynamic>? profile});

  @override
  $RepeaterModelCopyWith<$Res> get repeater;
  @override
  $RepeaterAccessModelCopyWith<$Res> get repeaterAccess;
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
    Object? repeater = null,
    Object? userId = null,
    Object? type = null,
    Object? station = null,
    Object? lat = null,
    Object? lon = null,
    Object? comment = null,
    Object? repeaterAccess = null,
    Object? createdAt = null,
    Object? profile = freezed,
  }) {
    return _then(_RepeaterFeedbackModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as RepeaterModel,
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
      repeaterAccess: null == repeaterAccess
          ? _self.repeaterAccess
          : repeaterAccess // ignore: cast_nullable_to_non_nullable
              as RepeaterAccessModel,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _self._profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of RepeaterFeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterModelCopyWith<$Res> get repeater {
    return $RepeaterModelCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterFeedbackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterAccessModelCopyWith<$Res> get repeaterAccess {
    return $RepeaterAccessModelCopyWith<$Res>(_self.repeaterAccess, (value) {
      return _then(_self.copyWith(repeaterAccess: value));
    });
  }
}

// dart format on
