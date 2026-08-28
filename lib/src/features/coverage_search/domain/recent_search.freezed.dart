// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentSearch {
  String get label;
  double get latitude;
  double get longitude;
  DateTime get usedAt;
  String? get context;

  /// Create a copy of RecentSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentSearchCopyWith<RecentSearch> get copyWith =>
      _$RecentSearchCopyWithImpl<RecentSearch>(
          this as RecentSearch, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecentSearch &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, label, latitude, longitude, usedAt, context);

  @override
  String toString() {
    return 'RecentSearch(label: $label, latitude: $latitude, longitude: $longitude, usedAt: $usedAt, context: $context)';
  }
}

/// @nodoc
abstract mixin class $RecentSearchCopyWith<$Res> {
  factory $RecentSearchCopyWith(
          RecentSearch value, $Res Function(RecentSearch) _then) =
      _$RecentSearchCopyWithImpl;
  @useResult
  $Res call(
      {String label,
      double latitude,
      double longitude,
      DateTime usedAt,
      String? context});
}

/// @nodoc
class _$RecentSearchCopyWithImpl<$Res> implements $RecentSearchCopyWith<$Res> {
  _$RecentSearchCopyWithImpl(this._self, this._then);

  final RecentSearch _self;
  final $Res Function(RecentSearch) _then;

  /// Create a copy of RecentSearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? usedAt = null,
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
      usedAt: null == usedAt
          ? _self.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RecentSearch].
extension RecentSearchPatterns on RecentSearch {
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
    TResult Function(_RecentSearch value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentSearch() when $default != null:
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
    TResult Function(_RecentSearch value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentSearch():
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
    TResult? Function(_RecentSearch value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentSearch() when $default != null:
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
    TResult Function(String label, double latitude, double longitude,
            DateTime usedAt, String? context)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentSearch() when $default != null:
        return $default(_that.label, _that.latitude, _that.longitude,
            _that.usedAt, _that.context);
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
    TResult Function(String label, double latitude, double longitude,
            DateTime usedAt, String? context)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentSearch():
        return $default(_that.label, _that.latitude, _that.longitude,
            _that.usedAt, _that.context);
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
    TResult? Function(String label, double latitude, double longitude,
            DateTime usedAt, String? context)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentSearch() when $default != null:
        return $default(_that.label, _that.latitude, _that.longitude,
            _that.usedAt, _that.context);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RecentSearch extends RecentSearch {
  const _RecentSearch(
      {required this.label,
      required this.latitude,
      required this.longitude,
      required this.usedAt,
      this.context})
      : super._();

  @override
  final String label;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final DateTime usedAt;
  @override
  final String? context;

  /// Create a copy of RecentSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecentSearchCopyWith<_RecentSearch> get copyWith =>
      __$RecentSearchCopyWithImpl<_RecentSearch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecentSearch &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, label, latitude, longitude, usedAt, context);

  @override
  String toString() {
    return 'RecentSearch(label: $label, latitude: $latitude, longitude: $longitude, usedAt: $usedAt, context: $context)';
  }
}

/// @nodoc
abstract mixin class _$RecentSearchCopyWith<$Res>
    implements $RecentSearchCopyWith<$Res> {
  factory _$RecentSearchCopyWith(
          _RecentSearch value, $Res Function(_RecentSearch) _then) =
      __$RecentSearchCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String label,
      double latitude,
      double longitude,
      DateTime usedAt,
      String? context});
}

/// @nodoc
class __$RecentSearchCopyWithImpl<$Res>
    implements _$RecentSearchCopyWith<$Res> {
  __$RecentSearchCopyWithImpl(this._self, this._then);

  final _RecentSearch _self;
  final $Res Function(_RecentSearch) _then;

  /// Create a copy of RecentSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? usedAt = null,
    Object? context = freezed,
  }) {
    return _then(_RecentSearch(
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
      usedAt: null == usedAt
          ? _self.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      context: freezed == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
