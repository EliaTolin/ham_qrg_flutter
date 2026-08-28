// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchPoint {
  double get latitude;
  double get longitude;
  String get label;
  SearchPointOrigin get origin;

  /// Contesto amministrativo (comune, regione, nazione) che distingue gli
  /// omonimi. Assente per i punti scelti con pressione sulla mappa.
  String? get context;

  /// Create a copy of SearchPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchPointCopyWith<SearchPoint> get copyWith =>
      _$SearchPointCopyWithImpl<SearchPoint>(this as SearchPoint, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchPoint &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, label, origin, context);

  @override
  String toString() {
    return 'SearchPoint(latitude: $latitude, longitude: $longitude, label: $label, origin: $origin, context: $context)';
  }
}

/// @nodoc
abstract mixin class $SearchPointCopyWith<$Res> {
  factory $SearchPointCopyWith(
          SearchPoint value, $Res Function(SearchPoint) _then) =
      _$SearchPointCopyWithImpl;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String label,
      SearchPointOrigin origin,
      String? context});
}

/// @nodoc
class _$SearchPointCopyWithImpl<$Res> implements $SearchPointCopyWith<$Res> {
  _$SearchPointCopyWithImpl(this._self, this._then);

  final SearchPoint _self;
  final $Res Function(SearchPoint) _then;

  /// Create a copy of SearchPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? label = null,
    Object? origin = null,
    Object? context = freezed,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as SearchPointOrigin,
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchPoint].
extension SearchPointPatterns on SearchPoint {
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
    TResult Function(_SearchPoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchPoint() when $default != null:
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
    TResult Function(_SearchPoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPoint():
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
    TResult? Function(_SearchPoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPoint() when $default != null:
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
    TResult Function(double latitude, double longitude, String label,
            SearchPointOrigin origin, String? context)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchPoint() when $default != null:
        return $default(_that.latitude, _that.longitude, _that.label,
            _that.origin, _that.context);
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
    TResult Function(double latitude, double longitude, String label,
            SearchPointOrigin origin, String? context)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPoint():
        return $default(_that.latitude, _that.longitude, _that.label,
            _that.origin, _that.context);
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
    TResult? Function(double latitude, double longitude, String label,
            SearchPointOrigin origin, String? context)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPoint() when $default != null:
        return $default(_that.latitude, _that.longitude, _that.label,
            _that.origin, _that.context);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchPoint extends SearchPoint {
  const _SearchPoint(
      {required this.latitude,
      required this.longitude,
      required this.label,
      required this.origin,
      this.context})
      : super._();

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String label;
  @override
  final SearchPointOrigin origin;

  /// Contesto amministrativo (comune, regione, nazione) che distingue gli
  /// omonimi. Assente per i punti scelti con pressione sulla mappa.
  @override
  final String? context;

  /// Create a copy of SearchPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchPointCopyWith<_SearchPoint> get copyWith =>
      __$SearchPointCopyWithImpl<_SearchPoint>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchPoint &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, label, origin, context);

  @override
  String toString() {
    return 'SearchPoint(latitude: $latitude, longitude: $longitude, label: $label, origin: $origin, context: $context)';
  }
}

/// @nodoc
abstract mixin class _$SearchPointCopyWith<$Res>
    implements $SearchPointCopyWith<$Res> {
  factory _$SearchPointCopyWith(
          _SearchPoint value, $Res Function(_SearchPoint) _then) =
      __$SearchPointCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String label,
      SearchPointOrigin origin,
      String? context});
}

/// @nodoc
class __$SearchPointCopyWithImpl<$Res> implements _$SearchPointCopyWith<$Res> {
  __$SearchPointCopyWithImpl(this._self, this._then);

  final _SearchPoint _self;
  final $Res Function(_SearchPoint) _then;

  /// Create a copy of SearchPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? label = null,
    Object? origin = null,
    Object? context = freezed,
  }) {
    return _then(_SearchPoint(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as SearchPointOrigin,
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
