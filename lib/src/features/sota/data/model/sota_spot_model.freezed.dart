// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sota_spot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SotaSpotModel {
  int? get id;
  @JsonKey(name: 'AltM')
  int? get altM;
  @JsonKey(name: 'AltFt')
  int? get altFt;
  int? get points;
  String? get timeStamp;
  String? get activatorCallsign;
  String? get summitCode;
  String? get summitName;
  String? get mode;
  double? get frequency;
  String? get activatorName;
  String? get comments;
  String? get type;
  String? get callsign;
  int? get userID;
  String? get epoch;

  /// Create a copy of SotaSpotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SotaSpotModelCopyWith<SotaSpotModel> get copyWith =>
      _$SotaSpotModelCopyWithImpl<SotaSpotModel>(
          this as SotaSpotModel, _$identity);

  /// Serializes this SotaSpotModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SotaSpotModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.altM, altM) || other.altM == altM) &&
            (identical(other.altFt, altFt) || other.altFt == altFt) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.activatorCallsign, activatorCallsign) ||
                other.activatorCallsign == activatorCallsign) &&
            (identical(other.summitCode, summitCode) ||
                other.summitCode == summitCode) &&
            (identical(other.summitName, summitName) ||
                other.summitName == summitName) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.activatorName, activatorName) ||
                other.activatorName == activatorName) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.epoch, epoch) || other.epoch == epoch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      altM,
      altFt,
      points,
      timeStamp,
      activatorCallsign,
      summitCode,
      summitName,
      mode,
      frequency,
      activatorName,
      comments,
      type,
      callsign,
      userID,
      epoch);

  @override
  String toString() {
    return 'SotaSpotModel(id: $id, altM: $altM, altFt: $altFt, points: $points, timeStamp: $timeStamp, activatorCallsign: $activatorCallsign, summitCode: $summitCode, summitName: $summitName, mode: $mode, frequency: $frequency, activatorName: $activatorName, comments: $comments, type: $type, callsign: $callsign, userID: $userID, epoch: $epoch)';
  }
}

/// @nodoc
abstract mixin class $SotaSpotModelCopyWith<$Res> {
  factory $SotaSpotModelCopyWith(
          SotaSpotModel value, $Res Function(SotaSpotModel) _then) =
      _$SotaSpotModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'AltM') int? altM,
      @JsonKey(name: 'AltFt') int? altFt,
      int? points,
      String? timeStamp,
      String? activatorCallsign,
      String? summitCode,
      String? summitName,
      String? mode,
      double? frequency,
      String? activatorName,
      String? comments,
      String? type,
      String? callsign,
      int? userID,
      String? epoch});
}

/// @nodoc
class _$SotaSpotModelCopyWithImpl<$Res>
    implements $SotaSpotModelCopyWith<$Res> {
  _$SotaSpotModelCopyWithImpl(this._self, this._then);

  final SotaSpotModel _self;
  final $Res Function(SotaSpotModel) _then;

  /// Create a copy of SotaSpotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? altM = freezed,
    Object? altFt = freezed,
    Object? points = freezed,
    Object? timeStamp = freezed,
    Object? activatorCallsign = freezed,
    Object? summitCode = freezed,
    Object? summitName = freezed,
    Object? mode = freezed,
    Object? frequency = freezed,
    Object? activatorName = freezed,
    Object? comments = freezed,
    Object? type = freezed,
    Object? callsign = freezed,
    Object? userID = freezed,
    Object? epoch = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      altM: freezed == altM
          ? _self.altM
          : altM // ignore: cast_nullable_to_non_nullable
              as int?,
      altFt: freezed == altFt
          ? _self.altFt
          : altFt // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      timeStamp: freezed == timeStamp
          ? _self.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      activatorCallsign: freezed == activatorCallsign
          ? _self.activatorCallsign
          : activatorCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      summitCode: freezed == summitCode
          ? _self.summitCode
          : summitCode // ignore: cast_nullable_to_non_nullable
              as String?,
      summitName: freezed == summitName
          ? _self.summitName
          : summitName // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: freezed == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      activatorName: freezed == activatorName
          ? _self.activatorName
          : activatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _self.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int?,
      epoch: freezed == epoch
          ? _self.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SotaSpotModel].
