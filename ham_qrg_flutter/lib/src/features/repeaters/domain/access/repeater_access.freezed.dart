// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_access.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterAccess {
  String get id;
  String get repeaterId;
  String? get networkId;
  AccessMode get mode;
  double? get ctcssHz;
  int? get dcsCode;
  ToneScope get toneScope;
  ToneDirection get toneDirection;
  int? get colorCode;
  int? get dmrId;
  int? get dgId;
  String? get notes;
  String get source;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of RepeaterAccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterAccessCopyWith<RepeaterAccess> get copyWith =>
      _$RepeaterAccessCopyWithImpl<RepeaterAccess>(
          this as RepeaterAccess, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterAccess &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.networkId, networkId) ||
                other.networkId == networkId) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.ctcssHz, ctcssHz) || other.ctcssHz == ctcssHz) &&
            (identical(other.dcsCode, dcsCode) || other.dcsCode == dcsCode) &&
            (identical(other.toneScope, toneScope) ||
                other.toneScope == toneScope) &&
            (identical(other.toneDirection, toneDirection) ||
                other.toneDirection == toneDirection) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.dmrId, dmrId) || other.dmrId == dmrId) &&
            (identical(other.dgId, dgId) || other.dgId == dgId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeaterId,
      networkId,
      mode,
      ctcssHz,
      dcsCode,
      toneScope,
      toneDirection,
      colorCode,
      dmrId,
      dgId,
      notes,
      source,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'RepeaterAccess(id: $id, repeaterId: $repeaterId, networkId: $networkId, mode: $mode, ctcssHz: $ctcssHz, dcsCode: $dcsCode, toneScope: $toneScope, toneDirection: $toneDirection, colorCode: $colorCode, dmrId: $dmrId, dgId: $dgId, notes: $notes, source: $source, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $RepeaterAccessCopyWith<$Res> {
  factory $RepeaterAccessCopyWith(
          RepeaterAccess value, $Res Function(RepeaterAccess) _then) =
      _$RepeaterAccessCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String repeaterId,
      String? networkId,
      AccessMode mode,
      double? ctcssHz,
      int? dcsCode,
      ToneScope toneScope,
      ToneDirection toneDirection,
      int? colorCode,
      int? dmrId,
      int? dgId,
      String? notes,
      String source,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$RepeaterAccessCopyWithImpl<$Res>
    implements $RepeaterAccessCopyWith<$Res> {
  _$RepeaterAccessCopyWithImpl(this._self, this._then);

  final RepeaterAccess _self;
  final $Res Function(RepeaterAccess) _then;

  /// Create a copy of RepeaterAccess
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repeaterId = null,
    Object? networkId = freezed,
    Object? mode = null,
    Object? ctcssHz = freezed,
    Object? dcsCode = freezed,
    Object? toneScope = null,
    Object? toneDirection = null,
    Object? colorCode = freezed,
    Object? dmrId = freezed,
    Object? dgId = freezed,
    Object? notes = freezed,
    Object? source = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      networkId: freezed == networkId
          ? _self.networkId
          : networkId // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AccessMode,
      ctcssHz: freezed == ctcssHz
          ? _self.ctcssHz
          : ctcssHz // ignore: cast_nullable_to_non_nullable
              as double?,
      dcsCode: freezed == dcsCode
          ? _self.dcsCode
          : dcsCode // ignore: cast_nullable_to_non_nullable
              as int?,
      toneScope: null == toneScope
          ? _self.toneScope
          : toneScope // ignore: cast_nullable_to_non_nullable
              as ToneScope,
      toneDirection: null == toneDirection
          ? _self.toneDirection
          : toneDirection // ignore: cast_nullable_to_non_nullable
              as ToneDirection,
      colorCode: freezed == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      dmrId: freezed == dmrId
          ? _self.dmrId
          : dmrId // ignore: cast_nullable_to_non_nullable
              as int?,
      dgId: freezed == dgId
          ? _self.dgId
          : dgId // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [RepeaterAccess].
extension RepeaterAccessPatterns on RepeaterAccess {
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
    TResult Function(_RepeaterAccess value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccess() when $default != null:
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
    TResult Function(_RepeaterAccess value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccess():
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
    TResult? Function(_RepeaterAccess value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccess() when $default != null:
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
            String repeaterId,
            String? networkId,
            AccessMode mode,
            double? ctcssHz,
            int? dcsCode,
            ToneScope toneScope,
            ToneDirection toneDirection,
            int? colorCode,
            int? dmrId,
            int? dgId,
            String? notes,
            String source,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccess() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.networkId,
            _that.mode,
            _that.ctcssHz,
            _that.dcsCode,
            _that.toneScope,
            _that.toneDirection,
            _that.colorCode,
            _that.dmrId,
            _that.dgId,
            _that.notes,
            _that.source,
            _that.createdAt,
            _that.updatedAt);
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
            String repeaterId,
            String? networkId,
            AccessMode mode,
            double? ctcssHz,
            int? dcsCode,
            ToneScope toneScope,
            ToneDirection toneDirection,
            int? colorCode,
            int? dmrId,
            int? dgId,
            String? notes,
            String source,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccess():
        return $default(
            _that.id,
            _that.repeaterId,
            _that.networkId,
            _that.mode,
            _that.ctcssHz,
            _that.dcsCode,
            _that.toneScope,
            _that.toneDirection,
            _that.colorCode,
            _that.dmrId,
            _that.dgId,
            _that.notes,
            _that.source,
            _that.createdAt,
            _that.updatedAt);
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
            String repeaterId,
            String? networkId,
            AccessMode mode,
            double? ctcssHz,
            int? dcsCode,
            ToneScope toneScope,
            ToneDirection toneDirection,
            int? colorCode,
            int? dmrId,
            int? dgId,
            String? notes,
            String source,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccess() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.networkId,
            _that.mode,
            _that.ctcssHz,
            _that.dcsCode,
            _that.toneScope,
            _that.toneDirection,
            _that.colorCode,
            _that.dmrId,
            _that.dgId,
            _that.notes,
            _that.source,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeaterAccess implements RepeaterAccess {
  const _RepeaterAccess(
      {required this.id,
      required this.repeaterId,
      this.networkId,
      required this.mode,
      this.ctcssHz,
      this.dcsCode,
      required this.toneScope,
      required this.toneDirection,
      this.colorCode,
      this.dmrId,
      this.dgId,
      this.notes,
      required this.source,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String id;
  @override
  final String repeaterId;
  @override
  final String? networkId;
  @override
  final AccessMode mode;
  @override
  final double? ctcssHz;
  @override
  final int? dcsCode;
  @override
  final ToneScope toneScope;
  @override
  final ToneDirection toneDirection;
  @override
  final int? colorCode;
  @override
  final int? dmrId;
  @override
  final int? dgId;
  @override
  final String? notes;
  @override
  final String source;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of RepeaterAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterAccessCopyWith<_RepeaterAccess> get copyWith =>
      __$RepeaterAccessCopyWithImpl<_RepeaterAccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterAccess &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.networkId, networkId) ||
                other.networkId == networkId) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.ctcssHz, ctcssHz) || other.ctcssHz == ctcssHz) &&
            (identical(other.dcsCode, dcsCode) || other.dcsCode == dcsCode) &&
            (identical(other.toneScope, toneScope) ||
                other.toneScope == toneScope) &&
            (identical(other.toneDirection, toneDirection) ||
                other.toneDirection == toneDirection) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.dmrId, dmrId) || other.dmrId == dmrId) &&
            (identical(other.dgId, dgId) || other.dgId == dgId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeaterId,
      networkId,
      mode,
      ctcssHz,
      dcsCode,
      toneScope,
      toneDirection,
      colorCode,
      dmrId,
      dgId,
      notes,
      source,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'RepeaterAccess(id: $id, repeaterId: $repeaterId, networkId: $networkId, mode: $mode, ctcssHz: $ctcssHz, dcsCode: $dcsCode, toneScope: $toneScope, toneDirection: $toneDirection, colorCode: $colorCode, dmrId: $dmrId, dgId: $dgId, notes: $notes, source: $source, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterAccessCopyWith<$Res>
    implements $RepeaterAccessCopyWith<$Res> {
  factory _$RepeaterAccessCopyWith(
          _RepeaterAccess value, $Res Function(_RepeaterAccess) _then) =
      __$RepeaterAccessCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String repeaterId,
      String? networkId,
      AccessMode mode,
      double? ctcssHz,
      int? dcsCode,
      ToneScope toneScope,
      ToneDirection toneDirection,
      int? colorCode,
      int? dmrId,
      int? dgId,
      String? notes,
      String source,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$RepeaterAccessCopyWithImpl<$Res>
    implements _$RepeaterAccessCopyWith<$Res> {
  __$RepeaterAccessCopyWithImpl(this._self, this._then);

  final _RepeaterAccess _self;
  final $Res Function(_RepeaterAccess) _then;

  /// Create a copy of RepeaterAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? repeaterId = null,
    Object? networkId = freezed,
    Object? mode = null,
    Object? ctcssHz = freezed,
    Object? dcsCode = freezed,
    Object? toneScope = null,
    Object? toneDirection = null,
    Object? colorCode = freezed,
    Object? dmrId = freezed,
    Object? dgId = freezed,
    Object? notes = freezed,
    Object? source = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_RepeaterAccess(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      networkId: freezed == networkId
          ? _self.networkId
          : networkId // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AccessMode,
      ctcssHz: freezed == ctcssHz
          ? _self.ctcssHz
          : ctcssHz // ignore: cast_nullable_to_non_nullable
              as double?,
      dcsCode: freezed == dcsCode
          ? _self.dcsCode
          : dcsCode // ignore: cast_nullable_to_non_nullable
              as int?,
      toneScope: null == toneScope
          ? _self.toneScope
          : toneScope // ignore: cast_nullable_to_non_nullable
              as ToneScope,
      toneDirection: null == toneDirection
          ? _self.toneDirection
          : toneDirection // ignore: cast_nullable_to_non_nullable
              as ToneDirection,
      colorCode: freezed == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      dmrId: freezed == dmrId
          ? _self.dmrId
          : dmrId // ignore: cast_nullable_to_non_nullable
              as int?,
      dgId: freezed == dgId
          ? _self.dgId
          : dgId // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
