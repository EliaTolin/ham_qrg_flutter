// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Param {
  String get id;
  DateTime get createdAt;
  String get key;
  String get value;

  /// Create a copy of Param
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParamCopyWith<Param> get copyWith =>
      _$ParamCopyWithImpl<Param>(this as Param, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Param &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, key, value);

  @override
  String toString() {
    return 'Param(id: $id, createdAt: $createdAt, key: $key, value: $value)';
  }
}

/// @nodoc
abstract mixin class $ParamCopyWith<$Res> {
  factory $ParamCopyWith(Param value, $Res Function(Param) _then) =
      _$ParamCopyWithImpl;
  @useResult
  $Res call({String id, DateTime createdAt, String key, String value});
}

/// @nodoc
class _$ParamCopyWithImpl<$Res> implements $ParamCopyWith<$Res> {
  _$ParamCopyWithImpl(this._self, this._then);

  final Param _self;
  final $Res Function(Param) _then;

  /// Create a copy of Param
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Param].
extension ParamPatterns on Param {
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
    TResult Function(_Param value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Param() when $default != null:
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
    TResult Function(_Param value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Param():
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
    TResult? Function(_Param value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Param() when $default != null:
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
    TResult Function(String id, DateTime createdAt, String key, String value)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Param() when $default != null:
        return $default(_that.id, _that.createdAt, _that.key, _that.value);
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
    TResult Function(String id, DateTime createdAt, String key, String value)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Param():
        return $default(_that.id, _that.createdAt, _that.key, _that.value);
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
    TResult? Function(String id, DateTime createdAt, String key, String value)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Param() when $default != null:
        return $default(_that.id, _that.createdAt, _that.key, _that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Param implements Param {
  const _Param(
      {required this.id,
      required this.createdAt,
      required this.key,
      required this.value});

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final String key;
  @override
  final String value;

  /// Create a copy of Param
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ParamCopyWith<_Param> get copyWith =>
      __$ParamCopyWithImpl<_Param>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Param &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, key, value);

  @override
  String toString() {
    return 'Param(id: $id, createdAt: $createdAt, key: $key, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$ParamCopyWith<$Res> implements $ParamCopyWith<$Res> {
  factory _$ParamCopyWith(_Param value, $Res Function(_Param) _then) =
      __$ParamCopyWithImpl;
  @override
  @useResult
  $Res call({String id, DateTime createdAt, String key, String value});
}

/// @nodoc
class __$ParamCopyWithImpl<$Res> implements _$ParamCopyWith<$Res> {
  __$ParamCopyWithImpl(this._self, this._then);

  final _Param _self;
  final $Res Function(_Param) _then;

  /// Create a copy of Param
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_Param(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
