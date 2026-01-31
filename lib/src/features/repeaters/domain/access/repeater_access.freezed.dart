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
  AccessMode get mode;
  String get source;
  DateTime get createdAt;
  DateTime get updatedAt;
  String? get networkId;
  Network? get network;
  double? get ctcssTxHz;
  double? get ctcssRxHz;
  int? get dcsCode;
  int? get colorCode;
  int? get dmrId;
  int? get dgId;
  String? get notes;

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
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.networkId, networkId) ||
                other.networkId == networkId) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.ctcssTxHz, ctcssTxHz) ||
                other.ctcssTxHz == ctcssTxHz) &&
            (identical(other.ctcssRxHz, ctcssRxHz) ||
                other.ctcssRxHz == ctcssRxHz) &&
            (identical(other.dcsCode, dcsCode) || other.dcsCode == dcsCode) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.dmrId, dmrId) || other.dmrId == dmrId) &&
            (identical(other.dgId, dgId) || other.dgId == dgId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeaterId,
      mode,
      source,
      createdAt,
      updatedAt,
      networkId,
      network,
      ctcssTxHz,
      ctcssRxHz,
      dcsCode,
      colorCode,
      dmrId,
      dgId,
      notes);

  @override
  String toString() {
    return 'RepeaterAccess(id: $id, repeaterId: $repeaterId, mode: $mode, source: $source, createdAt: $createdAt, updatedAt: $updatedAt, networkId: $networkId, network: $network, ctcssTxHz: $ctcssTxHz, ctcssRxHz: $ctcssRxHz, dcsCode: $dcsCode, colorCode: $colorCode, dmrId: $dmrId, dgId: $dgId, notes: $notes)';
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
      AccessMode mode,
      String source,
      DateTime createdAt,
      DateTime updatedAt,
      String? networkId,
      Network? network,
      double? ctcssTxHz,
      double? ctcssRxHz,
      int? dcsCode,
      int? colorCode,
      int? dmrId,
      int? dgId,
      String? notes});

  $NetworkCopyWith<$Res>? get network;
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
    Object? mode = null,
    Object? source = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? networkId = freezed,
    Object? network = freezed,
    Object? ctcssTxHz = freezed,
    Object? ctcssRxHz = freezed,
    Object? dcsCode = freezed,
    Object? colorCode = freezed,
    Object? dmrId = freezed,
    Object? dgId = freezed,
    Object? notes = freezed,
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
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AccessMode,
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
      networkId: freezed == networkId
          ? _self.networkId
          : networkId // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as Network?,
      ctcssTxHz: freezed == ctcssTxHz
          ? _self.ctcssTxHz
          : ctcssTxHz // ignore: cast_nullable_to_non_nullable
              as double?,
      ctcssRxHz: freezed == ctcssRxHz
          ? _self.ctcssRxHz
          : ctcssRxHz // ignore: cast_nullable_to_non_nullable
              as double?,
      dcsCode: freezed == dcsCode
          ? _self.dcsCode
          : dcsCode // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }

  /// Create a copy of RepeaterAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkCopyWith<$Res>? get network {
    if (_self.network == null) {
      return null;
    }

    return $NetworkCopyWith<$Res>(_self.network!, (value) {
      return _then(_self.copyWith(network: value));
    });
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
            AccessMode mode,
            String source,
            DateTime createdAt,
            DateTime updatedAt,
            String? networkId,
            Network? network,
            double? ctcssTxHz,
            double? ctcssRxHz,
            int? dcsCode,
            int? colorCode,
            int? dmrId,
            int? dgId,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccess() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.mode,
            _that.source,
            _that.createdAt,
            _that.updatedAt,
            _that.networkId,
            _that.network,
            _that.ctcssTxHz,
            _that.ctcssRxHz,
            _that.dcsCode,
            _that.colorCode,
            _that.dmrId,
            _that.dgId,
            _that.notes);
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
            AccessMode mode,
            String source,
            DateTime createdAt,
            DateTime updatedAt,
            String? networkId,
            Network? network,
            double? ctcssTxHz,
            double? ctcssRxHz,
            int? dcsCode,
            int? colorCode,
            int? dmrId,
            int? dgId,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccess():
        return $default(
            _that.id,
            _that.repeaterId,
            _that.mode,
            _that.source,
            _that.createdAt,
            _that.updatedAt,
            _that.networkId,
            _that.network,
            _that.ctcssTxHz,
            _that.ctcssRxHz,
            _that.dcsCode,
            _that.colorCode,
            _that.dmrId,
            _that.dgId,
            _that.notes);
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
            AccessMode mode,
            String source,
            DateTime createdAt,
            DateTime updatedAt,
            String? networkId,
            Network? network,
            double? ctcssTxHz,
            double? ctcssRxHz,
            int? dcsCode,
            int? colorCode,
            int? dmrId,
            int? dgId,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccess() when $default != null:
        return $default(
            _that.id,
            _that.repeaterId,
            _that.mode,
            _that.source,
            _that.createdAt,
            _that.updatedAt,
            _that.networkId,
            _that.network,
            _that.ctcssTxHz,
            _that.ctcssRxHz,
            _that.dcsCode,
            _that.colorCode,
            _that.dmrId,
            _that.dgId,
            _that.notes);
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
      required this.mode,
      required this.source,
      required this.createdAt,
      required this.updatedAt,
      this.networkId,
      this.network,
      this.ctcssTxHz,
      this.ctcssRxHz,
      this.dcsCode,
      this.colorCode,
      this.dmrId,
      this.dgId,
      this.notes});

  @override
  final String id;
  @override
  final String repeaterId;
  @override
  final AccessMode mode;
  @override
  final String source;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? networkId;
  @override
  final Network? network;
  @override
  final double? ctcssTxHz;
  @override
  final double? ctcssRxHz;
  @override
  final int? dcsCode;
  @override
  final int? colorCode;
  @override
  final int? dmrId;
  @override
  final int? dgId;
  @override
  final String? notes;

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
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.networkId, networkId) ||
                other.networkId == networkId) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.ctcssTxHz, ctcssTxHz) ||
                other.ctcssTxHz == ctcssTxHz) &&
            (identical(other.ctcssRxHz, ctcssRxHz) ||
                other.ctcssRxHz == ctcssRxHz) &&
            (identical(other.dcsCode, dcsCode) || other.dcsCode == dcsCode) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.dmrId, dmrId) || other.dmrId == dmrId) &&
            (identical(other.dgId, dgId) || other.dgId == dgId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      repeaterId,
      mode,
      source,
      createdAt,
      updatedAt,
      networkId,
      network,
      ctcssTxHz,
      ctcssRxHz,
      dcsCode,
      colorCode,
      dmrId,
      dgId,
      notes);

  @override
  String toString() {
    return 'RepeaterAccess(id: $id, repeaterId: $repeaterId, mode: $mode, source: $source, createdAt: $createdAt, updatedAt: $updatedAt, networkId: $networkId, network: $network, ctcssTxHz: $ctcssTxHz, ctcssRxHz: $ctcssRxHz, dcsCode: $dcsCode, colorCode: $colorCode, dmrId: $dmrId, dgId: $dgId, notes: $notes)';
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
      AccessMode mode,
      String source,
      DateTime createdAt,
      DateTime updatedAt,
      String? networkId,
      Network? network,
      double? ctcssTxHz,
      double? ctcssRxHz,
      int? dcsCode,
      int? colorCode,
      int? dmrId,
      int? dgId,
      String? notes});

  @override
  $NetworkCopyWith<$Res>? get network;
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
    Object? mode = null,
    Object? source = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? networkId = freezed,
    Object? network = freezed,
    Object? ctcssTxHz = freezed,
    Object? ctcssRxHz = freezed,
    Object? dcsCode = freezed,
    Object? colorCode = freezed,
    Object? dmrId = freezed,
    Object? dgId = freezed,
    Object? notes = freezed,
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
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AccessMode,
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
      networkId: freezed == networkId
          ? _self.networkId
          : networkId // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as Network?,
      ctcssTxHz: freezed == ctcssTxHz
          ? _self.ctcssTxHz
          : ctcssTxHz // ignore: cast_nullable_to_non_nullable
              as double?,
      ctcssRxHz: freezed == ctcssRxHz
          ? _self.ctcssRxHz
          : ctcssRxHz // ignore: cast_nullable_to_non_nullable
              as double?,
      dcsCode: freezed == dcsCode
          ? _self.dcsCode
          : dcsCode // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }

  /// Create a copy of RepeaterAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkCopyWith<$Res>? get network {
    if (_self.network == null) {
      return null;
    }

    return $NetworkCopyWith<$Res>(_self.network!, (value) {
      return _then(_self.copyWith(network: value));
    });
  }
}

// dart format on
