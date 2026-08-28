// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coverage_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoverageEntry {
  String get repeaterId;
  double get dbm;
  double get distanceKm;
  bool get reachable;

  /// Create a copy of CoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoverageEntryCopyWith<CoverageEntry> get copyWith =>
      _$CoverageEntryCopyWithImpl<CoverageEntry>(
          this as CoverageEntry, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoverageEntry &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, repeaterId, dbm, distanceKm, reachable);

  @override
  String toString() {
    return 'CoverageEntry(repeaterId: $repeaterId, dbm: $dbm, distanceKm: $distanceKm, reachable: $reachable)';
  }
}

/// @nodoc
abstract mixin class $CoverageEntryCopyWith<$Res> {
  factory $CoverageEntryCopyWith(
          CoverageEntry value, $Res Function(CoverageEntry) _then) =
      _$CoverageEntryCopyWithImpl;
  @useResult
  $Res call({String repeaterId, double dbm, double distanceKm, bool reachable});
}

/// @nodoc
class _$CoverageEntryCopyWithImpl<$Res>
    implements $CoverageEntryCopyWith<$Res> {
  _$CoverageEntryCopyWithImpl(this._self, this._then);

  final CoverageEntry _self;
  final $Res Function(CoverageEntry) _then;

  /// Create a copy of CoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeaterId = null,
    Object? dbm = null,
    Object? distanceKm = null,
    Object? reachable = null,
  }) {
    return _then(_self.copyWith(
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      dbm: null == dbm
          ? _self.dbm
          : dbm // ignore: cast_nullable_to_non_nullable
              as double,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      reachable: null == reachable
          ? _self.reachable
          : reachable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CoverageEntry].
extension CoverageEntryPatterns on CoverageEntry {
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
    TResult Function(_CoverageEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageEntry() when $default != null:
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
    TResult Function(_CoverageEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageEntry():
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
    TResult? Function(_CoverageEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageEntry() when $default != null:
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
            String repeaterId, double dbm, double distanceKm, bool reachable)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageEntry() when $default != null:
        return $default(
            _that.repeaterId, _that.dbm, _that.distanceKm, _that.reachable);
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
            String repeaterId, double dbm, double distanceKm, bool reachable)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageEntry():
        return $default(
            _that.repeaterId, _that.dbm, _that.distanceKm, _that.reachable);
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
            String repeaterId, double dbm, double distanceKm, bool reachable)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageEntry() when $default != null:
        return $default(
            _that.repeaterId, _that.dbm, _that.distanceKm, _that.reachable);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CoverageEntry implements CoverageEntry {
  const _CoverageEntry(
      {required this.repeaterId,
      required this.dbm,
      required this.distanceKm,
      required this.reachable});

  @override
  final String repeaterId;
  @override
  final double dbm;
  @override
  final double distanceKm;
  @override
  final bool reachable;

  /// Create a copy of CoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoverageEntryCopyWith<_CoverageEntry> get copyWith =>
      __$CoverageEntryCopyWithImpl<_CoverageEntry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoverageEntry &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, repeaterId, dbm, distanceKm, reachable);

  @override
  String toString() {
    return 'CoverageEntry(repeaterId: $repeaterId, dbm: $dbm, distanceKm: $distanceKm, reachable: $reachable)';
  }
}

/// @nodoc
abstract mixin class _$CoverageEntryCopyWith<$Res>
    implements $CoverageEntryCopyWith<$Res> {
  factory _$CoverageEntryCopyWith(
          _CoverageEntry value, $Res Function(_CoverageEntry) _then) =
      __$CoverageEntryCopyWithImpl;
  @override
  @useResult
  $Res call({String repeaterId, double dbm, double distanceKm, bool reachable});
}

/// @nodoc
class __$CoverageEntryCopyWithImpl<$Res>
    implements _$CoverageEntryCopyWith<$Res> {
  __$CoverageEntryCopyWithImpl(this._self, this._then);

  final _CoverageEntry _self;
  final $Res Function(_CoverageEntry) _then;

  /// Create a copy of CoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeaterId = null,
    Object? dbm = null,
    Object? distanceKm = null,
    Object? reachable = null,
  }) {
    return _then(_CoverageEntry(
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      dbm: null == dbm
          ? _self.dbm
          : dbm // ignore: cast_nullable_to_non_nullable
              as double,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      reachable: null == reachable
          ? _self.reachable
          : reachable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$CoverageResult {
  SearchPoint get point;
  SearchBreadth get breadth;
  DateTime get computedAt;
  List<CoverageEntry> get entries;

  /// Create a copy of CoverageResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoverageResultCopyWith<CoverageResult> get copyWith =>
      _$CoverageResultCopyWithImpl<CoverageResult>(
          this as CoverageResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoverageResult &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.breadth, breadth) || other.breadth == breadth) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt) &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, point, breadth, computedAt,
      const DeepCollectionEquality().hash(entries));

  @override
  String toString() {
    return 'CoverageResult(point: $point, breadth: $breadth, computedAt: $computedAt, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class $CoverageResultCopyWith<$Res> {
  factory $CoverageResultCopyWith(
          CoverageResult value, $Res Function(CoverageResult) _then) =
      _$CoverageResultCopyWithImpl;
  @useResult
  $Res call(
      {SearchPoint point,
      SearchBreadth breadth,
      DateTime computedAt,
      List<CoverageEntry> entries});

  $SearchPointCopyWith<$Res> get point;
}

/// @nodoc
class _$CoverageResultCopyWithImpl<$Res>
    implements $CoverageResultCopyWith<$Res> {
  _$CoverageResultCopyWithImpl(this._self, this._then);

  final CoverageResult _self;
  final $Res Function(CoverageResult) _then;

  /// Create a copy of CoverageResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = null,
    Object? breadth = null,
    Object? computedAt = null,
    Object? entries = null,
  }) {
    return _then(_self.copyWith(
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
      entries: null == entries
          ? _self.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<CoverageEntry>,
    ));
  }

  /// Create a copy of CoverageResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPointCopyWith<$Res> get point {
    return $SearchPointCopyWith<$Res>(_self.point, (value) {
      return _then(_self.copyWith(point: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CoverageResult].
extension CoverageResultPatterns on CoverageResult {
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
    TResult Function(_CoverageResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageResult() when $default != null:
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
    TResult Function(_CoverageResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageResult():
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
    TResult? Function(_CoverageResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageResult() when $default != null:
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
    TResult Function(SearchPoint point, SearchBreadth breadth,
            DateTime computedAt, List<CoverageEntry> entries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageResult() when $default != null:
        return $default(
            _that.point, _that.breadth, _that.computedAt, _that.entries);
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
    TResult Function(SearchPoint point, SearchBreadth breadth,
            DateTime computedAt, List<CoverageEntry> entries)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageResult():
        return $default(
            _that.point, _that.breadth, _that.computedAt, _that.entries);
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
    TResult? Function(SearchPoint point, SearchBreadth breadth,
            DateTime computedAt, List<CoverageEntry> entries)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageResult() when $default != null:
        return $default(
            _that.point, _that.breadth, _that.computedAt, _that.entries);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CoverageResult extends CoverageResult {
  const _CoverageResult(
      {required this.point,
      required this.breadth,
      required this.computedAt,
      final List<CoverageEntry> entries = const <CoverageEntry>[]})
      : _entries = entries,
        super._();

  @override
  final SearchPoint point;
  @override
  final SearchBreadth breadth;
  @override
  final DateTime computedAt;
  final List<CoverageEntry> _entries;
  @override
  @JsonKey()
  List<CoverageEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  /// Create a copy of CoverageResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoverageResultCopyWith<_CoverageResult> get copyWith =>
      __$CoverageResultCopyWithImpl<_CoverageResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoverageResult &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.breadth, breadth) || other.breadth == breadth) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, point, breadth, computedAt,
      const DeepCollectionEquality().hash(_entries));

  @override
  String toString() {
    return 'CoverageResult(point: $point, breadth: $breadth, computedAt: $computedAt, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class _$CoverageResultCopyWith<$Res>
    implements $CoverageResultCopyWith<$Res> {
  factory _$CoverageResultCopyWith(
          _CoverageResult value, $Res Function(_CoverageResult) _then) =
      __$CoverageResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SearchPoint point,
      SearchBreadth breadth,
      DateTime computedAt,
      List<CoverageEntry> entries});

  @override
  $SearchPointCopyWith<$Res> get point;
}

/// @nodoc
class __$CoverageResultCopyWithImpl<$Res>
    implements _$CoverageResultCopyWith<$Res> {
  __$CoverageResultCopyWithImpl(this._self, this._then);

  final _CoverageResult _self;
  final $Res Function(_CoverageResult) _then;

  /// Create a copy of CoverageResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? point = null,
    Object? breadth = null,
    Object? computedAt = null,
    Object? entries = null,
  }) {
    return _then(_CoverageResult(
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
      entries: null == entries
          ? _self._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<CoverageEntry>,
    ));
  }

  /// Create a copy of CoverageResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPointCopyWith<$Res> get point {
    return $SearchPointCopyWith<$Res>(_self.point, (value) {
      return _then(_self.copyWith(point: value));
    });
  }
}

/// @nodoc
mixin _$ResolvedCoverageEntry {
  Repeater get repeater;
  CoverageEntry get verdict;

  /// Create a copy of ResolvedCoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResolvedCoverageEntryCopyWith<ResolvedCoverageEntry> get copyWith =>
      _$ResolvedCoverageEntryCopyWithImpl<ResolvedCoverageEntry>(
          this as ResolvedCoverageEntry, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResolvedCoverageEntry &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.verdict, verdict) || other.verdict == verdict));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repeater, verdict);

  @override
  String toString() {
    return 'ResolvedCoverageEntry(repeater: $repeater, verdict: $verdict)';
  }
}

