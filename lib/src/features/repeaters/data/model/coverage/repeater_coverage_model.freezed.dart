// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_coverage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoverageBoundsModel {
  double get north;
  double get south;
  double get east;
  double get west;

  /// Create a copy of CoverageBoundsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoverageBoundsModelCopyWith<CoverageBoundsModel> get copyWith =>
      _$CoverageBoundsModelCopyWithImpl<CoverageBoundsModel>(
          this as CoverageBoundsModel, _$identity);

  /// Serializes this CoverageBoundsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoverageBoundsModel &&
            (identical(other.north, north) || other.north == north) &&
            (identical(other.south, south) || other.south == south) &&
            (identical(other.east, east) || other.east == east) &&
            (identical(other.west, west) || other.west == west));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, north, south, east, west);

  @override
  String toString() {
    return 'CoverageBoundsModel(north: $north, south: $south, east: $east, west: $west)';
  }
}

/// @nodoc
abstract mixin class $CoverageBoundsModelCopyWith<$Res> {
  factory $CoverageBoundsModelCopyWith(
          CoverageBoundsModel value, $Res Function(CoverageBoundsModel) _then) =
      _$CoverageBoundsModelCopyWithImpl;
  @useResult
  $Res call({double north, double south, double east, double west});
}

/// @nodoc
class _$CoverageBoundsModelCopyWithImpl<$Res>
    implements $CoverageBoundsModelCopyWith<$Res> {
  _$CoverageBoundsModelCopyWithImpl(this._self, this._then);

  final CoverageBoundsModel _self;
  final $Res Function(CoverageBoundsModel) _then;

  /// Create a copy of CoverageBoundsModel
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

/// Adds pattern-matching-related methods to [CoverageBoundsModel].
extension CoverageBoundsModelPatterns on CoverageBoundsModel {
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
    TResult Function(_CoverageBoundsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageBoundsModel() when $default != null:
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
    TResult Function(_CoverageBoundsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageBoundsModel():
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
    TResult? Function(_CoverageBoundsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageBoundsModel() when $default != null:
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
      case _CoverageBoundsModel() when $default != null:
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
      case _CoverageBoundsModel():
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
      case _CoverageBoundsModel() when $default != null:
        return $default(_that.north, _that.south, _that.east, _that.west);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CoverageBoundsModel implements CoverageBoundsModel {
  const _CoverageBoundsModel(
      {required this.north,
      required this.south,
      required this.east,
      required this.west});
  factory _CoverageBoundsModel.fromJson(Map<String, dynamic> json) =>
      _$CoverageBoundsModelFromJson(json);

  @override
  final double north;
  @override
  final double south;
  @override
  final double east;
  @override
  final double west;

  /// Create a copy of CoverageBoundsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoverageBoundsModelCopyWith<_CoverageBoundsModel> get copyWith =>
      __$CoverageBoundsModelCopyWithImpl<_CoverageBoundsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoverageBoundsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoverageBoundsModel &&
            (identical(other.north, north) || other.north == north) &&
            (identical(other.south, south) || other.south == south) &&
            (identical(other.east, east) || other.east == east) &&
            (identical(other.west, west) || other.west == west));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, north, south, east, west);

  @override
  String toString() {
    return 'CoverageBoundsModel(north: $north, south: $south, east: $east, west: $west)';
  }
}

/// @nodoc
abstract mixin class _$CoverageBoundsModelCopyWith<$Res>
    implements $CoverageBoundsModelCopyWith<$Res> {
  factory _$CoverageBoundsModelCopyWith(_CoverageBoundsModel value,
          $Res Function(_CoverageBoundsModel) _then) =
      __$CoverageBoundsModelCopyWithImpl;
  @override
  @useResult
  $Res call({double north, double south, double east, double west});
}

/// @nodoc
class __$CoverageBoundsModelCopyWithImpl<$Res>
    implements _$CoverageBoundsModelCopyWith<$Res> {
  __$CoverageBoundsModelCopyWithImpl(this._self, this._then);

  final _CoverageBoundsModel _self;
  final $Res Function(_CoverageBoundsModel) _then;

  /// Create a copy of CoverageBoundsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? north = null,
    Object? south = null,
    Object? east = null,
    Object? west = null,
  }) {
    return _then(_CoverageBoundsModel(
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
mixin _$CoverageSizeModel {
  int get width;
  int get height;

  /// Create a copy of CoverageSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoverageSizeModelCopyWith<CoverageSizeModel> get copyWith =>
      _$CoverageSizeModelCopyWithImpl<CoverageSizeModel>(
          this as CoverageSizeModel, _$identity);

  /// Serializes this CoverageSizeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoverageSizeModel &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  @override
  String toString() {
    return 'CoverageSizeModel(width: $width, height: $height)';
  }
}

/// @nodoc
abstract mixin class $CoverageSizeModelCopyWith<$Res> {
  factory $CoverageSizeModelCopyWith(
          CoverageSizeModel value, $Res Function(CoverageSizeModel) _then) =
      _$CoverageSizeModelCopyWithImpl;
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class _$CoverageSizeModelCopyWithImpl<$Res>
    implements $CoverageSizeModelCopyWith<$Res> {
  _$CoverageSizeModelCopyWithImpl(this._self, this._then);

  final CoverageSizeModel _self;
  final $Res Function(CoverageSizeModel) _then;

  /// Create a copy of CoverageSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_self.copyWith(
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [CoverageSizeModel].
extension CoverageSizeModelPatterns on CoverageSizeModel {
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
    TResult Function(_CoverageSizeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageSizeModel() when $default != null:
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
    TResult Function(_CoverageSizeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageSizeModel():
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
    TResult? Function(_CoverageSizeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageSizeModel() when $default != null:
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
    TResult Function(int width, int height)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageSizeModel() when $default != null:
        return $default(_that.width, _that.height);
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
    TResult Function(int width, int height) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageSizeModel():
        return $default(_that.width, _that.height);
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
    TResult? Function(int width, int height)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageSizeModel() when $default != null:
        return $default(_that.width, _that.height);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CoverageSizeModel implements CoverageSizeModel {
  const _CoverageSizeModel({required this.width, required this.height});
  factory _CoverageSizeModel.fromJson(Map<String, dynamic> json) =>
      _$CoverageSizeModelFromJson(json);

  @override
  final int width;
  @override
  final int height;

  /// Create a copy of CoverageSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoverageSizeModelCopyWith<_CoverageSizeModel> get copyWith =>
      __$CoverageSizeModelCopyWithImpl<_CoverageSizeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoverageSizeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoverageSizeModel &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  @override
  String toString() {
    return 'CoverageSizeModel(width: $width, height: $height)';
  }
}

/// @nodoc
abstract mixin class _$CoverageSizeModelCopyWith<$Res>
    implements $CoverageSizeModelCopyWith<$Res> {
  factory _$CoverageSizeModelCopyWith(
          _CoverageSizeModel value, $Res Function(_CoverageSizeModel) _then) =
      __$CoverageSizeModelCopyWithImpl;
  @override
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class __$CoverageSizeModelCopyWithImpl<$Res>
    implements _$CoverageSizeModelCopyWith<$Res> {
  __$CoverageSizeModelCopyWithImpl(this._self, this._then);

  final _CoverageSizeModel _self;
  final $Res Function(_CoverageSizeModel) _then;

  /// Create a copy of CoverageSizeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_CoverageSizeModel(
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$CoverageLegendStopModel {
  double get dbm;
  String get color;

  /// Create a copy of CoverageLegendStopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoverageLegendStopModelCopyWith<CoverageLegendStopModel> get copyWith =>
      _$CoverageLegendStopModelCopyWithImpl<CoverageLegendStopModel>(
          this as CoverageLegendStopModel, _$identity);

  /// Serializes this CoverageLegendStopModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoverageLegendStopModel &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dbm, color);

  @override
  String toString() {
    return 'CoverageLegendStopModel(dbm: $dbm, color: $color)';
  }
}

/// @nodoc
abstract mixin class $CoverageLegendStopModelCopyWith<$Res> {
  factory $CoverageLegendStopModelCopyWith(CoverageLegendStopModel value,
          $Res Function(CoverageLegendStopModel) _then) =
      _$CoverageLegendStopModelCopyWithImpl;
  @useResult
  $Res call({double dbm, String color});
}

/// @nodoc
class _$CoverageLegendStopModelCopyWithImpl<$Res>
    implements $CoverageLegendStopModelCopyWith<$Res> {
  _$CoverageLegendStopModelCopyWithImpl(this._self, this._then);

  final CoverageLegendStopModel _self;
  final $Res Function(CoverageLegendStopModel) _then;

  /// Create a copy of CoverageLegendStopModel
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

/// Adds pattern-matching-related methods to [CoverageLegendStopModel].
extension CoverageLegendStopModelPatterns on CoverageLegendStopModel {
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
    TResult Function(_CoverageLegendStopModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageLegendStopModel() when $default != null:
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
    TResult Function(_CoverageLegendStopModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageLegendStopModel():
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
    TResult? Function(_CoverageLegendStopModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageLegendStopModel() when $default != null:
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
      case _CoverageLegendStopModel() when $default != null:
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
      case _CoverageLegendStopModel():
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
      case _CoverageLegendStopModel() when $default != null:
        return $default(_that.dbm, _that.color);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CoverageLegendStopModel implements CoverageLegendStopModel {
  const _CoverageLegendStopModel({required this.dbm, required this.color});
  factory _CoverageLegendStopModel.fromJson(Map<String, dynamic> json) =>
      _$CoverageLegendStopModelFromJson(json);

  @override
  final double dbm;
  @override
  final String color;

  /// Create a copy of CoverageLegendStopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoverageLegendStopModelCopyWith<_CoverageLegendStopModel> get copyWith =>
      __$CoverageLegendStopModelCopyWithImpl<_CoverageLegendStopModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoverageLegendStopModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoverageLegendStopModel &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dbm, color);

  @override
  String toString() {
    return 'CoverageLegendStopModel(dbm: $dbm, color: $color)';
  }
}

/// @nodoc
abstract mixin class _$CoverageLegendStopModelCopyWith<$Res>
    implements $CoverageLegendStopModelCopyWith<$Res> {
  factory _$CoverageLegendStopModelCopyWith(_CoverageLegendStopModel value,
          $Res Function(_CoverageLegendStopModel) _then) =
      __$CoverageLegendStopModelCopyWithImpl;
  @override
  @useResult
  $Res call({double dbm, String color});
}

/// @nodoc
class __$CoverageLegendStopModelCopyWithImpl<$Res>
    implements _$CoverageLegendStopModelCopyWith<$Res> {
  __$CoverageLegendStopModelCopyWithImpl(this._self, this._then);

  final _CoverageLegendStopModel _self;
  final $Res Function(_CoverageLegendStopModel) _then;

  /// Create a copy of CoverageLegendStopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dbm = null,
    Object? color = null,
  }) {
    return _then(_CoverageLegendStopModel(
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
mixin _$RepeaterCoverageModel {
  CoverageBoundsModel get bounds;
  CoverageSizeModel get size;
  List<CoverageLegendStopModel> get legend;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  String? get image;
  bool get cached;
  String? get source;

  /// Create a copy of RepeaterCoverageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterCoverageModelCopyWith<RepeaterCoverageModel> get copyWith =>
      _$RepeaterCoverageModelCopyWithImpl<RepeaterCoverageModel>(
          this as RepeaterCoverageModel, _$identity);

  /// Serializes this RepeaterCoverageModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterCoverageModel &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other.legend, legend) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bounds,
      size,
      const DeepCollectionEquality().hash(legend),
      imageUrl,
      image,
      cached,
      source);

  @override
  String toString() {
    return 'RepeaterCoverageModel(bounds: $bounds, size: $size, legend: $legend, imageUrl: $imageUrl, image: $image, cached: $cached, source: $source)';
  }
}

/// @nodoc
abstract mixin class $RepeaterCoverageModelCopyWith<$Res> {
  factory $RepeaterCoverageModelCopyWith(RepeaterCoverageModel value,
          $Res Function(RepeaterCoverageModel) _then) =
      _$RepeaterCoverageModelCopyWithImpl;
  @useResult
  $Res call(
      {CoverageBoundsModel bounds,
      CoverageSizeModel size,
      List<CoverageLegendStopModel> legend,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? image,
      bool cached,
      String? source});

  $CoverageBoundsModelCopyWith<$Res> get bounds;
  $CoverageSizeModelCopyWith<$Res> get size;
}

/// @nodoc
class _$RepeaterCoverageModelCopyWithImpl<$Res>
    implements $RepeaterCoverageModelCopyWith<$Res> {
  _$RepeaterCoverageModelCopyWithImpl(this._self, this._then);

  final RepeaterCoverageModel _self;
  final $Res Function(RepeaterCoverageModel) _then;

  /// Create a copy of RepeaterCoverageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = null,
    Object? size = null,
    Object? legend = null,
    Object? imageUrl = freezed,
    Object? image = freezed,
    Object? cached = null,
    Object? source = freezed,
  }) {
    return _then(_self.copyWith(
      bounds: null == bounds
          ? _self.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as CoverageBoundsModel,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as CoverageSizeModel,
      legend: null == legend
          ? _self.legend
          : legend // ignore: cast_nullable_to_non_nullable
              as List<CoverageLegendStopModel>,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      cached: null == cached
          ? _self.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RepeaterCoverageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoverageBoundsModelCopyWith<$Res> get bounds {
    return $CoverageBoundsModelCopyWith<$Res>(_self.bounds, (value) {
      return _then(_self.copyWith(bounds: value));
    });
  }

  /// Create a copy of RepeaterCoverageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoverageSizeModelCopyWith<$Res> get size {
    return $CoverageSizeModelCopyWith<$Res>(_self.size, (value) {
      return _then(_self.copyWith(size: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RepeaterCoverageModel].
extension RepeaterCoverageModelPatterns on RepeaterCoverageModel {
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
    TResult Function(_RepeaterCoverageModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverageModel() when $default != null:
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
    TResult Function(_RepeaterCoverageModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverageModel():
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
    TResult? Function(_RepeaterCoverageModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverageModel() when $default != null:
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
            CoverageBoundsModel bounds,
            CoverageSizeModel size,
            List<CoverageLegendStopModel> legend,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? image,
            bool cached,
            String? source)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverageModel() when $default != null:
        return $default(_that.bounds, _that.size, _that.legend, _that.imageUrl,
            _that.image, _that.cached, _that.source);
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
            CoverageBoundsModel bounds,
            CoverageSizeModel size,
            List<CoverageLegendStopModel> legend,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? image,
            bool cached,
            String? source)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverageModel():
        return $default(_that.bounds, _that.size, _that.legend, _that.imageUrl,
            _that.image, _that.cached, _that.source);
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
            CoverageBoundsModel bounds,
            CoverageSizeModel size,
            List<CoverageLegendStopModel> legend,
            @JsonKey(name: 'image_url') String? imageUrl,
            String? image,
            bool cached,
            String? source)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterCoverageModel() when $default != null:
        return $default(_that.bounds, _that.size, _that.legend, _that.imageUrl,
            _that.image, _that.cached, _that.source);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RepeaterCoverageModel implements RepeaterCoverageModel {
  const _RepeaterCoverageModel(
      {required this.bounds,
      required this.size,
      final List<CoverageLegendStopModel> legend = const [],
      @JsonKey(name: 'image_url') this.imageUrl,
      this.image,
      this.cached = false,
      this.source})
      : _legend = legend;
  factory _RepeaterCoverageModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterCoverageModelFromJson(json);

  @override
  final CoverageBoundsModel bounds;
  @override
  final CoverageSizeModel size;
  final List<CoverageLegendStopModel> _legend;
  @override
  @JsonKey()
  List<CoverageLegendStopModel> get legend {
    if (_legend is EqualUnmodifiableListView) return _legend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_legend);
  }

  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final String? image;
  @override
  @JsonKey()
  final bool cached;
  @override
  final String? source;

  /// Create a copy of RepeaterCoverageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterCoverageModelCopyWith<_RepeaterCoverageModel> get copyWith =>
      __$RepeaterCoverageModelCopyWithImpl<_RepeaterCoverageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RepeaterCoverageModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterCoverageModel &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._legend, _legend) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bounds,
      size,
      const DeepCollectionEquality().hash(_legend),
      imageUrl,
      image,
      cached,
      source);

  @override
  String toString() {
    return 'RepeaterCoverageModel(bounds: $bounds, size: $size, legend: $legend, imageUrl: $imageUrl, image: $image, cached: $cached, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterCoverageModelCopyWith<$Res>
    implements $RepeaterCoverageModelCopyWith<$Res> {
  factory _$RepeaterCoverageModelCopyWith(_RepeaterCoverageModel value,
          $Res Function(_RepeaterCoverageModel) _then) =
      __$RepeaterCoverageModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CoverageBoundsModel bounds,
      CoverageSizeModel size,
      List<CoverageLegendStopModel> legend,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? image,
      bool cached,
      String? source});

  @override
  $CoverageBoundsModelCopyWith<$Res> get bounds;
  @override
  $CoverageSizeModelCopyWith<$Res> get size;
}

/// @nodoc
class __$RepeaterCoverageModelCopyWithImpl<$Res>
    implements _$RepeaterCoverageModelCopyWith<$Res> {
  __$RepeaterCoverageModelCopyWithImpl(this._self, this._then);

  final _RepeaterCoverageModel _self;
  final $Res Function(_RepeaterCoverageModel) _then;

  /// Create a copy of RepeaterCoverageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bounds = null,
    Object? size = null,
    Object? legend = null,
    Object? imageUrl = freezed,
    Object? image = freezed,
    Object? cached = null,
    Object? source = freezed,
  }) {
    return _then(_RepeaterCoverageModel(
      bounds: null == bounds
          ? _self.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as CoverageBoundsModel,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as CoverageSizeModel,
      legend: null == legend
          ? _self._legend
          : legend // ignore: cast_nullable_to_non_nullable
              as List<CoverageLegendStopModel>,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      cached: null == cached
          ? _self.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RepeaterCoverageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoverageBoundsModelCopyWith<$Res> get bounds {
    return $CoverageBoundsModelCopyWith<$Res>(_self.bounds, (value) {
      return _then(_self.copyWith(bounds: value));
    });
  }

  /// Create a copy of RepeaterCoverageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoverageSizeModelCopyWith<$Res> get size {
    return $CoverageSizeModelCopyWith<$Res>(_self.size, (value) {
      return _then(_self.copyWith(size: value));
    });
  }
}

// dart format on
