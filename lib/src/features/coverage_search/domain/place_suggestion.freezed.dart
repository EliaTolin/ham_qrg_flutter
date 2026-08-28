// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceSuggestion {
  String get label;
  double get latitude;
  double get longitude;

  /// Contesto amministrativo che distingue gli omonimi (FR-003).
  String? get context;

  /// Create a copy of PlaceSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceSuggestionCopyWith<PlaceSuggestion> get copyWith =>
      _$PlaceSuggestionCopyWithImpl<PlaceSuggestion>(
          this as PlaceSuggestion, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceSuggestion &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, label, latitude, longitude, context);

  @override
  String toString() {
    return 'PlaceSuggestion(label: $label, latitude: $latitude, longitude: $longitude, context: $context)';
  }
}

/// @nodoc
abstract mixin class $PlaceSuggestionCopyWith<$Res> {
  factory $PlaceSuggestionCopyWith(
          PlaceSuggestion value, $Res Function(PlaceSuggestion) _then) =
      _$PlaceSuggestionCopyWithImpl;
  @useResult
  $Res call({String label, double latitude, double longitude, String? context});
}

/// @nodoc
class _$PlaceSuggestionCopyWithImpl<$Res>
    implements $PlaceSuggestionCopyWith<$Res> {
  _$PlaceSuggestionCopyWithImpl(this._self, this._then);

  final PlaceSuggestion _self;
  final $Res Function(PlaceSuggestion) _then;

  /// Create a copy of PlaceSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? context = freezed,
  }) {
    return _then(_self.copyWith(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaceSuggestion].
extension PlaceSuggestionPatterns on PlaceSuggestion {
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
    TResult Function(_PlaceSuggestion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceSuggestion() when $default != null:
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
    TResult Function(_PlaceSuggestion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceSuggestion():
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
    TResult? Function(_PlaceSuggestion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceSuggestion() when $default != null:
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
            String label, double latitude, double longitude, String? context)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceSuggestion() when $default != null:
        return $default(
            _that.label, _that.latitude, _that.longitude, _that.context);
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
            String label, double latitude, double longitude, String? context)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceSuggestion():
        return $default(
            _that.label, _that.latitude, _that.longitude, _that.context);
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
            String label, double latitude, double longitude, String? context)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceSuggestion() when $default != null:
        return $default(
            _that.label, _that.latitude, _that.longitude, _that.context);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlaceSuggestion extends PlaceSuggestion {
  const _PlaceSuggestion(
      {required this.label,
      required this.latitude,
      required this.longitude,
      this.context})
      : super._();

  @override
  final String label;
  @override
  final double latitude;
  @override
  final double longitude;

  /// Contesto amministrativo che distingue gli omonimi (FR-003).
  @override
  final String? context;

  /// Create a copy of PlaceSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceSuggestionCopyWith<_PlaceSuggestion> get copyWith =>
      __$PlaceSuggestionCopyWithImpl<_PlaceSuggestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceSuggestion &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, label, latitude, longitude, context);

  @override
  String toString() {
    return 'PlaceSuggestion(label: $label, latitude: $latitude, longitude: $longitude, context: $context)';
  }
}

/// @nodoc
abstract mixin class _$PlaceSuggestionCopyWith<$Res>
    implements $PlaceSuggestionCopyWith<$Res> {
  factory _$PlaceSuggestionCopyWith(
          _PlaceSuggestion value, $Res Function(_PlaceSuggestion) _then) =
      __$PlaceSuggestionCopyWithImpl;
  @override
  @useResult
  $Res call({String label, double latitude, double longitude, String? context});
}

/// @nodoc
class __$PlaceSuggestionCopyWithImpl<$Res>
    implements _$PlaceSuggestionCopyWith<$Res> {
  __$PlaceSuggestionCopyWithImpl(this._self, this._then);

  final _PlaceSuggestion _self;
  final $Res Function(_PlaceSuggestion) _then;

  /// Create a copy of PlaceSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? context = freezed,
  }) {
    return _then(_PlaceSuggestion(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