/// @nodoc
abstract mixin class $ResolvedCoverageEntryCopyWith<$Res> {
  factory $ResolvedCoverageEntryCopyWith(ResolvedCoverageEntry value,
          $Res Function(ResolvedCoverageEntry) _then) =
      _$ResolvedCoverageEntryCopyWithImpl;
  @useResult
  $Res call({Repeater repeater, CoverageEntry verdict});

  $RepeaterCopyWith<$Res> get repeater;
  $CoverageEntryCopyWith<$Res> get verdict;
}

/// @nodoc
class _$ResolvedCoverageEntryCopyWithImpl<$Res>
    implements $ResolvedCoverageEntryCopyWith<$Res> {
  _$ResolvedCoverageEntryCopyWithImpl(this._self, this._then);

  final ResolvedCoverageEntry _self;
  final $Res Function(ResolvedCoverageEntry) _then;

  /// Create a copy of ResolvedCoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeater = null,
    Object? verdict = null,
  }) {
    return _then(_self.copyWith(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      verdict: null == verdict
          ? _self.verdict
          : verdict // ignore: cast_nullable_to_non_nullable
              as CoverageEntry,
    ));
  }

  /// Create a copy of ResolvedCoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of ResolvedCoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoverageEntryCopyWith<$Res> get verdict {
    return $CoverageEntryCopyWith<$Res>(_self.verdict, (value) {
      return _then(_self.copyWith(verdict: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ResolvedCoverageEntry].
extension ResolvedCoverageEntryPatterns on ResolvedCoverageEntry {
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
    TResult Function(_ResolvedCoverageEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResolvedCoverageEntry() when $default != null:
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
    TResult Function(_ResolvedCoverageEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResolvedCoverageEntry():
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
    TResult? Function(_ResolvedCoverageEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResolvedCoverageEntry() when $default != null:
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
    TResult Function(Repeater repeater, CoverageEntry verdict)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResolvedCoverageEntry() when $default != null:
        return $default(_that.repeater, _that.verdict);
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
    TResult Function(Repeater repeater, CoverageEntry verdict) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResolvedCoverageEntry():
        return $default(_that.repeater, _that.verdict);
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
    TResult? Function(Repeater repeater, CoverageEntry verdict)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResolvedCoverageEntry() when $default != null:
        return $default(_that.repeater, _that.verdict);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ResolvedCoverageEntry extends ResolvedCoverageEntry {
  const _ResolvedCoverageEntry({required this.repeater, required this.verdict})
      : super._();

  @override
  final Repeater repeater;
  @override
  final CoverageEntry verdict;

  /// Create a copy of ResolvedCoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResolvedCoverageEntryCopyWith<_ResolvedCoverageEntry> get copyWith =>
      __$ResolvedCoverageEntryCopyWithImpl<_ResolvedCoverageEntry>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResolvedCoverageEntry &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.verdict, verdict) || other.verdict == verdict));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repeater, verdict);

  @override
  String toString() {
    return 'ResolvedCoverageEntry(repeater: $repeater, verdict: $verdict)';
  }
}

/// @nodoc
abstract mixin class _$ResolvedCoverageEntryCopyWith<$Res>
    implements $ResolvedCoverageEntryCopyWith<$Res> {
  factory _$ResolvedCoverageEntryCopyWith(_ResolvedCoverageEntry value,
          $Res Function(_ResolvedCoverageEntry) _then) =
      __$ResolvedCoverageEntryCopyWithImpl;
  @override
  @useResult
  $Res call({Repeater repeater, CoverageEntry verdict});

  @override
  $RepeaterCopyWith<$Res> get repeater;
  @override
  $CoverageEntryCopyWith<$Res> get verdict;
}

/// @nodoc
class __$ResolvedCoverageEntryCopyWithImpl<$Res>
    implements _$ResolvedCoverageEntryCopyWith<$Res> {
  __$ResolvedCoverageEntryCopyWithImpl(this._self, this._then);

  final _ResolvedCoverageEntry _self;
  final $Res Function(_ResolvedCoverageEntry) _then;

  /// Create a copy of ResolvedCoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeater = null,
    Object? verdict = null,
  }) {
    return _then(_ResolvedCoverageEntry(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      verdict: null == verdict
          ? _self.verdict
          : verdict // ignore: cast_nullable_to_non_nullable
              as CoverageEntry,
    ));
  }

  /// Create a copy of ResolvedCoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of ResolvedCoverageEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoverageEntryCopyWith<$Res> get verdict {
    return $CoverageEntryCopyWith<$Res>(_self.verdict, (value) {
      return _then(_self.copyWith(verdict: value));
    });
  }
}

