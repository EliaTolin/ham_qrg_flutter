// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterAccessModel {
  String get id;
  @JsonKey(name: 'repeater_id')
  String get repeaterId;
  String get mode;
  String get source;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @JsonKey(name: 'network_id')
  String? get networkId;
  NetworkModel? get network;
  @JsonKey(name: 'ctcss_tx_hz')
  double? get ctcssTxHz;
  @JsonKey(name: 'ctcss_rx_hz')
  double? get ctcssRxHz;
  @JsonKey(name: 'dcs_code')
  int? get dcsCode;
  @JsonKey(name: 'color_code')
  int? get colorCode;
  @JsonKey(name: 'dmr_id')
  int? get dmrId;
  @JsonKey(name: 'dg_id')
  int? get dgId;
  String? get notes;

  /// Create a copy of RepeaterAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterAccessModelCopyWith<RepeaterAccessModel> get copyWith =>
      _$RepeaterAccessModelCopyWithImpl<RepeaterAccessModel>(
          this as RepeaterAccessModel, _$identity);

  /// Serializes this RepeaterAccessModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterAccessModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'RepeaterAccessModel(id: $id, repeaterId: $repeaterId, mode: $mode, source: $source, createdAt: $createdAt, updatedAt: $updatedAt, networkId: $networkId, network: $network, ctcssTxHz: $ctcssTxHz, ctcssRxHz: $ctcssRxHz, dcsCode: $dcsCode, colorCode: $colorCode, dmrId: $dmrId, dgId: $dgId, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $RepeaterAccessModelCopyWith<$Res> {
  factory $RepeaterAccessModelCopyWith(
          RepeaterAccessModel value, $Res Function(RepeaterAccessModel) _then) =
      _$RepeaterAccessModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'repeater_id') String repeaterId,
      String mode,
      String source,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'network_id') String? networkId,
      NetworkModel? network,
      @JsonKey(name: 'ctcss_tx_hz') double? ctcssTxHz,
      @JsonKey(name: 'ctcss_rx_hz') double? ctcssRxHz,
      @JsonKey(name: 'dcs_code') int? dcsCode,
      @JsonKey(name: 'color_code') int? colorCode,
      @JsonKey(name: 'dmr_id') int? dmrId,
      @JsonKey(name: 'dg_id') int? dgId,
      String? notes});

  $NetworkModelCopyWith<$Res>? get network;
}

