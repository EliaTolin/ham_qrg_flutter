// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bm_talkgroup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BmTalkgroupModel {
  String get talkgroup;
  String get slot;
  @JsonKey(name: 'repeaterid')
  String get repeaterId;

  /// Create a copy of BmTalkgroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BmTalkgroupModelCopyWith<BmTalkgroupModel> get copyWith =>
      _$BmTalkgroupModelCopyWithImpl<BmTalkgroupModel>(
          this as BmTalkgroupModel, _$identity);

  /// Serializes this BmTalkgroupModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BmTalkgroupModel &&
            (identical(other.talkgroup, talkgroup) ||
                other.talkgroup == talkgroup) &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, talkgroup, slot, repeaterId);

  @override
  String toString() {
    return 'BmTalkgroupModel(talkgroup: $talkgroup, slot: $slot, repeaterId: $repeaterId)';
  }
}

/// @nodoc
abstract mixin class $BmTalkgroupModelCopyWith<$Res> {
  factory $BmTalkgroupModelCopyWith(
          BmTalkgroupModel value, $Res Function(BmTalkgroupModel) _then) =
      _$BmTalkgroupModelCopyWithImpl;
  @useResult
  $Res call(
      {String talkgroup,
      String slot,
      @JsonKey(name: 'repeaterid') String repeaterId});
}

/// @nodoc
class _$BmTalkgroupModelCopyWithImpl<$Res>
    implements $BmTalkgroupModelCopyWith<$Res> {
  _$BmTalkgroupModelCopyWithImpl(this._self, this._then);

  final BmTalkgroupModel _self;
  final $Res Function(BmTalkgroupModel) _then;

  /// Create a copy of BmTalkgroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? talkgroup = null,
    Object? slot = null,
    Object? repeaterId = null,
  }) {
    return _then(_self.copyWith(
      talkgroup: null == talkgroup
          ? _self.talkgroup
          : talkgroup // ignore: cast_nullable_to_non_nullable
              as String,
      slot: null == slot
          ? _self.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BmTalkgroupModel].
extension BmTalkgroupModelPatterns on BmTalkgroupModel {
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
    TResult Function(_BmTalkgroupModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroupModel() when $default != null:
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
    TResult Function(_BmTalkgroupModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroupModel():
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
    TResult? Function(_BmTalkgroupModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroupModel() when $default != null:
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
    TResult Function(String talkgroup, String slot,
            @JsonKey(name: 'repeaterid') String repeaterId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroupModel() when $default != null:
        return $default(_that.talkgroup, _that.slot, _that.repeaterId);
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
    TResult Function(String talkgroup, String slot,
            @JsonKey(name: 'repeaterid') String repeaterId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroupModel():
        return $default(_that.talkgroup, _that.slot, _that.repeaterId);
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
    TResult? Function(String talkgroup, String slot,
            @JsonKey(name: 'repeaterid') String repeaterId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroupModel() when $default != null:
        return $default(_that.talkgroup, _that.slot, _that.repeaterId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BmTalkgroupModel implements BmTalkgroupModel {
  const _BmTalkgroupModel(
      {required this.talkgroup,
      required this.slot,
      @JsonKey(name: 'repeaterid') required this.repeaterId});
  factory _BmTalkgroupModel.fromJson(Map<String, dynamic> json) =>
      _$BmTalkgroupModelFromJson(json);

  @override
  final String talkgroup;
  @override
  final String slot;
  @override
  @JsonKey(name: 'repeaterid')
  final String repeaterId;

  /// Create a copy of BmTalkgroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BmTalkgroupModelCopyWith<_BmTalkgroupModel> get copyWith =>
      __$BmTalkgroupModelCopyWithImpl<_BmTalkgroupModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BmTalkgroupModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BmTalkgroupModel &&
            (identical(other.talkgroup, talkgroup) ||
                other.talkgroup == talkgroup) &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, talkgroup, slot, repeaterId);

  @override
  String toString() {
    return 'BmTalkgroupModel(talkgroup: $talkgroup, slot: $slot, repeaterId: $repeaterId)';
  }
}

/// @nodoc
abstract mixin class _$BmTalkgroupModelCopyWith<$Res>
    implements $BmTalkgroupModelCopyWith<$Res> {
  factory _$BmTalkgroupModelCopyWith(
          _BmTalkgroupModel value, $Res Function(_BmTalkgroupModel) _then) =
      __$BmTalkgroupModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String talkgroup,
      String slot,
      @JsonKey(name: 'repeaterid') String repeaterId});
}

/// @nodoc
class __$BmTalkgroupModelCopyWithImpl<$Res>
    implements _$BmTalkgroupModelCopyWith<$Res> {
  __$BmTalkgroupModelCopyWithImpl(this._self, this._then);

  final _BmTalkgroupModel _self;
  final $Res Function(_BmTalkgroupModel) _then;

  /// Create a copy of BmTalkgroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? talkgroup = null,
    Object? slot = null,
    Object? repeaterId = null,
  }) {
    return _then(_BmTalkgroupModel(
      talkgroup: null == talkgroup
          ? _self.talkgroup
          : talkgroup // ignore: cast_nullable_to_non_nullable
              as String,
      slot: null == slot
          ? _self.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
