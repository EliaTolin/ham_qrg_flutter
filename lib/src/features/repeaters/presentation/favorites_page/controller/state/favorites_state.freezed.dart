// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoritesState {
  List<Repeater> get favorites;
  Set<AccessMode> get selectedModes;
  String get searchQuery;

  /// Create a copy of FavoritesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoritesStateCopyWith<FavoritesState> get copyWith =>
      _$FavoritesStateCopyWithImpl<FavoritesState>(
          this as FavoritesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoritesState &&
            const DeepCollectionEquality().equals(other.favorites, favorites) &&
            const DeepCollectionEquality()
                .equals(other.selectedModes, selectedModes) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(favorites),
      const DeepCollectionEquality().hash(selectedModes),
      searchQuery);

  @override
  String toString() {
    return 'FavoritesState(favorites: $favorites, selectedModes: $selectedModes, searchQuery: $searchQuery)';
  }
}

/// @nodoc
abstract mixin class $FavoritesStateCopyWith<$Res> {
  factory $FavoritesStateCopyWith(
          FavoritesState value, $Res Function(FavoritesState) _then) =
      _$FavoritesStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Repeater> favorites,
      Set<AccessMode> selectedModes,
      String searchQuery});
}

/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._self, this._then);

  final FavoritesState _self;
  final $Res Function(FavoritesState) _then;

  /// Create a copy of FavoritesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorites = null,
    Object? selectedModes = null,
    Object? searchQuery = null,
  }) {
    return _then(_self.copyWith(
      favorites: null == favorites
          ? _self.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      selectedModes: null == selectedModes
          ? _self.selectedModes
          : selectedModes // ignore: cast_nullable_to_non_nullable
              as Set<AccessMode>,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [FavoritesState].
extension FavoritesStatePatterns on FavoritesState {
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
    TResult Function(_FavoritesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoritesState() when $default != null:
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
    TResult Function(_FavoritesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoritesState():
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
    TResult? Function(_FavoritesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoritesState() when $default != null:
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
    TResult Function(List<Repeater> favorites, Set<AccessMode> selectedModes,
            String searchQuery)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoritesState() when $default != null:
        return $default(
            _that.favorites, _that.selectedModes, _that.searchQuery);
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
    TResult Function(List<Repeater> favorites, Set<AccessMode> selectedModes,
            String searchQuery)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoritesState():
        return $default(
            _that.favorites, _that.selectedModes, _that.searchQuery);
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
    TResult? Function(List<Repeater> favorites, Set<AccessMode> selectedModes,
            String searchQuery)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoritesState() when $default != null:
        return $default(
            _that.favorites, _that.selectedModes, _that.searchQuery);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FavoritesState implements FavoritesState {
  const _FavoritesState(
      {required final List<Repeater> favorites,
      required final Set<AccessMode> selectedModes,
      required this.searchQuery})
      : _favorites = favorites,
        _selectedModes = selectedModes;

  final List<Repeater> _favorites;
  @override
  List<Repeater> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  final Set<AccessMode> _selectedModes;
  @override
  Set<AccessMode> get selectedModes {
    if (_selectedModes is EqualUnmodifiableSetView) return _selectedModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedModes);
  }

  @override
  final String searchQuery;

  /// Create a copy of FavoritesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoritesStateCopyWith<_FavoritesState> get copyWith =>
      __$FavoritesStateCopyWithImpl<_FavoritesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoritesState &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            const DeepCollectionEquality()
                .equals(other._selectedModes, _selectedModes) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favorites),
      const DeepCollectionEquality().hash(_selectedModes),
      searchQuery);

  @override
  String toString() {
    return 'FavoritesState(favorites: $favorites, selectedModes: $selectedModes, searchQuery: $searchQuery)';
  }
}

/// @nodoc
abstract mixin class _$FavoritesStateCopyWith<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  factory _$FavoritesStateCopyWith(
          _FavoritesState value, $Res Function(_FavoritesState) _then) =
      __$FavoritesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Repeater> favorites,
      Set<AccessMode> selectedModes,
      String searchQuery});
}

/// @nodoc
class __$FavoritesStateCopyWithImpl<$Res>
    implements _$FavoritesStateCopyWith<$Res> {
  __$FavoritesStateCopyWithImpl(this._self, this._then);

  final _FavoritesState _self;
  final $Res Function(_FavoritesState) _then;

  /// Create a copy of FavoritesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? favorites = null,
    Object? selectedModes = null,
    Object? searchQuery = null,
  }) {
    return _then(_FavoritesState(
      favorites: null == favorites
          ? _self._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      selectedModes: null == selectedModes
          ? _self._selectedModes
          : selectedModes // ignore: cast_nullable_to_non_nullable
              as Set<AccessMode>,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
