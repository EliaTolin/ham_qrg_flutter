// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedStation {
  String get id;
  String get name;
  SearchPoint get point;
  SearchBreadth get breadth;
  DateTime get computedAt;
  DateTime get lastRefreshedAt;
  List<CoverageEntry> get entries;

  /// Create a copy of SavedStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedStationCopyWith<SavedStation> get copyWith =>
      _$SavedStationCopyWithImpl<SavedStation>(
          this as SavedStation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedStation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.breadth, breadth) || other.breadth == breadth) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt) &&
            (identical(other.lastRefreshedAt, lastRefreshedAt) ||
                other.lastRefreshedAt == lastRefreshedAt) &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      point,
      breadth,
      computedAt,
      lastRefreshedAt,
      const DeepCollectionEquality().hash(entries));

  @override
  String toString() {
    return 'SavedStation(id: $id, name: $name, point: $point, breadth: $breadth, computedAt: $computedAt, lastRefreshedAt: $lastRefreshedAt, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class $SavedStationCopyWith<$Res> {
  factory $SavedStationCopyWith(
          SavedStation value, $Res Function(SavedStation) _then) =
      _$SavedStationCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      SearchPoint point,
      SearchBreadth breadth,
      DateTime computedAt,
      DateTime lastRefreshedAt,
      List<CoverageEntry> entries});

  $SearchPointCopyWith<$Res> get point;
}

/// @nodoc
class _$SavedStationCopyWithImpl<$Res> implements $SavedStationCopyWith<$Res> {
  _$SavedStationCopyWithImpl(this._self, this._then);

  final SavedStation _self;
  final $Res Function(SavedStation) _then;

  /// Create a copy of SavedStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? point = null,
    Object? breadth = null,
    Object? computedAt = null,
    Object? lastRefreshedAt = null,
    Object? entries = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as SearchPoint,
      breadth: null == breadth
          ? _self.breadth
          : breadth // ignore: cast_nullable_to_non_nullable
              as SearchBreadth,
      computedAt: null == computedAt
          ? _self.computedAt
          : computedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastRefreshedAt: null == lastRefreshedAt
          ? _self.lastRefreshedAt
          : lastRefreshedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entries: null == entries
          ? _self.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<CoverageEntry>,
    ));
  }

  /// Create a copy of SavedStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPointCopyWith<$Res> get point {
    return $SearchPointCopyWith<$Res>(_self.point, (value) {
      return _then(_self.copyWith(point: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SavedStation].
extension SavedStationPatterns on SavedStation {
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
    TResult Function(_SavedStation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedStation() when $default != null:
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
    TResult Function(_SavedStation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedStation():
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
    TResult? Function(_SavedStation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedStation() when $default != null:
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
            String id,
            String name,
            SearchPoint point,
            SearchBreadth breadth,
            DateTime computedAt,
            DateTime lastRefreshedAt,
            List<CoverageEntry> entries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedStation() when $default != null:
        return $default(_that.id, _that.name, _that.point, _that.breadth,
            _that.computedAt, _that.lastRefreshedAt, _that.entries);
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
            String id,
            String name,
            SearchPoint point,
            SearchBreadth breadth,
            DateTime computedAt,
            DateTime lastRefreshedAt,
            List<CoverageEntry> entries)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedStation():
        return $default(_that.id, _that.name, _that.point, _that.breadth,
            _that.computedAt, _that.lastRefreshedAt, _that.entries);
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
            String id,
            String name,
            SearchPoint point,
            SearchBreadth breadth,
            DateTime computedAt,
            DateTime lastRefreshedAt,
            List<CoverageEntry> entries)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedStation() when $default != null:
        return $default(_that.id, _that.name, _that.point, _that.breadth,
            _that.computedAt, _that.lastRefreshedAt, _that.entries);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SavedStation extends SavedStation {
  const _SavedStation(
      {required this.id,
      required this.name,
      required this.point,
      required this.breadth,
      required this.computedAt,
      required this.lastRefreshedAt,
      final List<CoverageEntry> entries = const <CoverageEntry>[]})
      : _entries = entries,
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final SearchPoint point;
  @override
  final SearchBreadth breadth;
  @override
  final DateTime computedAt;
  @override
  final DateTime lastRefreshedAt;
  final List<CoverageEntry> _entries;
  @override
  @JsonKey()
  List<CoverageEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  /// Create a copy of SavedStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedStationCopyWith<_SavedStation> get copyWith =>
      __$SavedStationCopyWithImpl<_SavedStation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedStation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.breadth, breadth) || other.breadth == breadth) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt) &&
            (identical(other.lastRefreshedAt, lastRefreshedAt) ||
                other.lastRefreshedAt == lastRefreshedAt) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      point,
      breadth,
      computedAt,
      lastRefreshedAt,
      const DeepCollectionEquality().hash(_entries));

  @override
  String toString() {
    return 'SavedStation(id: $id, name: $name, point: $point, breadth: $breadth, computedAt: $computedAt, lastRefreshedAt: $lastRefreshedAt, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class _$SavedStationCopyWith<$Res>
    implements $SavedStationCopyWith<$Res> {
  factory _$SavedStationCopyWith(
          _SavedStation value, $Res Function(_SavedStation) _then) =
      __$SavedStationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      SearchPoint point,
      SearchBreadth breadth,
      DateTime computedAt,
      DateTime lastRefreshedAt,
      List<CoverageEntry> entries});

  @override
  $SearchPointCopyWith<$Res> get point;
}

/// @nodoc
class __$SavedStationCopyWithImpl<$Res>
    implements _$SavedStationCopyWith<$Res> {
  __$SavedStationCopyWithImpl(this._self, this._then);

  final _SavedStation _self;
  final $Res Function(_SavedStation) _then;

  /// Create a copy of SavedStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? point = null,
    Object? breadth = null,
    Object? computedAt = null,
    Object? lastRefreshedAt = null,
    Object? entries = null,
  }) {
    return _then(_SavedStation(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as SearchPoint,
      breadth: null == breadth
          ? _self.breadth
          : breadth // ignore: cast_nullable_to_non_nullable
              as SearchBreadth,
      computedAt: null == computedAt
          ? _self.computedAt
          : computedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastRefreshedAt: null == lastRefreshedAt
          ? _self.lastRefreshedAt
          : lastRefreshedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entries: null == entries
          ? _self._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<CoverageEntry>,
    ));
  }

  /// Create a copy of SavedStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPointCopyWith<$Res> get point {
    return $SearchPointCopyWith<$Res>(_self.point, (value) {
      return _then(_self.copyWith(point: value));
    });
  }
}

// dart format on
