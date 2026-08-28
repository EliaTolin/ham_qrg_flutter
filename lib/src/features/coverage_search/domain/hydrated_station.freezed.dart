// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hydrated_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HydratedStation {
  SavedStation get station;
  Map<String, CachedRepeater> get repeaters;

  /// Voci non risolte. Si mostrano come "dato non disponibile offline"
  /// senza far fallire l'intera pagina: una postazione con un buco resta
  /// utile, una postazione che non si apre no.
  Set<String> get missingIds;

  /// Create a copy of HydratedStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HydratedStationCopyWith<HydratedStation> get copyWith =>
      _$HydratedStationCopyWithImpl<HydratedStation>(
          this as HydratedStation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HydratedStation &&
            (identical(other.station, station) || other.station == station) &&
            const DeepCollectionEquality().equals(other.repeaters, repeaters) &&
            const DeepCollectionEquality()
                .equals(other.missingIds, missingIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      station,
      const DeepCollectionEquality().hash(repeaters),
      const DeepCollectionEquality().hash(missingIds));

  @override
  String toString() {
    return 'HydratedStation(station: $station, repeaters: $repeaters, missingIds: $missingIds)';
  }
}

/// @nodoc
abstract mixin class $HydratedStationCopyWith<$Res> {
  factory $HydratedStationCopyWith(
          HydratedStation value, $Res Function(HydratedStation) _then) =
      _$HydratedStationCopyWithImpl;
  @useResult
  $Res call(
      {SavedStation station,
      Map<String, CachedRepeater> repeaters,
      Set<String> missingIds});

  $SavedStationCopyWith<$Res> get station;
}

/// @nodoc
class _$HydratedStationCopyWithImpl<$Res>
    implements $HydratedStationCopyWith<$Res> {
  _$HydratedStationCopyWithImpl(this._self, this._then);

  final HydratedStation _self;
  final $Res Function(HydratedStation) _then;

  /// Create a copy of HydratedStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? station = null,
    Object? repeaters = null,
    Object? missingIds = null,
  }) {
    return _then(_self.copyWith(
      station: null == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as SavedStation,
      repeaters: null == repeaters
          ? _self.repeaters
          : repeaters // ignore: cast_nullable_to_non_nullable
              as Map<String, CachedRepeater>,
      missingIds: null == missingIds
          ? _self.missingIds
          : missingIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }

  /// Create a copy of HydratedStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavedStationCopyWith<$Res> get station {
    return $SavedStationCopyWith<$Res>(_self.station, (value) {
      return _then(_self.copyWith(station: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HydratedStation].
extension HydratedStationPatterns on HydratedStation {
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
    TResult Function(_HydratedStation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HydratedStation() when $default != null:
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
    TResult Function(_HydratedStation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HydratedStation():
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
    TResult? Function(_HydratedStation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HydratedStation() when $default != null:
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
    TResult Function(SavedStation station,
            Map<String, CachedRepeater> repeaters, Set<String> missingIds)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HydratedStation() when $default != null:
        return $default(_that.station, _that.repeaters, _that.missingIds);
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
    TResult Function(SavedStation station,
            Map<String, CachedRepeater> repeaters, Set<String> missingIds)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HydratedStation():
        return $default(_that.station, _that.repeaters, _that.missingIds);
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
    TResult? Function(SavedStation station,
            Map<String, CachedRepeater> repeaters, Set<String> missingIds)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HydratedStation() when $default != null:
        return $default(_that.station, _that.repeaters, _that.missingIds);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HydratedStation extends HydratedStation {
  const _HydratedStation(
      {required this.station,
      final Map<String, CachedRepeater> repeaters =
          const <String, CachedRepeater>{},
      final Set<String> missingIds = const <String>{}})
      : _repeaters = repeaters,
        _missingIds = missingIds,
        super._();

  @override
  final SavedStation station;
  final Map<String, CachedRepeater> _repeaters;
  @override
  @JsonKey()
  Map<String, CachedRepeater> get repeaters {
    if (_repeaters is EqualUnmodifiableMapView) return _repeaters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_repeaters);
  }

  /// Voci non risolte. Si mostrano come "dato non disponibile offline"
  /// senza far fallire l'intera pagina: una postazione con un buco resta
  /// utile, una postazione che non si apre no.
  final Set<String> _missingIds;

  /// Voci non risolte. Si mostrano come "dato non disponibile offline"
  /// senza far fallire l'intera pagina: una postazione con un buco resta
  /// utile, una postazione che non si apre no.
  @override
  @JsonKey()
  Set<String> get missingIds {
    if (_missingIds is EqualUnmodifiableSetView) return _missingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_missingIds);
  }

  /// Create a copy of HydratedStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HydratedStationCopyWith<_HydratedStation> get copyWith =>
      __$HydratedStationCopyWithImpl<_HydratedStation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HydratedStation &&
            (identical(other.station, station) || other.station == station) &&
            const DeepCollectionEquality()
                .equals(other._repeaters, _repeaters) &&
            const DeepCollectionEquality()
                .equals(other._missingIds, _missingIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      station,
      const DeepCollectionEquality().hash(_repeaters),
      const DeepCollectionEquality().hash(_missingIds));

  @override
  String toString() {
    return 'HydratedStation(station: $station, repeaters: $repeaters, missingIds: $missingIds)';
  }
}

/// @nodoc
abstract mixin class _$HydratedStationCopyWith<$Res>
    implements $HydratedStationCopyWith<$Res> {
  factory _$HydratedStationCopyWith(
          _HydratedStation value, $Res Function(_HydratedStation) _then) =
      __$HydratedStationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SavedStation station,
      Map<String, CachedRepeater> repeaters,
      Set<String> missingIds});

  @override
  $SavedStationCopyWith<$Res> get station;
}

/// @nodoc
class __$HydratedStationCopyWithImpl<$Res>
    implements _$HydratedStationCopyWith<$Res> {
  __$HydratedStationCopyWithImpl(this._self, this._then);

  final _HydratedStation _self;
  final $Res Function(_HydratedStation) _then;

  /// Create a copy of HydratedStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? station = null,
    Object? repeaters = null,
    Object? missingIds = null,
  }) {
    return _then(_HydratedStation(
      station: null == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as SavedStation,
      repeaters: null == repeaters
          ? _self._repeaters
          : repeaters // ignore: cast_nullable_to_non_nullable
              as Map<String, CachedRepeater>,
      missingIds: null == missingIds
          ? _self._missingIds
          : missingIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }

  /// Create a copy of HydratedStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavedStationCopyWith<$Res> get station {
    return $SavedStationCopyWith<$Res>(_self.station, (value) {
      return _then(_self.copyWith(station: value));
    });
  }
}

// dart format on