extension SotaSpotModelPatterns on SotaSpotModel {
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
    TResult Function(_SotaSpotModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSpotModel() when $default != null:
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
    TResult Function(_SotaSpotModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotModel():
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
    TResult? Function(_SotaSpotModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotModel() when $default != null:
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
            int? id,
            @JsonKey(name: 'AltM') int? altM,
            @JsonKey(name: 'AltFt') int? altFt,
            int? points,
            String? timeStamp,
            String? activatorCallsign,
            String? summitCode,
            String? summitName,
            String? mode,
            double? frequency,
            String? activatorName,
            String? comments,
            String? type,
            String? callsign,
            int? userID,
            String? epoch)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSpotModel() when $default != null:
        return $default(
            _that.id,
            _that.altM,
            _that.altFt,
            _that.points,
            _that.timeStamp,
            _that.activatorCallsign,
            _that.summitCode,
            _that.summitName,
            _that.mode,
            _that.frequency,
            _that.activatorName,
            _that.comments,
            _that.type,
            _that.callsign,
            _that.userID,
            _that.epoch);
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
            int? id,
            @JsonKey(name: 'AltM') int? altM,
            @JsonKey(name: 'AltFt') int? altFt,
            int? points,
            String? timeStamp,
            String? activatorCallsign,
            String? summitCode,
            String? summitName,
            String? mode,
            double? frequency,
            String? activatorName,
            String? comments,
            String? type,
            String? callsign,
            int? userID,
            String? epoch)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotModel():
        return $default(
            _that.id,
            _that.altM,
            _that.altFt,
            _that.points,
            _that.timeStamp,
            _that.activatorCallsign,
            _that.summitCode,
            _that.summitName,
            _that.mode,
            _that.frequency,
            _that.activatorName,
            _that.comments,
            _that.type,
            _that.callsign,
            _that.userID,
            _that.epoch);
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
            int? id,
            @JsonKey(name: 'AltM') int? altM,
            @JsonKey(name: 'AltFt') int? altFt,
            int? points,
            String? timeStamp,
            String? activatorCallsign,
            String? summitCode,
            String? summitName,
            String? mode,
            double? frequency,
            String? activatorName,
            String? comments,
            String? type,
            String? callsign,
            int? userID,
            String? epoch)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotModel() when $default != null:
        return $default(
            _that.id,
            _that.altM,
            _that.altFt,
            _that.points,
            _that.timeStamp,
            _that.activatorCallsign,
            _that.summitCode,
            _that.summitName,
            _that.mode,
            _that.frequency,
            _that.activatorName,
            _that.comments,
            _that.type,
            _that.callsign,
            _that.userID,
            _that.epoch);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SotaSpotModel implements SotaSpotModel {
  const _SotaSpotModel(
      {this.id,
      @JsonKey(name: 'AltM') this.altM,
      @JsonKey(name: 'AltFt') this.altFt,
      this.points,
      this.timeStamp,
      this.activatorCallsign,
      this.summitCode,
      this.summitName,
      this.mode,
      this.frequency,
      this.activatorName,
      this.comments,
      this.type,
      this.callsign,
      this.userID,
      this.epoch});
  factory _SotaSpotModel.fromJson(Map<String, dynamic> json) =>
      _$SotaSpotModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'AltM')
  final int? altM;
  @override
  @JsonKey(name: 'AltFt')
  final int? altFt;
  @override
  final int? points;
  @override
  final String? timeStamp;
  @override
  final String? activatorCallsign;
  @override
  final String? summitCode;
  @override
  final String? summitName;
  @override
  final String? mode;
  @override
  final double? frequency;
  @override
  final String? activatorName;
  @override
  final String? comments;
  @override
  final String? type;
  @override
  final String? callsign;
  @override
  final int? userID;
  @override
  final String? epoch;

