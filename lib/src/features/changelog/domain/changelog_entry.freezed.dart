// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'changelog_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangelogChange {
  ChangeCategory get category;
  String get description;

  /// Create a copy of ChangelogChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangelogChangeCopyWith<ChangelogChange> get copyWith =>
      _$ChangelogChangeCopyWithImpl<ChangelogChange>(
          this as ChangelogChange, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangelogChange &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, description);

  @override
  String toString() {
    return 'ChangelogChange(category: $category, description: $description)';
  }
}

/// @nodoc
abstract mixin class $ChangelogChangeCopyWith<$Res> {
  factory $ChangelogChangeCopyWith(
          ChangelogChange value, $Res Function(ChangelogChange) _then) =
      _$ChangelogChangeCopyWithImpl;
  @useResult
  $Res call({ChangeCategory category, String description});
}

/// @nodoc
class _$ChangelogChangeCopyWithImpl<$Res>
    implements $ChangelogChangeCopyWith<$Res> {
  _$ChangelogChangeCopyWithImpl(this._self, this._then);

  final ChangelogChange _self;
  final $Res Function(ChangelogChange) _then;

  /// Create a copy of ChangelogChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ChangeCategory,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChangelogChange].
extension ChangelogChangePatterns on ChangelogChange {
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
    TResult Function(_ChangelogChange value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangelogChange() when $default != null:
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
    TResult Function(_ChangelogChange value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangelogChange():
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
    TResult? Function(_ChangelogChange value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangelogChange() when $default != null:
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
    TResult Function(ChangeCategory category, String description)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangelogChange() when $default != null:
        return $default(_that.category, _that.description);
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
    TResult Function(ChangeCategory category, String description) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangelogChange():
        return $default(_that.category, _that.description);
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
    TResult? Function(ChangeCategory category, String description)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangelogChange() when $default != null:
        return $default(_that.category, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChangelogChange implements ChangelogChange {
  const _ChangelogChange({required this.category, required this.description});

  @override
  final ChangeCategory category;
  @override
  final String description;

  /// Create a copy of ChangelogChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangelogChangeCopyWith<_ChangelogChange> get copyWith =>
      __$ChangelogChangeCopyWithImpl<_ChangelogChange>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangelogChange &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, description);

  @override
  String toString() {
    return 'ChangelogChange(category: $category, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$ChangelogChangeCopyWith<$Res>
    implements $ChangelogChangeCopyWith<$Res> {
  factory _$ChangelogChangeCopyWith(
          _ChangelogChange value, $Res Function(_ChangelogChange) _then) =
      __$ChangelogChangeCopyWithImpl;
  @override
  @useResult
  $Res call({ChangeCategory category, String description});
}

/// @nodoc
class __$ChangelogChangeCopyWithImpl<$Res>
    implements _$ChangelogChangeCopyWith<$Res> {
  __$ChangelogChangeCopyWithImpl(this._self, this._then);

  final _ChangelogChange _self;
  final $Res Function(_ChangelogChange) _then;

  /// Create a copy of ChangelogChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
    Object? description = null,
  }) {
    return _then(_ChangelogChange(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ChangeCategory,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ChangelogEntry {
  String get version;
  List<ChangelogChange> get changes;

  /// Create a copy of ChangelogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangelogEntryCopyWith<ChangelogEntry> get copyWith =>
      _$ChangelogEntryCopyWithImpl<ChangelogEntry>(
          this as ChangelogEntry, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangelogEntry &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other.changes, changes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, version, const DeepCollectionEquality().hash(changes));

  @override
  String toString() {
    return 'ChangelogEntry(version: $version, changes: $changes)';
  }
}

/// @nodoc
abstract mixin class $ChangelogEntryCopyWith<$Res> {
  factory $ChangelogEntryCopyWith(
          ChangelogEntry value, $Res Function(ChangelogEntry) _then) =
      _$ChangelogEntryCopyWithImpl;
  @useResult
  $Res call({String version, List<ChangelogChange> changes});
}

/// @nodoc
class _$ChangelogEntryCopyWithImpl<$Res>
    implements $ChangelogEntryCopyWith<$Res> {
  _$ChangelogEntryCopyWithImpl(this._self, this._then);

  final ChangelogEntry _self;
  final $Res Function(ChangelogEntry) _then;

  /// Create a copy of ChangelogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? changes = null,
  }) {
    return _then(_self.copyWith(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      changes: null == changes
          ? _self.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<ChangelogChange>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChangelogEntry].
extension ChangelogEntryPatterns on ChangelogEntry {
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
    TResult Function(_ChangelogEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangelogEntry() when $default != null:
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
    TResult Function(_ChangelogEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangelogEntry():
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
    TResult? Function(_ChangelogEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangelogEntry() when $default != null:
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
    TResult Function(String version, List<ChangelogChange> changes)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangelogEntry() when $default != null:
        return $default(_that.version, _that.changes);
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
    TResult Function(String version, List<ChangelogChange> changes) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangelogEntry():
        return $default(_that.version, _that.changes);
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
    TResult? Function(String version, List<ChangelogChange> changes)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangelogEntry() when $default != null:
        return $default(_that.version, _that.changes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChangelogEntry implements ChangelogEntry {
  const _ChangelogEntry(
      {required this.version, required final List<ChangelogChange> changes})
      : _changes = changes;

  @override
  final String version;
  final List<ChangelogChange> _changes;
  @override
  List<ChangelogChange> get changes {
    if (_changes is EqualUnmodifiableListView) return _changes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_changes);
  }

  /// Create a copy of ChangelogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangelogEntryCopyWith<_ChangelogEntry> get copyWith =>
      __$ChangelogEntryCopyWithImpl<_ChangelogEntry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangelogEntry &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._changes, _changes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, version, const DeepCollectionEquality().hash(_changes));

  @override
  String toString() {
    return 'ChangelogEntry(version: $version, changes: $changes)';
  }
}

/// @nodoc
abstract mixin class _$ChangelogEntryCopyWith<$Res>
    implements $ChangelogEntryCopyWith<$Res> {
  factory _$ChangelogEntryCopyWith(
          _ChangelogEntry value, $Res Function(_ChangelogEntry) _then) =
      __$ChangelogEntryCopyWithImpl;
  @override
  @useResult
  $Res call({String version, List<ChangelogChange> changes});
}

/// @nodoc
class __$ChangelogEntryCopyWithImpl<$Res>
    implements _$ChangelogEntryCopyWith<$Res> {
  __$ChangelogEntryCopyWithImpl(this._self, this._then);

  final _ChangelogEntry _self;
  final $Res Function(_ChangelogEntry) _then;

  /// Create a copy of ChangelogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
    Object? changes = null,
  }) {
    return _then(_ChangelogEntry(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      changes: null == changes
          ? _self._changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<ChangelogChange>,
    ));
  }
}

// dart format on
