// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_repeater.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CachedRepeater {
  Repeater get repeater;
  DateTime get cachedAt;

  /// Create a copy of CachedRepeater
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CachedRepeaterCopyWith<CachedRepeater> get copyWith =>
      _$CachedRepeaterCopyWithImpl<CachedRepeater>(
          this as CachedRepeater, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CachedRepeater &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repeater, cachedAt);

  @override
  String toString() {
    return 'CachedRepeater(repeater: $repeater, cachedAt: $cachedAt)';
  }
}

/// @nodoc
abstract mixin class $CachedRepeaterCopyWith<$Res> {
  factory $CachedRepeaterCopyWith(
          CachedRepeater value, $Res Function(CachedRepeater) _then) =
      _$CachedRepeaterCopyWithImpl;
  @useResult
  $Res call({Repeater repeater, DateTime cachedAt});

  $RepeaterCopyWith<$Res> get repeater;
}

/// @nodoc
class _$CachedRepeaterCopyWithImpl<$Res>
    implements $CachedRepeaterCopyWith<$Res> {
  _$CachedRepeaterCopyWithImpl(this._self, this._then);

  final CachedRepeater _self;
  final $Res Function(CachedRepeater) _then;

  /// Create a copy of CachedRepeater
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeater = null,
    Object? cachedAt = null,
  }) {
    return _then(_self.copyWith(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of CachedRepeater
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CachedRepeater].
extension CachedRepeaterPatterns on CachedRepeater {
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
    TResult Function(_CachedRepeater value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CachedRepeater() when $default != null:
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
    TResult Function(_CachedRepeater value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CachedRepeater():
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
    TResult? Function(_CachedRepeater value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CachedRepeater() when $default != null:
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
    TResult Function(Repeater repeater, DateTime cachedAt)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CachedRepeater() when $default != null:
        return $default(_that.repeater, _that.cachedAt);
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
    TResult Function(Repeater repeater, DateTime cachedAt) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CachedRepeater():
        return $default(_that.repeater, _that.cachedAt);
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
    TResult? Function(Repeater repeater, DateTime cachedAt)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CachedRepeater() when $default != null:
        return $default(_that.repeater, _that.cachedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CachedRepeater extends CachedRepeater {
  const _CachedRepeater({required this.repeater, required this.cachedAt})
      : super._();

  @override
  final Repeater repeater;
  @override
  final DateTime cachedAt;

  /// Create a copy of CachedRepeater
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CachedRepeaterCopyWith<_CachedRepeater> get copyWith =>
      __$CachedRepeaterCopyWithImpl<_CachedRepeater>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CachedRepeater &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repeater, cachedAt);

  @override
  String toString() {
    return 'CachedRepeater(repeater: $repeater, cachedAt: $cachedAt)';
  }
}

/// @nodoc
abstract mixin class _$CachedRepeaterCopyWith<$Res>
    implements $CachedRepeaterCopyWith<$Res> {
  factory _$CachedRepeaterCopyWith(
          _CachedRepeater value, $Res Function(_CachedRepeater) _then) =
      __$CachedRepeaterCopyWithImpl;
  @override
  @useResult
  $Res call({Repeater repeater, DateTime cachedAt});

  @override
  $RepeaterCopyWith<$Res> get repeater;
}

/// @nodoc
class __$CachedRepeaterCopyWithImpl<$Res>
    implements _$CachedRepeaterCopyWith<$Res> {
  __$CachedRepeaterCopyWithImpl(this._self, this._then);

  final _CachedRepeater _self;
  final $Res Function(_CachedRepeater) _then;

  /// Create a copy of CachedRepeater
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeater = null,
    Object? cachedAt = null,
  }) {
    return _then(_CachedRepeater(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      cachedAt: null == cachedAt
          ? _self.cachedAt
          : cachedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of CachedRepeater
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }
}

// dart format on
