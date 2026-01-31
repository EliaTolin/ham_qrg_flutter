// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_repeaters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteRepeatersState {
  List<Repeater> get repeaters;
  List<String> get ids;
  int get count;

  /// Create a copy of FavoriteRepeatersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteRepeatersStateCopyWith<FavoriteRepeatersState> get copyWith =>
      _$FavoriteRepeatersStateCopyWithImpl<FavoriteRepeatersState>(
          this as FavoriteRepeatersState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteRepeatersState &&
            const DeepCollectionEquality().equals(other.repeaters, repeaters) &&
            const DeepCollectionEquality().equals(other.ids, ids) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(repeaters),
      const DeepCollectionEquality().hash(ids),
      count);

  @override
  String toString() {
    return 'FavoriteRepeatersState(repeaters: $repeaters, ids: $ids, count: $count)';
  }
}

/// @nodoc
abstract mixin class $FavoriteRepeatersStateCopyWith<$Res> {
  factory $FavoriteRepeatersStateCopyWith(FavoriteRepeatersState value,
          $Res Function(FavoriteRepeatersState) _then) =
      _$FavoriteRepeatersStateCopyWithImpl;
  @useResult
  $Res call({List<Repeater> repeaters, List<String> ids, int count});
}

/// @nodoc
class _$FavoriteRepeatersStateCopyWithImpl<$Res>
    implements $FavoriteRepeatersStateCopyWith<$Res> {
  _$FavoriteRepeatersStateCopyWithImpl(this._self, this._then);

  final FavoriteRepeatersState _self;
  final $Res Function(FavoriteRepeatersState) _then;

  /// Create a copy of FavoriteRepeatersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeaters = null,
    Object? ids = null,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      repeaters: null == repeaters
          ? _self.repeaters
          : repeaters // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      ids: null == ids
          ? _self.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FavoriteRepeatersState].
extension FavoriteRepeatersStatePatterns on FavoriteRepeatersState {
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
    TResult Function(_FavoriteRepeatersState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoriteRepeatersState() when $default != null:
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
    TResult Function(_FavoriteRepeatersState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteRepeatersState():
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
    TResult? Function(_FavoriteRepeatersState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteRepeatersState() when $default != null:
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
    TResult Function(List<Repeater> repeaters, List<String> ids, int count)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoriteRepeatersState() when $default != null:
        return $default(_that.repeaters, _that.ids, _that.count);
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
    TResult Function(List<Repeater> repeaters, List<String> ids, int count)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteRepeatersState():
        return $default(_that.repeaters, _that.ids, _that.count);
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
    TResult? Function(List<Repeater> repeaters, List<String> ids, int count)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteRepeatersState() when $default != null:
        return $default(_that.repeaters, _that.ids, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FavoriteRepeatersState implements FavoriteRepeatersState {
  const _FavoriteRepeatersState(
      {final List<Repeater> repeaters = const [],
      final List<String> ids = const [],
      this.count = 0})
      : _repeaters = repeaters,
        _ids = ids;

  final List<Repeater> _repeaters;
  @override
  @JsonKey()
  List<Repeater> get repeaters {
    if (_repeaters is EqualUnmodifiableListView) return _repeaters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repeaters);
  }

  final List<String> _ids;
  @override
  @JsonKey()
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  @JsonKey()
  final int count;

  /// Create a copy of FavoriteRepeatersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoriteRepeatersStateCopyWith<_FavoriteRepeatersState> get copyWith =>
      __$FavoriteRepeatersStateCopyWithImpl<_FavoriteRepeatersState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteRepeatersState &&
            const DeepCollectionEquality()
                .equals(other._repeaters, _repeaters) &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_repeaters),
      const DeepCollectionEquality().hash(_ids),
      count);

  @override
  String toString() {
    return 'FavoriteRepeatersState(repeaters: $repeaters, ids: $ids, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$FavoriteRepeatersStateCopyWith<$Res>
    implements $FavoriteRepeatersStateCopyWith<$Res> {
  factory _$FavoriteRepeatersStateCopyWith(_FavoriteRepeatersState value,
          $Res Function(_FavoriteRepeatersState) _then) =
      __$FavoriteRepeatersStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Repeater> repeaters, List<String> ids, int count});
}

/// @nodoc
class __$FavoriteRepeatersStateCopyWithImpl<$Res>
    implements _$FavoriteRepeatersStateCopyWith<$Res> {
  __$FavoriteRepeatersStateCopyWithImpl(this._self, this._then);

  final _FavoriteRepeatersState _self;
  final $Res Function(_FavoriteRepeatersState) _then;

  /// Create a copy of FavoriteRepeatersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeaters = null,
    Object? ids = null,
    Object? count = null,
  }) {
    return _then(_FavoriteRepeatersState(
      repeaters: null == repeaters
          ? _self._repeaters
          : repeaters // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      ids: null == ids
          ? _self._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
