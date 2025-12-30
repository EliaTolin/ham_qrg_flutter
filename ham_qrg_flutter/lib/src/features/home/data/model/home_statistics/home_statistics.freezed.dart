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
mixin _$HomeStatisticsModel {
  @JsonKey(name: 'total_repeaters')
  int get totalRepeaters;
  @JsonKey(name: 'favorites_count')
  int get favoritesCount;

  /// Create a copy of HomeStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStatisticsModelCopyWith<HomeStatisticsModel> get copyWith =>
      _$HomeStatisticsModelCopyWithImpl<HomeStatisticsModel>(
          this as HomeStatisticsModel, _$identity);

  /// Serializes this HomeStatisticsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeStatisticsModel &&
            (identical(other.totalRepeaters, totalRepeaters) ||
                other.totalRepeaters == totalRepeaters) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalRepeaters, favoritesCount);

  @override
  String toString() {
    return 'HomeStatisticsModel(totalRepeaters: $totalRepeaters, favoritesCount: $favoritesCount)';
  }
}

/// @nodoc
abstract mixin class $HomeStatisticsModelCopyWith<$Res> {
  factory $HomeStatisticsModelCopyWith(
          HomeStatisticsModel value, $Res Function(HomeStatisticsModel) _then) =
      _$HomeStatisticsModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_repeaters') int totalRepeaters,
      @JsonKey(name: 'favorites_count') int favoritesCount});
}

/// @nodoc
class _$HomeStatisticsModelCopyWithImpl<$Res>
    implements $HomeStatisticsModelCopyWith<$Res> {
  _$HomeStatisticsModelCopyWithImpl(this._self, this._then);

  final HomeStatisticsModel _self;
  final $Res Function(HomeStatisticsModel) _then;

  /// Create a copy of HomeStatisticsModel
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

/// Adds pattern-matching-related methods to [HomeStatisticsModel].
extension HomeStatisticsModelPatterns on HomeStatisticsModel {
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
    TResult Function(_HomeStatisticsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeStatisticsModel() when $default != null:
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
    TResult Function(_HomeStatisticsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeStatisticsModel():
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
    TResult? Function(_HomeStatisticsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeStatisticsModel() when $default != null:
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
    TResult Function(@JsonKey(name: 'total_repeaters') int totalRepeaters,
            @JsonKey(name: 'favorites_count') int favoritesCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeStatisticsModel() when $default != null:
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
    TResult Function(@JsonKey(name: 'total_repeaters') int totalRepeaters,
            @JsonKey(name: 'favorites_count') int favoritesCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeStatisticsModel():
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
    TResult? Function(@JsonKey(name: 'total_repeaters') int totalRepeaters,
            @JsonKey(name: 'favorites_count') int favoritesCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeStatisticsModel() when $default != null:
        return $default(_that.totalRepeaters, _that.favoritesCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeStatisticsModel implements HomeStatisticsModel {
  const _HomeStatisticsModel(
      {@JsonKey(name: 'total_repeaters') required this.totalRepeaters,
      @JsonKey(name: 'favorites_count') required this.favoritesCount});
  factory _HomeStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$HomeStatisticsModelFromJson(json);

  @override
  @JsonKey(name: 'total_repeaters')
  final int totalRepeaters;
  @override
  @JsonKey(name: 'favorites_count')
  final int favoritesCount;

  /// Create a copy of HomeStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStatisticsModelCopyWith<_HomeStatisticsModel> get copyWith =>
      __$HomeStatisticsModelCopyWithImpl<_HomeStatisticsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeStatisticsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeStatisticsModel &&
            (identical(other.totalRepeaters, totalRepeaters) ||
                other.totalRepeaters == totalRepeaters) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalRepeaters, favoritesCount);

  @override
  String toString() {
    return 'HomeStatisticsModel(totalRepeaters: $totalRepeaters, favoritesCount: $favoritesCount)';
  }
}

/// @nodoc
abstract mixin class _$HomeStatisticsModelCopyWith<$Res>
    implements $HomeStatisticsModelCopyWith<$Res> {
  factory _$HomeStatisticsModelCopyWith(_HomeStatisticsModel value,
          $Res Function(_HomeStatisticsModel) _then) =
      __$HomeStatisticsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_repeaters') int totalRepeaters,
      @JsonKey(name: 'favorites_count') int favoritesCount});
}

/// @nodoc
class __$HomeStatisticsModelCopyWithImpl<$Res>
    implements _$HomeStatisticsModelCopyWith<$Res> {
  __$HomeStatisticsModelCopyWithImpl(this._self, this._then);

  final _HomeStatisticsModel _self;
  final $Res Function(_HomeStatisticsModel) _then;

  /// Create a copy of HomeStatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalRepeaters = null,
    Object? favoritesCount = null,
  }) {
    return _then(_HomeStatisticsModel(
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