  /// Create a copy of SotaSpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SotaSpotModelCopyWith<_SotaSpotModel> get copyWith =>
      __$SotaSpotModelCopyWithImpl<_SotaSpotModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SotaSpotModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SotaSpotModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.altM, altM) || other.altM == altM) &&
            (identical(other.altFt, altFt) || other.altFt == altFt) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.activatorCallsign, activatorCallsign) ||
                other.activatorCallsign == activatorCallsign) &&
            (identical(other.summitCode, summitCode) ||
                other.summitCode == summitCode) &&
            (identical(other.summitName, summitName) ||
                other.summitName == summitName) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.activatorName, activatorName) ||
                other.activatorName == activatorName) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.epoch, epoch) || other.epoch == epoch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      altM,
      altFt,
      points,
      timeStamp,
      activatorCallsign,
      summitCode,
      summitName,
      mode,
      frequency,
      activatorName,
      comments,
      type,
      callsign,
      userID,
      epoch);

  @override
  String toString() {
    return 'SotaSpotModel(id: $id, altM: $altM, altFt: $altFt, points: $points, timeStamp: $timeStamp, activatorCallsign: $activatorCallsign, summitCode: $summitCode, summitName: $summitName, mode: $mode, frequency: $frequency, activatorName: $activatorName, comments: $comments, type: $type, callsign: $callsign, userID: $userID, epoch: $epoch)';
  }
}

/// @nodoc
abstract mixin class _$SotaSpotModelCopyWith<$Res>
    implements $SotaSpotModelCopyWith<$Res> {
  factory _$SotaSpotModelCopyWith(
          _SotaSpotModel value, $Res Function(_SotaSpotModel) _then) =
      __$SotaSpotModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'AltM') int? altM,
      @JsonKey(name: 'AltFt') int? altFt,
      int? points,
      String? timeStamp,
      String? activatorCallsign,
      String? summitCode,
      String? summitName,
      String? mode,
      double? frequency,
      String? activatorName,
      String? comments,
      String? type,
      String? callsign,
      int? userID,
      String? epoch});
}

/// @nodoc
class __$SotaSpotModelCopyWithImpl<$Res>
    implements _$SotaSpotModelCopyWith<$Res> {
  __$SotaSpotModelCopyWithImpl(this._self, this._then);

  final _SotaSpotModel _self;
  final $Res Function(_SotaSpotModel) _then;

  /// Create a copy of SotaSpotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? altM = freezed,
    Object? altFt = freezed,
    Object? points = freezed,
    Object? timeStamp = freezed,
    Object? activatorCallsign = freezed,
    Object? summitCode = freezed,
    Object? summitName = freezed,
    Object? mode = freezed,
    Object? frequency = freezed,
    Object? activatorName = freezed,
    Object? comments = freezed,
    Object? type = freezed,
    Object? callsign = freezed,
    Object? userID = freezed,
    Object? epoch = freezed,
  }) {
    return _then(_SotaSpotModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      altM: freezed == altM
          ? _self.altM
          : altM // ignore: cast_nullable_to_non_nullable
              as int?,
      altFt: freezed == altFt
          ? _self.altFt
          : altFt // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      timeStamp: freezed == timeStamp
          ? _self.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      activatorCallsign: freezed == activatorCallsign
          ? _self.activatorCallsign
          : activatorCallsign // ignore: cast_nullable_to_non_nullable
              as String?,
      summitCode: freezed == summitCode
          ? _self.summitCode
          : summitCode // ignore: cast_nullable_to_non_nullable
              as String?,
      summitName: freezed == summitName
          ? _self.summitName
          : summitName // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: freezed == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      activatorName: freezed == activatorName
          ? _self.activatorName
          : activatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      callsign: freezed == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _self.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int?,
      epoch: freezed == epoch
          ? _self.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
