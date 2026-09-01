// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_maps_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfflineMapsState {
  List<OfflineRegionSnapshot> get regions;

  /// Id della regione in download, o `null` se nessun download è in corso.
  /// I download sono serializzati: uno alla volta (un secondo
  /// `loadTileRegion` sullo stesso id cancellerebbe il primo).
  String? get downloadingRegionId;
  double get downloadProgress;
  OfflineDownloadPhase get downloadPhase;
  bool get hasDownloadError;
  bool get hasDeleteError;

  /// Create a copy of OfflineMapsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OfflineMapsStateCopyWith<OfflineMapsState> get copyWith =>
      _$OfflineMapsStateCopyWithImpl<OfflineMapsState>(
          this as OfflineMapsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OfflineMapsState &&
            const DeepCollectionEquality().equals(other.regions, regions) &&
            (identical(other.downloadingRegionId, downloadingRegionId) ||
                other.downloadingRegionId == downloadingRegionId) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress) &&
            (identical(other.downloadPhase, downloadPhase) ||
                other.downloadPhase == downloadPhase) &&
            (identical(other.hasDownloadError, hasDownloadError) ||
                other.hasDownloadError == hasDownloadError) &&
            (identical(other.hasDeleteError, hasDeleteError) ||
                other.hasDeleteError == hasDeleteError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(regions),
      downloadingRegionId,
      downloadProgress,
      downloadPhase,
      hasDownloadError,
      hasDeleteError);

  @override
  String toString() {
    return 'OfflineMapsState(regions: $regions, downloadingRegionId: $downloadingRegionId, downloadProgress: $downloadProgress, downloadPhase: $downloadPhase, hasDownloadError: $hasDownloadError, hasDeleteError: $hasDeleteError)';
  }
}

/// @nodoc
abstract mixin class $OfflineMapsStateCopyWith<$Res> {
  factory $OfflineMapsStateCopyWith(
          OfflineMapsState value, $Res Function(OfflineMapsState) _then) =
      _$OfflineMapsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<OfflineRegionSnapshot> regions,
      String? downloadingRegionId,
      double downloadProgress,
      OfflineDownloadPhase downloadPhase,
      bool hasDownloadError,
      bool hasDeleteError});
}

