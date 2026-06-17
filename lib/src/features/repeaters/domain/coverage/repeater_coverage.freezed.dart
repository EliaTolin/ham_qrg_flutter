// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_coverage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoverageBounds {
  double get north;
  double get south;
  double get east;
  double get west;

  /// Create a copy of CoverageBounds
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoverageBoundsCopyWith<CoverageBounds> get copyWith =>
      _$CoverageBoundsCopyWithImpl<CoverageBounds>(
          this as CoverageBounds, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoverageBounds &&
            (identical(other.north, north) || other.north == north) &&
            (identical(other.south, south) || other.south == south) &&
            (identical(other.east, east) || other.east == east) &&
            (identical(other.west, west) || other.west == west));
  }

  @override
  int get hashCode => Object.hash(runtimeType, north, south, east, west);

  @override
  String toString() {
    return 'CoverageBounds(north: $north, south: $south, east: $east, west: $west)';
  }
}

/// @nodoc
abstract mixin class $CoverageBoundsCopyWith<$Res> {
  factory $CoverageBoundsCopyWith(
          CoverageBounds value, $Res Function(CoverageBounds) _then) =
      _$CoverageBoundsCopyWithImpl;
  @useResult
  $Res call({double north, double south, double east, double west});
}

/// @nodoc
class _$CoverageBoundsCopyWithImpl<$Res>
    implements $CoverageBoundsCopyWith<$Res> {
  _$CoverageBoundsCopyWithImpl(this._self, this._then);

  final CoverageBounds _self;
  final $Res Function(CoverageBounds) _then;

  /// Create a copy of CoverageBounds
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? north = null,
    Object? south = null,
    Object? east = null,
    Object? west = null,
  }) {
    return _then(_self.copyWith(
      north: null == north
          ? _self.north
          : north // ignore: cast_nullable_to_non_nullable
              as double,
      south: null == south
          ? _self.south
          : south // ignore: cast_nullable_to_non_nullable
              as double,
      east: null == east
          ? _self.east
          : east // ignore: cast_nullable_to_non_nullable
              as double,
      west: null == west
          ? _self.west
          : west // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [CoverageBounds].
extension CoverageBoundsPatterns on CoverageBounds {
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
    TResult Function(_CoverageBounds value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageBounds() when $default != null:
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
    TResult Function(_CoverageBounds value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageBounds():
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
    TResult? Function(_CoverageBounds value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageBounds() when $default != null:
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
    TResult Function(double north, double south, double east, double west)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageBounds() when $default != null:
        return $default(_that.north, _that.south, _that.east, _that.west);
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
    TResult Function(double north, double south, double east, double west)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageBounds():
        return $default(_that.north, _that.south, _that.east, _that.west);
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
    TResult? Function(double north, double south, double east, double west)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageBounds() when $default != null:
        return $default(_that.north, _that.south, _that.east, _that.west);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CoverageBounds implements CoverageBounds {
  const _CoverageBounds(
      {required this.north,
      required this.south,
      required this.east,
      required this.west});

  @override
  final double north;
  @override
  final double south;
  @override
  final double east;
  @override
  final double west;

  /// Create a copy of CoverageBounds
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoverageBoundsCopyWith<_CoverageBounds> get copyWith =>
      __$CoverageBoundsCopyWithImpl<_CoverageBounds>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoverageBounds &&
            (identical(other.north, north) || other.north == north) &&
            (identical(other.south, south) || other.south == south) &&
            (identical(other.east, east) || other.east == east) &&
            (identical(other.west, west) || other.west == west));
  }

  @override
  int get hashCode => Object.hash(runtimeType, north, south, east, west);

  @override
  String toString() {
    return 'CoverageBounds(north: $north, south: $south, east: $east, west: $west)';
  }
}

/// @nodoc
abstract mixin class _$CoverageBoundsCopyWith<$Res>
    implements $CoverageBoundsCopyWith<$Res> {
  factory _$CoverageBoundsCopyWith(
          _CoverageBounds value, $Res Function(_CoverageBounds) _then) =
      __$CoverageBoundsCopyWithImpl;
  @override
  @useResult
  $Res call({double north, double south, double east, double west});
}

/// @nodoc
class __$CoverageBoundsCopyWithImpl<$Res>
    implements _$CoverageBoundsCopyWith<$Res> {
  __$CoverageBoundsCopyWithImpl(this._self, this._then);

  final _CoverageBounds _self;
  final $Res Function(_CoverageBounds) _then;

  /// Create a copy of CoverageBounds
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? north = null,
    Object? south = null,
    Object? east = null,
    Object? west = null,
  }) {
    return _then(_CoverageBounds(
      north: null == north
          ? _self.north
          : north // ignore: cast_nullable_to_non_nullable
              as double,
      south: null == south
          ? _self.south
          : south // ignore: cast_nullable_to_non_nullable
              as double,
      east: null == east
          ? _self.east
          : east // ignore: cast_nullable_to_non_nullable
              as double,
      west: null == west
          ? _self.west
          : west // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$CoverageLegendStop {
  double get dbm;
  String get color;

  /// Create a copy of CoverageLegendStop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoverageLegendStopCopyWith<CoverageLegendStop> get copyWith =>
      _$CoverageLegendStopCopyWithImpl<CoverageLegendStop>(
          this as CoverageLegendStop, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoverageLegendStop &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dbm, color);

  @override
  String toString() {
    return 'CoverageLegendStop(dbm: $dbm, color: $color)';
  }
}

/// @nodoc
abstract mixin class $CoverageLegendStopCopyWith<$Res> {
  factory $CoverageLegendStopCopyWith(
          CoverageLegendStop value, $Res Function(CoverageLegendStop) _then) =
      _$CoverageLegendStopCopyWithImpl;
  @useResult
  $Res call({double dbm, String color});
}

/// @nodoc
class _$CoverageLegendStopCopyWithImpl<$Res>
    implements $CoverageLegendStopCopyWith<$Res> {
  _$CoverageLegendStopCopyWithImpl(this._self, this._then);

  final CoverageLegendStop _self;
  final $Res Function(CoverageLegendStop) _then;

  /// Create a copy of CoverageLegendStop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbm = null,
    Object? color = null,
  }) {
    return _then(_self.copyWith(
      dbm: null == dbm
          ? _self.dbm
          : dbm // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CoverageLegendStop].
extension CoverageLegendStopPatterns on CoverageLegendStop {
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
    TResult Function(_CoverageLegendStop value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageLegendStop() when $default != null:
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
    TResult Function(_CoverageLegendStop value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageLegendStop():
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
    TResult? Function(_CoverageLegendStop value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageLegendStop() when $default != null:
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
    TResult Function(double dbm, String color)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageLegendStop() when $default != null:
        return $default(_that.dbm, _that.color);
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
    TResult Function(double dbm, String color) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageLegendStop():
        return $default(_that.dbm, _that.color);
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
    TResult? Function(double dbm, String color)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageLegendStop() when $default != null:
        return $default(_that.dbm, _that.color);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CoverageLegendStop implements CoverageLegendStop {
  const _CoverageLegendStop({required this.dbm, required this.color});

  @override
  final double dbm;
  @override
  final String color;

  /// Create a copy of CoverageLegendStop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoverageLegendStopCopyWith<_CoverageLegendStop> get copyWith =>
      __$CoverageLegendStopCopyWithImpl<_CoverageLegendStop>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoverageLegendStop &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dbm, color);

  @override
  String toString() {
    return 'CoverageLegendStop(dbm: $dbm, color: $color)';
  }
}

/// @nodoc
abstract mixin class _$CoverageLegendStopCopyWith<$Res>
    implements $CoverageLegendStopCopyWith<$Res> {
  factory _$CoverageLegendStopCopyWith(
          _CoverageLegendStop value, $Res Function(_CoverageLegendStop) _then) =
      __$CoverageLegendStopCopyWithImpl;
  @override
  @useResult
  $Res call({double dbm, String color});
}

/// @nodoc
class __$CoverageLegendStopCopyWithImpl<$Res>
    implements _$CoverageLegendStopCopyWith<$Res> {
  __$CoverageLegendStopCopyWithImpl(this._self, this._then);

  final _CoverageLegendStop _self;
  final $Res Function(_CoverageLegendStop) _then;

  /// Create a copy of CoverageLegendStop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dbm = null,
    Object? color = null,
  }) {
    return _then(_CoverageLegendStop(
      dbm: null == dbm
          ? _self.dbm
          : dbm // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$RepeaterCoverage {
  CoverageBounds get bounds;
  int get width;
  int get height;
  String get imageUrl;
  List<CoverageLegendStop> get legend;

  /// Create a copy of RepeaterCoverage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterCoverageCopyWith<RepeaterCoverage> get copyWith =>
      _$RepeaterCoverageCopyWithImpl<RepeaterCoverage>(
          this as RepeaterCoverage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterCoverage &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other.legend, legend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bounds, width, height, imageUrl,
      const DeepCollectionEquality().hash(legend));

  @override
  String toString() {
    return 'RepeaterCoverage(bounds: $bounds, width: $width, height: $height, imageUrl: $imageUrl, legend: $legend)';
  }
}

/// @nodoc
abstract mixin class $RepeaterCoverageCopyWith<$Res> {
  factory $RepeaterCoverageCopyWith(
          RepeaterCoverage value, $Res Function(RepeaterCoverage) _then) =
      _$RepeaterCoverageCopyWithImpl;
  @useResult
  $Res call(
      {CoverageBounds bounds,
      int width,
      int height,
      String imageUrl,
      List<CoverageLegendStop> legend});

  $CoverageBoundsCopyWith<$Res> get bounds;
}

/// @nodoc
class _$RepeaterCoverageCopyWithImpl<$Res>
    implements $RepeaterCoverageCopyWith<$Res> {
  _$RepeaterCoverageCopyWithImpl(this._self, this._then);

  final RepeaterCoverage _self;
  final $Res Function(RepeaterCoverage) _then;

  /// Create a copy of RepeaterCoverage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = null,
    Object? width = null,
    Object? height = null,
    Object? imageUrl = null,
    Object? legend = null,
  }) {
    return _then(_self.copyWith(
      bounds: null == bounds
          ? _self.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as CoverageBounds,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      legend: null == legend
          ? _self.legend
          : legend // ignore: cast_nullable_to_non_nullable
              as List<CoverageLegendStop>,
    ));
  }

  /// Create a copy of RepeaterCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoverageBoundsCopyWith<$Res> get bounds {
    return $CoverageBoundsCopyWith<$Res>(_self.bounds, (value) {
      return _then(_self.copyWith(bounds: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RepeaterCoverage].
extension RepeaterCoveragePatterns on RepeaterCoverage {
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
    TResult Function(_RepeaterCoverage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverage() when $default != null:
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
    TResult Function(_RepeaterCoverage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverage():
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
    TResult? Function(_RepeaterCoverage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverage() when $default != null:
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
    TResult Function(CoverageBounds bounds, int width, int height,
            String imageUrl, List<CoverageLegendStop> legend)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverage() when $default != null:
        return $default(_that.bounds, _that.width, _that.height, _that.imageUrl,
            _that.legend);
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
    TResult Function(CoverageBounds bounds, int width, int height,
            String imageUrl, List<CoverageLegendStop> legend)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverage():
        return $default(_that.bounds, _that.width, _that.height, _that.imageUrl,
            _that.legend);
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
    TResult? Function(CoverageBounds bounds, int width, int height,
            String imageUrl, List<CoverageLegendStop> legend)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverage() when $default != null:
        return $default(_that.bounds, _that.width, _that.height, _that.imageUrl,
            _that.legend);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeaterCoverage implements RepeaterCoverage {
  const _RepeaterCoverage(
      {required this.bounds,
      required this.width,
      required this.height,
      required this.imageUrl,
      final List<CoverageLegendStop> legend = const []})
      : _legend = legend;

  @override
  final CoverageBounds bounds;
  @override
  final int width;
  @override
  final int height;
  @override
  final String imageUrl;
  final List<CoverageLegendStop> _legend;
  @override
  @JsonKey()
  List<CoverageLegendStop> get legend {
    if (_legend is EqualUnmodifiableListView) return _legend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_legend);
  }

  /// Create a copy of RepeaterCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterCoverageCopyWith<_RepeaterCoverage> get copyWith =>
      __$RepeaterCoverageCopyWithImpl<_RepeaterCoverage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterCoverage &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._legend, _legend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bounds, width, height, imageUrl,
      const DeepCollectionEquality().hash(_legend));

  @override
  String toString() {
    return 'RepeaterCoverage(bounds: $bounds, width: $width, height: $height, imageUrl: $imageUrl, legend: $legend)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterCoverageCopyWith<$Res>
    implements $RepeaterCoverageCopyWith<$Res> {
  factory _$RepeaterCoverageCopyWith(
          _RepeaterCoverage value, $Res Function(_RepeaterCoverage) _then) =
      __$RepeaterCoverageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CoverageBounds bounds,
      int width,
      int height,
      String imageUrl,
      List<CoverageLegendStop> legend});

  @override
  $CoverageBoundsCopyWith<$Res> get bounds;
}

/// @nodoc
class __$RepeaterCoverageCopyWithImpl<$Res>
    implements _$RepeaterCoverageCopyWith<$Res> {
  __$RepeaterCoverageCopyWithImpl(this._self, this._then);

  final _RepeaterCoverage _self;
  final $Res Function(_RepeaterCoverage) _then;

  /// Create a copy of RepeaterCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bounds = null,
    Object? width = null,
    Object? height = null,
    Object? imageUrl = null,
    Object? legend = null,
  }) {
    return _then(_RepeaterCoverage(
      bounds: null == bounds
          ? _self.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as CoverageBounds,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      legend: null == legend
          ? _self._legend
          : legend // ignore: cast_nullable_to_non_nullable
              as List<CoverageLegendStop>,
    ));
  }

  /// Create a copy of RepeaterCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoverageBoundsCopyWith<$Res> get bounds {
    return $CoverageBoundsCopyWith<$Res>(_self.bounds, (value) {
      return _then(_self.copyWith(bounds: value));
    });
  }
}

// dart format on
