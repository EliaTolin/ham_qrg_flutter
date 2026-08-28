// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_refresh_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BulkRefreshProgress {
  int get total;
  int get done;
  List<String> get failedNames;
  bool get cancelled;

  /// Create a copy of BulkRefreshProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BulkRefreshProgressCopyWith<BulkRefreshProgress> get copyWith =>
      _$BulkRefreshProgressCopyWithImpl<BulkRefreshProgress>(
          this as BulkRefreshProgress, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BulkRefreshProgress &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.done, done) || other.done == done) &&
            const DeepCollectionEquality()
                .equals(other.failedNames, failedNames) &&
            (identical(other.cancelled, cancelled) ||
                other.cancelled == cancelled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total, done,
      const DeepCollectionEquality().hash(failedNames), cancelled);

  @override
  String toString() {
    return 'BulkRefreshProgress(total: $total, done: $done, failedNames: $failedNames, cancelled: $cancelled)';
  }
}

/// @nodoc
abstract mixin class $BulkRefreshProgressCopyWith<$Res> {
  factory $BulkRefreshProgressCopyWith(
          BulkRefreshProgress value, $Res Function(BulkRefreshProgress) _then) =
      _$BulkRefreshProgressCopyWithImpl;
  @useResult
  $Res call({int total, int done, List<String> failedNames, bool cancelled});
}

/// @nodoc
class _$BulkRefreshProgressCopyWithImpl<$Res>
    implements $BulkRefreshProgressCopyWith<$Res> {
  _$BulkRefreshProgressCopyWithImpl(this._self, this._then);

  final BulkRefreshProgress _self;
  final $Res Function(BulkRefreshProgress) _then;

  /// Create a copy of BulkRefreshProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? done = null,
    Object? failedNames = null,
    Object? cancelled = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      done: null == done
          ? _self.done
          : done // ignore: cast_nullable_to_non_nullable
              as int,
      failedNames: null == failedNames
          ? _self.failedNames
          : failedNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cancelled: null == cancelled
          ? _self.cancelled
          : cancelled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [BulkRefreshProgress].
extension BulkRefreshProgressPatterns on BulkRefreshProgress {
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
    TResult Function(_BulkRefreshProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BulkRefreshProgress() when $default != null:
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
    TResult Function(_BulkRefreshProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BulkRefreshProgress():
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
    TResult? Function(_BulkRefreshProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BulkRefreshProgress() when $default != null:
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
            int total, int done, List<String> failedNames, bool cancelled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BulkRefreshProgress() when $default != null:
        return $default(
            _that.total, _that.done, _that.failedNames, _that.cancelled);
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
            int total, int done, List<String> failedNames, bool cancelled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BulkRefreshProgress():
        return $default(
            _that.total, _that.done, _that.failedNames, _that.cancelled);
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
            int total, int done, List<String> failedNames, bool cancelled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BulkRefreshProgress() when $default != null:
        return $default(
            _that.total, _that.done, _that.failedNames, _that.cancelled);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BulkRefreshProgress extends BulkRefreshProgress {
  const _BulkRefreshProgress(
      {required this.total,
      this.done = 0,
      final List<String> failedNames = const <String>[],
      this.cancelled = false})
      : _failedNames = failedNames,
        super._();

  @override
  final int total;
  @override
  @JsonKey()
  final int done;
  final List<String> _failedNames;
  @override
  @JsonKey()
  List<String> get failedNames {
    if (_failedNames is EqualUnmodifiableListView) return _failedNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_failedNames);
  }

  @override
  @JsonKey()
  final bool cancelled;

  /// Create a copy of BulkRefreshProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BulkRefreshProgressCopyWith<_BulkRefreshProgress> get copyWith =>
      __$BulkRefreshProgressCopyWithImpl<_BulkRefreshProgress>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BulkRefreshProgress &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.done, done) || other.done == done) &&
            const DeepCollectionEquality()
                .equals(other._failedNames, _failedNames) &&
            (identical(other.cancelled, cancelled) ||
                other.cancelled == cancelled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total, done,
      const DeepCollectionEquality().hash(_failedNames), cancelled);

  @override
  String toString() {
    return 'BulkRefreshProgress(total: $total, done: $done, failedNames: $failedNames, cancelled: $cancelled)';
  }
}

/// @nodoc
abstract mixin class _$BulkRefreshProgressCopyWith<$Res>
    implements $BulkRefreshProgressCopyWith<$Res> {
  factory _$BulkRefreshProgressCopyWith(_BulkRefreshProgress value,
          $Res Function(_BulkRefreshProgress) _then) =
      __$BulkRefreshProgressCopyWithImpl;
  @override
  @useResult
  $Res call({int total, int done, List<String> failedNames, bool cancelled});
}

/// @nodoc
class __$BulkRefreshProgressCopyWithImpl<$Res>
    implements _$BulkRefreshProgressCopyWith<$Res> {
  __$BulkRefreshProgressCopyWithImpl(this._self, this._then);

  final _BulkRefreshProgress _self;
  final $Res Function(_BulkRefreshProgress) _then;

  /// Create a copy of BulkRefreshProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? done = null,
    Object? failedNames = null,
    Object? cancelled = null,
  }) {
    return _then(_BulkRefreshProgress(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      done: null == done
          ? _self.done
          : done // ignore: cast_nullable_to_non_nullable
              as int,
      failedNames: null == failedNames
          ? _self._failedNames
          : failedNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cancelled: null == cancelled
          ? _self.cancelled
          : cancelled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
