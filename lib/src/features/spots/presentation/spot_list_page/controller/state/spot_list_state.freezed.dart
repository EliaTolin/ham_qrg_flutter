// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpotListState {
  List<RepeaterSpot> get spots;
  bool get hasLoadError;

  /// Create a copy of SpotListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpotListStateCopyWith<SpotListState> get copyWith =>
      _$SpotListStateCopyWithImpl<SpotListState>(
          this as SpotListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpotListState &&
            const DeepCollectionEquality().equals(other.spots, spots) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(spots), hasLoadError);

  @override
  String toString() {
    return 'SpotListState(spots: $spots, hasLoadError: $hasLoadError)';
  }
}

/// @nodoc
abstract mixin class $SpotListStateCopyWith<$Res> {
  factory $SpotListStateCopyWith(
          SpotListState value, $Res Function(SpotListState) _then) =
      _$SpotListStateCopyWithImpl;
  @useResult
  $Res call({List<RepeaterSpot> spots, bool hasLoadError});
}

/// @nodoc
class _$SpotListStateCopyWithImpl<$Res>
    implements $SpotListStateCopyWith<$Res> {
  _$SpotListStateCopyWithImpl(this._self, this._then);

  final SpotListState _self;
  final $Res Function(SpotListState) _then;

  /// Create a copy of SpotListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spots = null,
    Object? hasLoadError = null,
  }) {
    return _then(_self.copyWith(
      spots: null == spots
          ? _self.spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<RepeaterSpot>,
      hasLoadError: null == hasLoadError
          ? _self.hasLoadError
          : hasLoadError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SpotListState].
extension SpotListStatePatterns on SpotListState {
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
    TResult Function(_SpotListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotListState() when $default != null:
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
    TResult Function(_SpotListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotListState():
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
    TResult? Function(_SpotListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotListState() when $default != null:
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
    TResult Function(List<RepeaterSpot> spots, bool hasLoadError)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpotListState() when $default != null:
        return $default(_that.spots, _that.hasLoadError);
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
    TResult Function(List<RepeaterSpot> spots, bool hasLoadError) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotListState():
        return $default(_that.spots, _that.hasLoadError);
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
    TResult? Function(List<RepeaterSpot> spots, bool hasLoadError)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpotListState() when $default != null:
        return $default(_that.spots, _that.hasLoadError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SpotListState implements SpotListState {
  const _SpotListState(
      {final List<RepeaterSpot> spots = const [], this.hasLoadError = false})
      : _spots = spots;

  final List<RepeaterSpot> _spots;
  @override
  @JsonKey()
  List<RepeaterSpot> get spots {
    if (_spots is EqualUnmodifiableListView) return _spots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spots);
  }

  @override
  @JsonKey()
  final bool hasLoadError;

  /// Create a copy of SpotListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpotListStateCopyWith<_SpotListState> get copyWith =>
      __$SpotListStateCopyWithImpl<_SpotListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpotListState &&
            const DeepCollectionEquality().equals(other._spots, _spots) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_spots), hasLoadError);

  @override
  String toString() {
    return 'SpotListState(spots: $spots, hasLoadError: $hasLoadError)';
  }
}

/// @nodoc
abstract mixin class _$SpotListStateCopyWith<$Res>
    implements $SpotListStateCopyWith<$Res> {
  factory _$SpotListStateCopyWith(
          _SpotListState value, $Res Function(_SpotListState) _then) =
      __$SpotListStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<RepeaterSpot> spots, bool hasLoadError});
}

/// @nodoc
class __$SpotListStateCopyWithImpl<$Res>
    implements _$SpotListStateCopyWith<$Res> {
  __$SpotListStateCopyWithImpl(this._self, this._then);

  final _SpotListState _self;
  final $Res Function(_SpotListState) _then;

  /// Create a copy of SpotListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? spots = null,
    Object? hasLoadError = null,
  }) {
    return _then(_SpotListState(
      spots: null == spots
          ? _self._spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<RepeaterSpot>,
      hasLoadError: null == hasLoadError
          ? _self.hasLoadError
          : hasLoadError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