/// @nodoc
class _$RepeaterAccessModelCopyWithImpl<$Res>
    implements $RepeaterAccessModelCopyWith<$Res> {
  _$RepeaterAccessModelCopyWithImpl(this._self, this._then);

  final RepeaterAccessModel _self;
  final $Res Function(RepeaterAccessModel) _then;

  /// Create a copy of RepeaterAccessModel
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
              as String,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      networkId: freezed == networkId
          ? _self.networkId
          : networkId // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkModel?,
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

  /// Create a copy of RepeaterAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkModelCopyWith<$Res>? get network {
    if (_self.network == null) {
      return null;
    }

    return $NetworkModelCopyWith<$Res>(_self.network!, (value) {
      return _then(_self.copyWith(network: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RepeaterAccessModel].
extension RepeaterAccessModelPatterns on RepeaterAccessModel {
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
    TResult Function(_RepeaterAccessModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccessModel() when $default != null:
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
    TResult Function(_RepeaterAccessModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccessModel():
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
    TResult? Function(_RepeaterAccessModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccessModel() when $default != null:
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
            @JsonKey(name: 'repeater_id') String repeaterId,
            String mode,
            String source,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            @JsonKey(name: 'network_id') String? networkId,
            NetworkModel? network,
            @JsonKey(name: 'ctcss_tx_hz') double? ctcssTxHz,
            @JsonKey(name: 'ctcss_rx_hz') double? ctcssRxHz,
            @JsonKey(name: 'dcs_code') int? dcsCode,
            @JsonKey(name: 'color_code') int? colorCode,
            @JsonKey(name: 'dmr_id') int? dmrId,
            @JsonKey(name: 'dg_id') int? dgId,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccessModel() when $default != null:
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
            @JsonKey(name: 'repeater_id') String repeaterId,
            String mode,
            String source,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            @JsonKey(name: 'network_id') String? networkId,
            NetworkModel? network,
            @JsonKey(name: 'ctcss_tx_hz') double? ctcssTxHz,
            @JsonKey(name: 'ctcss_rx_hz') double? ctcssRxHz,
            @JsonKey(name: 'dcs_code') int? dcsCode,
            @JsonKey(name: 'color_code') int? colorCode,
            @JsonKey(name: 'dmr_id') int? dmrId,
            @JsonKey(name: 'dg_id') int? dgId,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccessModel():
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
            @JsonKey(name: 'repeater_id') String repeaterId,
            String mode,
            String source,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            @JsonKey(name: 'network_id') String? networkId,
            NetworkModel? network,
            @JsonKey(name: 'ctcss_tx_hz') double? ctcssTxHz,
            @JsonKey(name: 'ctcss_rx_hz') double? ctcssRxHz,
            @JsonKey(name: 'dcs_code') int? dcsCode,
            @JsonKey(name: 'color_code') int? colorCode,
            @JsonKey(name: 'dmr_id') int? dmrId,
            @JsonKey(name: 'dg_id') int? dgId,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterAccessModel() when $default != null:
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
@JsonSerializable()
class _RepeaterAccessModel implements RepeaterAccessModel {
  const _RepeaterAccessModel(
      {required this.id,
      @JsonKey(name: 'repeater_id') required this.repeaterId,
      required this.mode,
      required this.source,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'network_id') this.networkId,
      this.network,
      @JsonKey(name: 'ctcss_tx_hz') this.ctcssTxHz,
      @JsonKey(name: 'ctcss_rx_hz') this.ctcssRxHz,
      @JsonKey(name: 'dcs_code') this.dcsCode,
      @JsonKey(name: 'color_code') this.colorCode,
      @JsonKey(name: 'dmr_id') this.dmrId,
      @JsonKey(name: 'dg_id') this.dgId,
      this.notes});
  factory _RepeaterAccessModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterAccessModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'repeater_id')
  final String repeaterId;
  @override
  final String mode;
  @override
  final String source;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'network_id')
  final String? networkId;
  @override
  final NetworkModel? network;
  @override
  @JsonKey(name: 'ctcss_tx_hz')
  final double? ctcssTxHz;
  @override
  @JsonKey(name: 'ctcss_rx_hz')
  final double? ctcssRxHz;
  @override
  @JsonKey(name: 'dcs_code')
  final int? dcsCode;
  @override
  @JsonKey(name: 'color_code')
  final int? colorCode;
  @override
  @JsonKey(name: 'dmr_id')
  final int? dmrId;
  @override
  @JsonKey(name: 'dg_id')
  final int? dgId;
  @override
  final String? notes;

  /// Create a copy of RepeaterAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterAccessModelCopyWith<_RepeaterAccessModel> get copyWith =>
      __$RepeaterAccessModelCopyWithImpl<_RepeaterAccessModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RepeaterAccessModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterAccessModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'RepeaterAccessModel(id: $id, repeaterId: $repeaterId, mode: $mode, source: $source, createdAt: $createdAt, updatedAt: $updatedAt, networkId: $networkId, network: $network, ctcssTxHz: $ctcssTxHz, ctcssRxHz: $ctcssRxHz, dcsCode: $dcsCode, colorCode: $colorCode, dmrId: $dmrId, dgId: $dgId, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterAccessModelCopyWith<$Res>
    implements $RepeaterAccessModelCopyWith<$Res> {
  factory _$RepeaterAccessModelCopyWith(_RepeaterAccessModel value,
          $Res Function(_RepeaterAccessModel) _then) =
      __$RepeaterAccessModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'repeater_id') String repeaterId,
      String mode,
      String source,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'network_id') String? networkId,
      NetworkModel? network,
      @JsonKey(name: 'ctcss_tx_hz') double? ctcssTxHz,
      @JsonKey(name: 'ctcss_rx_hz') double? ctcssRxHz,
      @JsonKey(name: 'dcs_code') int? dcsCode,
      @JsonKey(name: 'color_code') int? colorCode,
      @JsonKey(name: 'dmr_id') int? dmrId,
      @JsonKey(name: 'dg_id') int? dgId,
      String? notes});

  @override
  $NetworkModelCopyWith<$Res>? get network;
}

/// @nodoc
class __$RepeaterAccessModelCopyWithImpl<$Res>
    implements _$RepeaterAccessModelCopyWith<$Res> {
  __$RepeaterAccessModelCopyWithImpl(this._self, this._then);

  final _RepeaterAccessModel _self;
  final $Res Function(_RepeaterAccessModel) _then;

  /// Create a copy of RepeaterAccessModel
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
    return _then(_RepeaterAccessModel(
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
              as String,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      networkId: freezed == networkId
          ? _self.networkId
          : networkId // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkModel?,
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

  /// Create a copy of RepeaterAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkModelCopyWith<$Res>? get network {
    if (_self.network == null) {
      return null;
    }

    return $NetworkModelCopyWith<$Res>(_self.network!, (value) {
      return _then(_self.copyWith(network: value));
    });
  }
}

// dart format on
