// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeStatistics {
  int get totalRepeaters;
  int get favoritesCount;

  /// Create a copy of HomeStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStatisticsCopyWith<HomeStatistics> get copyWith =>
      _$HomeStatisticsCopyWithImpl<HomeStatistics>(
          this as HomeStatistics, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeStatistics &&
            (identical(other.totalRepeaters, totalRepeaters) ||
                other.totalRepeaters == totalRepeaters) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalRepeaters, favoritesCount);

  @override
  String toString() {
    return 'HomeStatistics(totalRepeaters: $totalRepeaters, favoritesCount: $favoritesCount)';
  }
}

/// @nodoc
abstract mixin class $HomeStatisticsCopyWith<$Res> {
  factory $HomeStatisticsCopyWith(
          HomeStatistics value, $Res Function(HomeStatistics) _then) =
      _$HomeStatisticsCopyWithImpl;
  @useResult
  $Res call({int totalRepeaters, int favoritesCount});
}

/// @nodoc
class _$HomeStatisticsCopyWithImpl<$Res>
    implements $HomeStatisticsCopyWith<$Res> {
  _$HomeStatisticsCopyWithImpl(this._self, this._then);

  final HomeStatistics _self;
  final $Res Function(HomeStatistics) _then;

  /// Create a copy of HomeStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRepeaters = null,
    Object? favoritesCount = null,
  }) {
    return _then(_self.copyWith(
      totalRepeaters: null == totalRepeaters
          ? _self.totalRepeaters
          : totalRepeaters // ignore: cast_nullable_to_non_nullable
              as int,
      favoritesCount: null == favoritesCount
          ? _self.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeStatistics].
extension HomeStatisticsPatterns on HomeStatistics {
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
    TResult Function(_HomeStatistics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeStatistics() when $default != null:
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
    TResult Function(_HomeStatistics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeStatistics():
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
    TResult? Function(_HomeStatistics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeStatistics() when $default != null:
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
    TResult Function(int totalRepeaters, int favoritesCount)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeStatistics() when $default != null:
        return $default(_that.totalRepeaters, _that.favoritesCount);
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
    TResult Function(int totalRepeaters, int favoritesCount) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeStatistics():
        return $default(_that.totalRepeaters, _that.favoritesCount);
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
    TResult? Function(int totalRepeaters, int favoritesCount)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeStatistics() when $default != null:
        return $default(_that.totalRepeaters, _that.favoritesCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeStatistics implements HomeStatistics {
  const _HomeStatistics(
      {required this.totalRepeaters, required this.favoritesCount});

  @override
  final int totalRepeaters;
  @override
  final int favoritesCount;

  /// Create a copy of HomeStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStatisticsCopyWith<_HomeStatistics> get copyWith =>
      __$HomeStatisticsCopyWithImpl<_HomeStatistics>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeStatistics &&
            (identical(other.totalRepeaters, totalRepeaters) ||
                other.totalRepeaters == totalRepeaters) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalRepeaters, favoritesCount);

  @override
  String toString() {
    return 'HomeStatistics(totalRepeaters: $totalRepeaters, favoritesCount: $favoritesCount)';
  }
}

/// @nodoc
abstract mixin class _$HomeStatisticsCopyWith<$Res>
    implements $HomeStatisticsCopyWith<$Res> {
  factory _$HomeStatisticsCopyWith(
          _HomeStatistics value, $Res Function(_HomeStatistics) _then) =
      __$HomeStatisticsCopyWithImpl;
  @override
  @useResult
  $Res call({int totalRepeaters, int favoritesCount});
}

/// @nodoc
class __$HomeStatisticsCopyWithImpl<$Res>
    implements _$HomeStatisticsCopyWith<$Res> {
  __$HomeStatisticsCopyWithImpl(this._self, this._then);

  final _HomeStatistics _self;
  final $Res Function(_HomeStatistics) _then;

  /// Create a copy of HomeStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalRepeaters = null,
    Object? favoritesCount = null,
  }) {
    return _then(_HomeStatistics(
      totalRepeaters: null == totalRepeaters
          ? _self.totalRepeaters
          : totalRepeaters // ignore: cast_nullable_to_non_nullable
              as int,
      favoritesCount: null == favoritesCount
          ? _self.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