/// @nodoc
class _$OfflineMapsStateCopyWithImpl<$Res>
    implements $OfflineMapsStateCopyWith<$Res> {
  _$OfflineMapsStateCopyWithImpl(this._self, this._then);

  final OfflineMapsState _self;
  final $Res Function(OfflineMapsState) _then;

  /// Create a copy of OfflineMapsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regions = null,
    Object? downloadingRegionId = freezed,
    Object? downloadProgress = null,
    Object? downloadPhase = null,
    Object? hasDownloadError = null,
    Object? hasDeleteError = null,
  }) {
    return _then(_self.copyWith(
      regions: null == regions
          ? _self.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<OfflineRegionSnapshot>,
      downloadingRegionId: freezed == downloadingRegionId
          ? _self.downloadingRegionId
          : downloadingRegionId // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadProgress: null == downloadProgress
          ? _self.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      downloadPhase: null == downloadPhase
          ? _self.downloadPhase
          : downloadPhase // ignore: cast_nullable_to_non_nullable
              as OfflineDownloadPhase,
      hasDownloadError: null == hasDownloadError
          ? _self.hasDownloadError
          : hasDownloadError // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDeleteError: null == hasDeleteError
          ? _self.hasDeleteError
          : hasDeleteError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [OfflineMapsState].
extension OfflineMapsStatePatterns on OfflineMapsState {
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
    TResult Function(_OfflineMapsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfflineMapsState() when $default != null:
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
    TResult Function(_OfflineMapsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineMapsState():
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
    TResult? Function(_OfflineMapsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineMapsState() when $default != null:
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
            List<OfflineRegionSnapshot> regions,
            String? downloadingRegionId,
            double downloadProgress,
            OfflineDownloadPhase downloadPhase,
            bool hasDownloadError,
            bool hasDeleteError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfflineMapsState() when $default != null:
        return $default(
            _that.regions,
            _that.downloadingRegionId,
            _that.downloadProgress,
            _that.downloadPhase,
            _that.hasDownloadError,
            _that.hasDeleteError);
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
            List<OfflineRegionSnapshot> regions,
            String? downloadingRegionId,
            double downloadProgress,
            OfflineDownloadPhase downloadPhase,
            bool hasDownloadError,
            bool hasDeleteError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineMapsState():
        return $default(
            _that.regions,
            _that.downloadingRegionId,
            _that.downloadProgress,
            _that.downloadPhase,
            _that.hasDownloadError,
            _that.hasDeleteError);
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
            List<OfflineRegionSnapshot> regions,
            String? downloadingRegionId,
            double downloadProgress,
            OfflineDownloadPhase downloadPhase,
            bool hasDownloadError,
            bool hasDeleteError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineMapsState() when $default != null:
        return $default(
            _that.regions,
            _that.downloadingRegionId,
            _that.downloadProgress,
            _that.downloadPhase,
            _that.hasDownloadError,
            _that.hasDeleteError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OfflineMapsState implements OfflineMapsState {
  const _OfflineMapsState(
      {final List<OfflineRegionSnapshot> regions =
          const <OfflineRegionSnapshot>[],
      this.downloadingRegionId,
      this.downloadProgress = 0.0,
      this.downloadPhase = OfflineDownloadPhase.stylePack,
      this.hasDownloadError = false,
      this.hasDeleteError = false})
      : _regions = regions;

  final List<OfflineRegionSnapshot> _regions;
  @override
  @JsonKey()
  List<OfflineRegionSnapshot> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  /// Id della regione in download, o `null` se nessun download è in corso.
  /// I download sono serializzati: uno alla volta (un secondo
  /// `loadTileRegion` sullo stesso id cancellerebbe il primo).
  @override
  final String? downloadingRegionId;
  @override
  @JsonKey()
  final double downloadProgress;
  @override
  @JsonKey()
  final OfflineDownloadPhase downloadPhase;
  @override
  @JsonKey()
  final bool hasDownloadError;
  @override
  @JsonKey()
  final bool hasDeleteError;

  /// Create a copy of OfflineMapsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OfflineMapsStateCopyWith<_OfflineMapsState> get copyWith =>
      __$OfflineMapsStateCopyWithImpl<_OfflineMapsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OfflineMapsState &&
            const DeepCollectionEquality().equals(other._regions, _regions) &&
            (identical(other.downloadingRegionId, downloadingRegionId) ||
                other.downloadingRegionId == downloadingRegionId) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress) &&
            (identical(other.downloadPhase, downloadPhase) ||
                other.downloadPhase == downloadPhase) &&
            (identical(other.hasDownloadError, hasDownloadError) ||
                other.hasDownloadError == hasDownloadError) &&
            (identical(other.hasDeleteError, hasDeleteError) ||
                other.hasDeleteError == hasDeleteError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_regions),
      downloadingRegionId,
      downloadProgress,
      downloadPhase,
      hasDownloadError,
      hasDeleteError);

  @override
  String toString() {
    return 'OfflineMapsState(regions: $regions, downloadingRegionId: $downloadingRegionId, downloadProgress: $downloadProgress, downloadPhase: $downloadPhase, hasDownloadError: $hasDownloadError, hasDeleteError: $hasDeleteError)';
  }
}

/// @nodoc
abstract mixin class _$OfflineMapsStateCopyWith<$Res>
    implements $OfflineMapsStateCopyWith<$Res> {
  factory _$OfflineMapsStateCopyWith(
          _OfflineMapsState value, $Res Function(_OfflineMapsState) _then) =
      __$OfflineMapsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<OfflineRegionSnapshot> regions,
      String? downloadingRegionId,
      double downloadProgress,
      OfflineDownloadPhase downloadPhase,
      bool hasDownloadError,
      bool hasDeleteError});
}

/// @nodoc
class __$OfflineMapsStateCopyWithImpl<$Res>
    implements _$OfflineMapsStateCopyWith<$Res> {
  __$OfflineMapsStateCopyWithImpl(this._self, this._then);

  final _OfflineMapsState _self;
  final $Res Function(_OfflineMapsState) _then;

  /// Create a copy of OfflineMapsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? regions = null,
    Object? downloadingRegionId = freezed,
    Object? downloadProgress = null,
    Object? downloadPhase = null,
    Object? hasDownloadError = null,
    Object? hasDeleteError = null,
  }) {
    return _then(_OfflineMapsState(
      regions: null == regions
          ? _self._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<OfflineRegionSnapshot>,
      downloadingRegionId: freezed == downloadingRegionId
          ? _self.downloadingRegionId
          : downloadingRegionId // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadProgress: null == downloadProgress
          ? _self.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double,
      downloadPhase: null == downloadPhase
          ? _self.downloadPhase
          : downloadPhase // ignore: cast_nullable_to_non_nullable
              as OfflineDownloadPhase,
      hasDownloadError: null == hasDownloadError
          ? _self.hasDownloadError
          : hasDownloadError // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDeleteError: null == hasDeleteError
          ? _self.hasDeleteError
          : hasDeleteError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
