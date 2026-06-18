// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reachable_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReachableEntry {
  Repeater get repeater;
  double get dbm;
  double get distanceKm;
  bool get reachable;

  /// Create a copy of ReachableEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReachableEntryCopyWith<ReachableEntry> get copyWith =>
      _$ReachableEntryCopyWithImpl<ReachableEntry>(
          this as ReachableEntry, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReachableEntry &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, repeater, dbm, distanceKm, reachable);

  @override
  String toString() {
    return 'ReachableEntry(repeater: $repeater, dbm: $dbm, distanceKm: $distanceKm, reachable: $reachable)';
  }
}

/// @nodoc
abstract mixin class $ReachableEntryCopyWith<$Res> {
  factory $ReachableEntryCopyWith(
          ReachableEntry value, $Res Function(ReachableEntry) _then) =
      _$ReachableEntryCopyWithImpl;
  @useResult
  $Res call({Repeater repeater, double dbm, double distanceKm, bool reachable});

  $RepeaterCopyWith<$Res> get repeater;
}

/// @nodoc
class _$ReachableEntryCopyWithImpl<$Res>
    implements $ReachableEntryCopyWith<$Res> {
  _$ReachableEntryCopyWithImpl(this._self, this._then);

  final ReachableEntry _self;
  final $Res Function(ReachableEntry) _then;

  /// Create a copy of ReachableEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeater = null,
    Object? dbm = null,
    Object? distanceKm = null,
    Object? reachable = null,
  }) {
    return _then(_self.copyWith(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
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

  /// Create a copy of ReachableEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReachableEntry].
extension ReachableEntryPatterns on ReachableEntry {
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
    TResult Function(_ReachableEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReachableEntry() when $default != null:
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
    TResult Function(_ReachableEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableEntry():
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
    TResult? Function(_ReachableEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableEntry() when $default != null:
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
            Repeater repeater, double dbm, double distanceKm, bool reachable)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReachableEntry() when $default != null:
        return $default(
            _that.repeater, _that.dbm, _that.distanceKm, _that.reachable);
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
            Repeater repeater, double dbm, double distanceKm, bool reachable)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableEntry():
        return $default(
            _that.repeater, _that.dbm, _that.distanceKm, _that.reachable);
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
            Repeater repeater, double dbm, double distanceKm, bool reachable)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableEntry() when $default != null:
        return $default(
            _that.repeater, _that.dbm, _that.distanceKm, _that.reachable);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReachableEntry implements ReachableEntry {
  const _ReachableEntry(
      {required this.repeater,
      required this.dbm,
      required this.distanceKm,
      required this.reachable});

  @override
  final Repeater repeater;
  @override
  final double dbm;
  @override
  final double distanceKm;
  @override
  final bool reachable;

  /// Create a copy of ReachableEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReachableEntryCopyWith<_ReachableEntry> get copyWith =>
      __$ReachableEntryCopyWithImpl<_ReachableEntry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReachableEntry &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, repeater, dbm, distanceKm, reachable);

  @override
  String toString() {
    return 'ReachableEntry(repeater: $repeater, dbm: $dbm, distanceKm: $distanceKm, reachable: $reachable)';
  }
}

/// @nodoc
abstract mixin class _$ReachableEntryCopyWith<$Res>
    implements $ReachableEntryCopyWith<$Res> {
  factory _$ReachableEntryCopyWith(
          _ReachableEntry value, $Res Function(_ReachableEntry) _then) =
      __$ReachableEntryCopyWithImpl;
  @override
  @useResult
  $Res call({Repeater repeater, double dbm, double distanceKm, bool reachable});

  @override
  $RepeaterCopyWith<$Res> get repeater;
}

/// @nodoc
class __$ReachableEntryCopyWithImpl<$Res>
    implements _$ReachableEntryCopyWith<$Res> {
  __$ReachableEntryCopyWithImpl(this._self, this._then);

  final _ReachableEntry _self;
  final $Res Function(_ReachableEntry) _then;

  /// Create a copy of ReachableEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeater = null,
    Object? dbm = null,
    Object? distanceKm = null,
    Object? reachable = null,
  }) {
    return _then(_ReachableEntry(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
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

  /// Create a copy of ReachableEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }
}

/// @nodoc
mixin _$ReachableSummary {
  int get reachableCount;
  List<ReachableEntry> get entries;

  /// Create a copy of ReachableSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReachableSummaryCopyWith<ReachableSummary> get copyWith =>
      _$ReachableSummaryCopyWithImpl<ReachableSummary>(
          this as ReachableSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReachableSummary &&
            (identical(other.reachableCount, reachableCount) ||
                other.reachableCount == reachableCount) &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reachableCount,
      const DeepCollectionEquality().hash(entries));

  @override
  String toString() {
    return 'ReachableSummary(reachableCount: $reachableCount, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class $ReachableSummaryCopyWith<$Res> {
  factory $ReachableSummaryCopyWith(
          ReachableSummary value, $Res Function(ReachableSummary) _then) =
      _$ReachableSummaryCopyWithImpl;
  @useResult
  $Res call({int reachableCount, List<ReachableEntry> entries});
}

/// @nodoc
class _$ReachableSummaryCopyWithImpl<$Res>
    implements $ReachableSummaryCopyWith<$Res> {
  _$ReachableSummaryCopyWithImpl(this._self, this._then);

  final ReachableSummary _self;
  final $Res Function(ReachableSummary) _then;

  /// Create a copy of ReachableSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reachableCount = null,
    Object? entries = null,
  }) {
    return _then(_self.copyWith(
      reachableCount: null == reachableCount
          ? _self.reachableCount
          : reachableCount // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _self.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<ReachableEntry>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReachableSummary].
extension ReachableSummaryPatterns on ReachableSummary {
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
    TResult Function(_ReachableSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReachableSummary() when $default != null:
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
    TResult Function(_ReachableSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableSummary():
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
    TResult? Function(_ReachableSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableSummary() when $default != null:
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
    TResult Function(int reachableCount, List<ReachableEntry> entries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReachableSummary() when $default != null:
        return $default(_that.reachableCount, _that.entries);
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
    TResult Function(int reachableCount, List<ReachableEntry> entries) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableSummary():
        return $default(_that.reachableCount, _that.entries);
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
    TResult? Function(int reachableCount, List<ReachableEntry> entries)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableSummary() when $default != null:
        return $default(_that.reachableCount, _that.entries);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReachableSummary implements ReachableSummary {
  const _ReachableSummary(
      {required this.reachableCount,
      final List<ReachableEntry> entries = const []})
      : _entries = entries;

  @override
  final int reachableCount;
  final List<ReachableEntry> _entries;
  @override
  @JsonKey()
  List<ReachableEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  /// Create a copy of ReachableSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReachableSummaryCopyWith<_ReachableSummary> get copyWith =>
      __$ReachableSummaryCopyWithImpl<_ReachableSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReachableSummary &&
            (identical(other.reachableCount, reachableCount) ||
                other.reachableCount == reachableCount) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reachableCount,
      const DeepCollectionEquality().hash(_entries));

  @override
  String toString() {
    return 'ReachableSummary(reachableCount: $reachableCount, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class _$ReachableSummaryCopyWith<$Res>
    implements $ReachableSummaryCopyWith<$Res> {
  factory _$ReachableSummaryCopyWith(
          _ReachableSummary value, $Res Function(_ReachableSummary) _then) =
      __$ReachableSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({int reachableCount, List<ReachableEntry> entries});
}

/// @nodoc
class __$ReachableSummaryCopyWithImpl<$Res>
    implements _$ReachableSummaryCopyWith<$Res> {
  __$ReachableSummaryCopyWithImpl(this._self, this._then);

  final _ReachableSummary _self;
  final $Res Function(_ReachableSummary) _then;

  /// Create a copy of ReachableSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reachableCount = null,
    Object? entries = null,
  }) {
    return _then(_ReachableSummary(
      reachableCount: null == reachableCount
          ? _self.reachableCount
          : reachableCount // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _self._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<ReachableEntry>,
    ));
  }
}

/// @nodoc
mixin _$LinkProfilePoint {
  double get distanceKm;
  double get groundM;

  /// Create a copy of LinkProfilePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LinkProfilePointCopyWith<LinkProfilePoint> get copyWith =>
      _$LinkProfilePointCopyWithImpl<LinkProfilePoint>(
          this as LinkProfilePoint, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinkProfilePoint &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.groundM, groundM) || other.groundM == groundM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, distanceKm, groundM);

  @override
  String toString() {
    return 'LinkProfilePoint(distanceKm: $distanceKm, groundM: $groundM)';
  }
}

/// @nodoc
abstract mixin class $LinkProfilePointCopyWith<$Res> {
  factory $LinkProfilePointCopyWith(
          LinkProfilePoint value, $Res Function(LinkProfilePoint) _then) =
      _$LinkProfilePointCopyWithImpl;
  @useResult
  $Res call({double distanceKm, double groundM});
}

/// @nodoc
class _$LinkProfilePointCopyWithImpl<$Res>
    implements $LinkProfilePointCopyWith<$Res> {
  _$LinkProfilePointCopyWithImpl(this._self, this._then);

  final LinkProfilePoint _self;
  final $Res Function(LinkProfilePoint) _then;

  /// Create a copy of LinkProfilePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distanceKm = null,
    Object? groundM = null,
  }) {
    return _then(_self.copyWith(
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      groundM: null == groundM
          ? _self.groundM
          : groundM // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [LinkProfilePoint].
extension LinkProfilePointPatterns on LinkProfilePoint {
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
    TResult Function(_LinkProfilePoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePoint() when $default != null:
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
    TResult Function(_LinkProfilePoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePoint():
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
    TResult? Function(_LinkProfilePoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePoint() when $default != null:
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
    TResult Function(double distanceKm, double groundM)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePoint() when $default != null:
        return $default(_that.distanceKm, _that.groundM);
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
    TResult Function(double distanceKm, double groundM) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePoint():
        return $default(_that.distanceKm, _that.groundM);
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
    TResult? Function(double distanceKm, double groundM)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePoint() when $default != null:
        return $default(_that.distanceKm, _that.groundM);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LinkProfilePoint implements LinkProfilePoint {
  const _LinkProfilePoint({required this.distanceKm, required this.groundM});

  @override
  final double distanceKm;
  @override
  final double groundM;

  /// Create a copy of LinkProfilePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LinkProfilePointCopyWith<_LinkProfilePoint> get copyWith =>
      __$LinkProfilePointCopyWithImpl<_LinkProfilePoint>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LinkProfilePoint &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.groundM, groundM) || other.groundM == groundM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, distanceKm, groundM);

  @override
  String toString() {
    return 'LinkProfilePoint(distanceKm: $distanceKm, groundM: $groundM)';
  }
}

/// @nodoc
abstract mixin class _$LinkProfilePointCopyWith<$Res>
    implements $LinkProfilePointCopyWith<$Res> {
  factory _$LinkProfilePointCopyWith(
          _LinkProfilePoint value, $Res Function(_LinkProfilePoint) _then) =
      __$LinkProfilePointCopyWithImpl;
  @override
  @useResult
  $Res call({double distanceKm, double groundM});
}

/// @nodoc
class __$LinkProfilePointCopyWithImpl<$Res>
    implements _$LinkProfilePointCopyWith<$Res> {
  __$LinkProfilePointCopyWithImpl(this._self, this._then);

  final _LinkProfilePoint _self;
  final $Res Function(_LinkProfilePoint) _then;

  /// Create a copy of LinkProfilePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? distanceKm = null,
    Object? groundM = null,
  }) {
    return _then(_LinkProfilePoint(
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      groundM: null == groundM
          ? _self.groundM
          : groundM // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$LinkProfile {
  double get dbm;
  double get lossDb;
  double get distanceKm;
  double get azimuthDeg;
  bool get reachable;
  List<LinkProfilePoint> get points;

  /// Create a copy of LinkProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LinkProfileCopyWith<LinkProfile> get copyWith =>
      _$LinkProfileCopyWithImpl<LinkProfile>(this as LinkProfile, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinkProfile &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.lossDb, lossDb) || other.lossDb == lossDb) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.azimuthDeg, azimuthDeg) ||
                other.azimuthDeg == azimuthDeg) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable) &&
            const DeepCollectionEquality().equals(other.points, points));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dbm, lossDb, distanceKm,
      azimuthDeg, reachable, const DeepCollectionEquality().hash(points));

  @override
  String toString() {
    return 'LinkProfile(dbm: $dbm, lossDb: $lossDb, distanceKm: $distanceKm, azimuthDeg: $azimuthDeg, reachable: $reachable, points: $points)';
  }
}

/// @nodoc
abstract mixin class $LinkProfileCopyWith<$Res> {
  factory $LinkProfileCopyWith(
          LinkProfile value, $Res Function(LinkProfile) _then) =
      _$LinkProfileCopyWithImpl;
  @useResult
  $Res call(
      {double dbm,
      double lossDb,
      double distanceKm,
      double azimuthDeg,
      bool reachable,
      List<LinkProfilePoint> points});
}

/// @nodoc
class _$LinkProfileCopyWithImpl<$Res> implements $LinkProfileCopyWith<$Res> {
  _$LinkProfileCopyWithImpl(this._self, this._then);

  final LinkProfile _self;
  final $Res Function(LinkProfile) _then;

  /// Create a copy of LinkProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbm = null,
    Object? lossDb = null,
    Object? distanceKm = null,
    Object? azimuthDeg = null,
    Object? reachable = null,
    Object? points = null,
  }) {
    return _then(_self.copyWith(
      dbm: null == dbm
          ? _self.dbm
          : dbm // ignore: cast_nullable_to_non_nullable
              as double,
      lossDb: null == lossDb
          ? _self.lossDb
          : lossDb // ignore: cast_nullable_to_non_nullable
              as double,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      azimuthDeg: null == azimuthDeg
          ? _self.azimuthDeg
          : azimuthDeg // ignore: cast_nullable_to_non_nullable
              as double,
      reachable: null == reachable
          ? _self.reachable
          : reachable // ignore: cast_nullable_to_non_nullable
              as bool,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<LinkProfilePoint>,
    ));
  }
}

/// Adds pattern-matching-related methods to [LinkProfile].
extension LinkProfilePatterns on LinkProfile {
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
    TResult Function(_LinkProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LinkProfile() when $default != null:
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
    TResult Function(_LinkProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfile():
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
    TResult? Function(_LinkProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfile() when $default != null:
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
    TResult Function(double dbm, double lossDb, double distanceKm,
            double azimuthDeg, bool reachable, List<LinkProfilePoint> points)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LinkProfile() when $default != null:
        return $default(_that.dbm, _that.lossDb, _that.distanceKm,
            _that.azimuthDeg, _that.reachable, _that.points);
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
    TResult Function(double dbm, double lossDb, double distanceKm,
            double azimuthDeg, bool reachable, List<LinkProfilePoint> points)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfile():
        return $default(_that.dbm, _that.lossDb, _that.distanceKm,
            _that.azimuthDeg, _that.reachable, _that.points);
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
    TResult? Function(double dbm, double lossDb, double distanceKm,
            double azimuthDeg, bool reachable, List<LinkProfilePoint> points)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfile() when $default != null:
        return $default(_that.dbm, _that.lossDb, _that.distanceKm,
            _that.azimuthDeg, _that.reachable, _that.points);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LinkProfile implements LinkProfile {
  const _LinkProfile(
      {required this.dbm,
      required this.lossDb,
      required this.distanceKm,
      required this.azimuthDeg,
      required this.reachable,
      final List<LinkProfilePoint> points = const []})
      : _points = points;

  @override
  final double dbm;
  @override
  final double lossDb;
  @override
  final double distanceKm;
  @override
  final double azimuthDeg;
  @override
  final bool reachable;
  final List<LinkProfilePoint> _points;
  @override
  @JsonKey()
  List<LinkProfilePoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  /// Create a copy of LinkProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LinkProfileCopyWith<_LinkProfile> get copyWith =>
      __$LinkProfileCopyWithImpl<_LinkProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LinkProfile &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.lossDb, lossDb) || other.lossDb == lossDb) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.azimuthDeg, azimuthDeg) ||
                other.azimuthDeg == azimuthDeg) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable) &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dbm, lossDb, distanceKm,
      azimuthDeg, reachable, const DeepCollectionEquality().hash(_points));

  @override
  String toString() {
    return 'LinkProfile(dbm: $dbm, lossDb: $lossDb, distanceKm: $distanceKm, azimuthDeg: $azimuthDeg, reachable: $reachable, points: $points)';
  }
}

/// @nodoc
abstract mixin class _$LinkProfileCopyWith<$Res>
    implements $LinkProfileCopyWith<$Res> {
  factory _$LinkProfileCopyWith(
          _LinkProfile value, $Res Function(_LinkProfile) _then) =
      __$LinkProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double dbm,
      double lossDb,
      double distanceKm,
      double azimuthDeg,
      bool reachable,
      List<LinkProfilePoint> points});
}

/// @nodoc
class __$LinkProfileCopyWithImpl<$Res> implements _$LinkProfileCopyWith<$Res> {
  __$LinkProfileCopyWithImpl(this._self, this._then);

  final _LinkProfile _self;
  final $Res Function(_LinkProfile) _then;

  /// Create a copy of LinkProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dbm = null,
    Object? lossDb = null,
    Object? distanceKm = null,
    Object? azimuthDeg = null,
    Object? reachable = null,
    Object? points = null,
  }) {
    return _then(_LinkProfile(
      dbm: null == dbm
          ? _self.dbm
          : dbm // ignore: cast_nullable_to_non_nullable
              as double,
      lossDb: null == lossDb
          ? _self.lossDb
          : lossDb // ignore: cast_nullable_to_non_nullable
              as double,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      azimuthDeg: null == azimuthDeg
          ? _self.azimuthDeg
          : azimuthDeg // ignore: cast_nullable_to_non_nullable
              as double,
      reachable: null == reachable
          ? _self.reachable
          : reachable // ignore: cast_nullable_to_non_nullable
              as bool,
      points: null == points
          ? _self._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<LinkProfilePoint>,
    ));
  }
}

// dart format on