/// @nodoc
mixin _$FilteredEntries {
  List<ResolvedCoverageEntry> get visible;
  int get hiddenReachableCount;

  /// Create a copy of FilteredEntries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilteredEntriesCopyWith<FilteredEntries> get copyWith =>
      _$FilteredEntriesCopyWithImpl<FilteredEntries>(
          this as FilteredEntries, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilteredEntries &&
            const DeepCollectionEquality().equals(other.visible, visible) &&
            (identical(other.hiddenReachableCount, hiddenReachableCount) ||
                other.hiddenReachableCount == hiddenReachableCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(visible), hiddenReachableCount);

  @override
  String toString() {
    return 'FilteredEntries(visible: $visible, hiddenReachableCount: $hiddenReachableCount)';
  }
}

/// @nodoc
abstract mixin class $FilteredEntriesCopyWith<$Res> {
  factory $FilteredEntriesCopyWith(
          FilteredEntries value, $Res Function(FilteredEntries) _then) =
      _$FilteredEntriesCopyWithImpl;
  @useResult
  $Res call({List<ResolvedCoverageEntry> visible, int hiddenReachableCount});
}

/// @nodoc
class _$FilteredEntriesCopyWithImpl<$Res>
    implements $FilteredEntriesCopyWith<$Res> {
  _$FilteredEntriesCopyWithImpl(this._self, this._then);

  final FilteredEntries _self;
  final $Res Function(FilteredEntries) _then;

  /// Create a copy of FilteredEntries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visible = null,
    Object? hiddenReachableCount = null,
  }) {
    return _then(_self.copyWith(
      visible: null == visible
          ? _self.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as List<ResolvedCoverageEntry>,
      hiddenReachableCount: null == hiddenReachableCount
          ? _self.hiddenReachableCount
          : hiddenReachableCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FilteredEntries].
extension FilteredEntriesPatterns on FilteredEntries {
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
    TResult Function(_FilteredEntries value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FilteredEntries() when $default != null:
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
    TResult Function(_FilteredEntries value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilteredEntries():
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
    TResult? Function(_FilteredEntries value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilteredEntries() when $default != null:
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
            List<ResolvedCoverageEntry> visible, int hiddenReachableCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FilteredEntries() when $default != null:
        return $default(_that.visible, _that.hiddenReachableCount);
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
            List<ResolvedCoverageEntry> visible, int hiddenReachableCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilteredEntries():
        return $default(_that.visible, _that.hiddenReachableCount);
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
            List<ResolvedCoverageEntry> visible, int hiddenReachableCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilteredEntries() when $default != null:
        return $default(_that.visible, _that.hiddenReachableCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FilteredEntries implements FilteredEntries {
  const _FilteredEntries(
      {required final List<ResolvedCoverageEntry> visible,
      required this.hiddenReachableCount})
      : _visible = visible;

  final List<ResolvedCoverageEntry> _visible;
  @override
  List<ResolvedCoverageEntry> get visible {
    if (_visible is EqualUnmodifiableListView) return _visible;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visible);
  }

  @override
  final int hiddenReachableCount;

  /// Create a copy of FilteredEntries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilteredEntriesCopyWith<_FilteredEntries> get copyWith =>
      __$FilteredEntriesCopyWithImpl<_FilteredEntries>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilteredEntries &&
            const DeepCollectionEquality().equals(other._visible, _visible) &&
            (identical(other.hiddenReachableCount, hiddenReachableCount) ||
                other.hiddenReachableCount == hiddenReachableCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_visible), hiddenReachableCount);

  @override
  String toString() {
    return 'FilteredEntries(visible: $visible, hiddenReachableCount: $hiddenReachableCount)';
  }
}

/// @nodoc
abstract mixin class _$FilteredEntriesCopyWith<$Res>
    implements $FilteredEntriesCopyWith<$Res> {
  factory _$FilteredEntriesCopyWith(
          _FilteredEntries value, $Res Function(_FilteredEntries) _then) =
      __$FilteredEntriesCopyWithImpl;
  @override
  @useResult
  $Res call({List<ResolvedCoverageEntry> visible, int hiddenReachableCount});
}

/// @nodoc
class __$FilteredEntriesCopyWithImpl<$Res>
    implements _$FilteredEntriesCopyWith<$Res> {
  __$FilteredEntriesCopyWithImpl(this._self, this._then);

  final _FilteredEntries _self;
  final $Res Function(_FilteredEntries) _then;

  /// Create a copy of FilteredEntries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? visible = null,
    Object? hiddenReachableCount = null,
  }) {
    return _then(_FilteredEntries(
      visible: null == visible
          ? _self._visible
          : visible // ignore: cast_nullable_to_non_nullable
              as List<ResolvedCoverageEntry>,
      hiddenReachableCount: null == hiddenReachableCount
          ? _self.hiddenReachableCount
          : hiddenReachableCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$CoverageEvaluation {
  SearchPoint get point;
  SearchBreadth get breadth;
  DateTime get computedAt;
  List<ResolvedCoverageEntry> get entries;

  /// Create a copy of CoverageEvaluation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoverageEvaluationCopyWith<CoverageEvaluation> get copyWith =>
      _$CoverageEvaluationCopyWithImpl<CoverageEvaluation>(
          this as CoverageEvaluation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoverageEvaluation &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.breadth, breadth) || other.breadth == breadth) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt) &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, point, breadth, computedAt,
      const DeepCollectionEquality().hash(entries));

  @override
  String toString() {
    return 'CoverageEvaluation(point: $point, breadth: $breadth, computedAt: $computedAt, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class $CoverageEvaluationCopyWith<$Res> {
  factory $CoverageEvaluationCopyWith(
          CoverageEvaluation value, $Res Function(CoverageEvaluation) _then) =
      _$CoverageEvaluationCopyWithImpl;
  @useResult
  $Res call(
      {SearchPoint point,
      SearchBreadth breadth,
      DateTime computedAt,
      List<ResolvedCoverageEntry> entries});

  $SearchPointCopyWith<$Res> get point;
}

/// @nodoc
class _$CoverageEvaluationCopyWithImpl<$Res>
    implements $CoverageEvaluationCopyWith<$Res> {
  _$CoverageEvaluationCopyWithImpl(this._self, this._then);

  final CoverageEvaluation _self;
  final $Res Function(CoverageEvaluation) _then;

  /// Create a copy of CoverageEvaluation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = null,
    Object? breadth = null,
    Object? computedAt = null,
    Object? entries = null,
  }) {
    return _then(_self.copyWith(
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
      entries: null == entries
          ? _self.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<ResolvedCoverageEntry>,
    ));
  }

  /// Create a copy of CoverageEvaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPointCopyWith<$Res> get point {
    return $SearchPointCopyWith<$Res>(_self.point, (value) {
      return _then(_self.copyWith(point: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CoverageEvaluation].
extension CoverageEvaluationPatterns on CoverageEvaluation {
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
    TResult Function(_CoverageEvaluation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageEvaluation() when $default != null:
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
    TResult Function(_CoverageEvaluation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageEvaluation():
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
    TResult? Function(_CoverageEvaluation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageEvaluation() when $default != null:
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
    TResult Function(SearchPoint point, SearchBreadth breadth,
            DateTime computedAt, List<ResolvedCoverageEntry> entries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoverageEvaluation() when $default != null:
        return $default(
            _that.point, _that.breadth, _that.computedAt, _that.entries);
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
    TResult Function(SearchPoint point, SearchBreadth breadth,
            DateTime computedAt, List<ResolvedCoverageEntry> entries)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageEvaluation():
        return $default(
            _that.point, _that.breadth, _that.computedAt, _that.entries);
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
    TResult? Function(SearchPoint point, SearchBreadth breadth,
            DateTime computedAt, List<ResolvedCoverageEntry> entries)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoverageEvaluation() when $default != null:
        return $default(
            _that.point, _that.breadth, _that.computedAt, _that.entries);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CoverageEvaluation extends CoverageEvaluation {
  const _CoverageEvaluation(
      {required this.point,
      required this.breadth,
      required this.computedAt,
      final List<ResolvedCoverageEntry> entries =
          const <ResolvedCoverageEntry>[]})
      : _entries = entries,
        super._();

  @override
  final SearchPoint point;
  @override
  final SearchBreadth breadth;
  @override
  final DateTime computedAt;
  final List<ResolvedCoverageEntry> _entries;
  @override
  @JsonKey()
  List<ResolvedCoverageEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  /// Create a copy of CoverageEvaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoverageEvaluationCopyWith<_CoverageEvaluation> get copyWith =>
      __$CoverageEvaluationCopyWithImpl<_CoverageEvaluation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoverageEvaluation &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.breadth, breadth) || other.breadth == breadth) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, point, breadth, computedAt,
      const DeepCollectionEquality().hash(_entries));

  @override
  String toString() {
    return 'CoverageEvaluation(point: $point, breadth: $breadth, computedAt: $computedAt, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class _$CoverageEvaluationCopyWith<$Res>
    implements $CoverageEvaluationCopyWith<$Res> {
  factory _$CoverageEvaluationCopyWith(
          _CoverageEvaluation value, $Res Function(_CoverageEvaluation) _then) =
      __$CoverageEvaluationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SearchPoint point,
      SearchBreadth breadth,
      DateTime computedAt,
      List<ResolvedCoverageEntry> entries});

  @override
  $SearchPointCopyWith<$Res> get point;
}

/// @nodoc
class __$CoverageEvaluationCopyWithImpl<$Res>
    implements _$CoverageEvaluationCopyWith<$Res> {
  __$CoverageEvaluationCopyWithImpl(this._self, this._then);

  final _CoverageEvaluation _self;
  final $Res Function(_CoverageEvaluation) _then;

  /// Create a copy of CoverageEvaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? point = null,
    Object? breadth = null,
    Object? computedAt = null,
    Object? entries = null,
  }) {
    return _then(_CoverageEvaluation(
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
      entries: null == entries
          ? _self._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<ResolvedCoverageEntry>,
    ));
  }

  /// Create a copy of CoverageEvaluation
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
