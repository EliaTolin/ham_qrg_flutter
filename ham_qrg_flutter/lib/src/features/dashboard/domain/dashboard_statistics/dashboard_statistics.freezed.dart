// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardStatistics {
  int get totalRepeaters;
  int? get favoritesCount;

  /// Create a copy of DashboardStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardStatisticsCopyWith<DashboardStatistics> get copyWith =>
      _$DashboardStatisticsCopyWithImpl<DashboardStatistics>(
          this as DashboardStatistics, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardStatistics &&
            (identical(other.totalRepeaters, totalRepeaters) ||
                other.totalRepeaters == totalRepeaters) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalRepeaters, favoritesCount);

  @override
  String toString() {
    return 'DashboardStatistics(totalRepeaters: $totalRepeaters, favoritesCount: $favoritesCount)';
  }
}

/// @nodoc
abstract mixin class $DashboardStatisticsCopyWith<$Res> {
  factory $DashboardStatisticsCopyWith(
          DashboardStatistics value, $Res Function(DashboardStatistics) _then) =
      _$DashboardStatisticsCopyWithImpl;
  @useResult
  $Res call({int totalRepeaters, int? favoritesCount});
}

/// @nodoc
class _$DashboardStatisticsCopyWithImpl<$Res>
    implements $DashboardStatisticsCopyWith<$Res> {
  _$DashboardStatisticsCopyWithImpl(this._self, this._then);

  final DashboardStatistics _self;
  final $Res Function(DashboardStatistics) _then;

  /// Create a copy of DashboardStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRepeaters = null,
    Object? favoritesCount = freezed,
  }) {
    return _then(_self.copyWith(
      totalRepeaters: null == totalRepeaters
          ? _self.totalRepeaters
          : totalRepeaters // ignore: cast_nullable_to_non_nullable
              as int,
      favoritesCount: freezed == favoritesCount
          ? _self.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardStatistics].
extension DashboardStatisticsPatterns on DashboardStatistics {
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
    TResult Function(_DashboardStatistics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStatistics() when $default != null:
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
    TResult Function(_DashboardStatistics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardStatistics():
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
    TResult? Function(_DashboardStatistics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardStatistics() when $default != null:
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
    TResult Function(int totalRepeaters, int? favoritesCount)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardStatistics() when $default != null:
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
    TResult Function(int totalRepeaters, int? favoritesCount) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardStatistics():
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
    TResult? Function(int totalRepeaters, int? favoritesCount)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardStatistics() when $default != null:
        return $default(_that.totalRepeaters, _that.favoritesCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DashboardStatistics implements DashboardStatistics {
  const _DashboardStatistics(
      {required this.totalRepeaters, required this.favoritesCount});

  @override
  final int totalRepeaters;
  @override
  final int? favoritesCount;

  /// Create a copy of DashboardStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardStatisticsCopyWith<_DashboardStatistics> get copyWith =>
      __$DashboardStatisticsCopyWithImpl<_DashboardStatistics>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardStatistics &&
            (identical(other.totalRepeaters, totalRepeaters) ||
                other.totalRepeaters == totalRepeaters) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalRepeaters, favoritesCount);

  @override
  String toString() {
    return 'DashboardStatistics(totalRepeaters: $totalRepeaters, favoritesCount: $favoritesCount)';
  }
}

/// @nodoc
abstract mixin class _$DashboardStatisticsCopyWith<$Res>
    implements $DashboardStatisticsCopyWith<$Res> {
  factory _$DashboardStatisticsCopyWith(_DashboardStatistics value,
          $Res Function(_DashboardStatistics) _then) =
      __$DashboardStatisticsCopyWithImpl;
  @override
  @useResult
  $Res call({int totalRepeaters, int? favoritesCount});
}

/// @nodoc
class __$DashboardStatisticsCopyWithImpl<$Res>
    implements _$DashboardStatisticsCopyWith<$Res> {
  __$DashboardStatisticsCopyWithImpl(this._self, this._then);

  final _DashboardStatistics _self;
  final $Res Function(_DashboardStatistics) _then;

  /// Create a copy of DashboardStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalRepeaters = null,
    Object? favoritesCount = freezed,
  }) {
    return _then(_DashboardStatistics(
      totalRepeaters: null == totalRepeaters
          ? _self.totalRepeaters
          : totalRepeaters // ignore: cast_nullable_to_non_nullable
              as int,
      favoritesCount: freezed == favoritesCount
          ? _self.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
