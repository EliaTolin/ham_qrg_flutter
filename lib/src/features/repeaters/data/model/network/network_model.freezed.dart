// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NetworkModel {
  String get id;
  String get name;
  @JsonKey(name: 'kind')
  String get kind;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'parent_network_id')
  String? get parentNetworkId;
  String? get website;
  String? get notes;

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NetworkModelCopyWith<NetworkModel> get copyWith =>
      _$NetworkModelCopyWithImpl<NetworkModel>(
          this as NetworkModel, _$identity);

  /// Serializes this NetworkModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NetworkModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.parentNetworkId, parentNetworkId) ||
                other.parentNetworkId == parentNetworkId) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, kind, createdAt, parentNetworkId, website, notes);

  @override
  String toString() {
    return 'NetworkModel(id: $id, name: $name, kind: $kind, createdAt: $createdAt, parentNetworkId: $parentNetworkId, website: $website, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $NetworkModelCopyWith<$Res> {
  factory $NetworkModelCopyWith(
          NetworkModel value, $Res Function(NetworkModel) _then) =
      _$NetworkModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'kind') String kind,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'parent_network_id') String? parentNetworkId,
      String? website,
      String? notes});
}

/// @nodoc
class _$NetworkModelCopyWithImpl<$Res> implements $NetworkModelCopyWith<$Res> {
  _$NetworkModelCopyWithImpl(this._self, this._then);

  final NetworkModel _self;
  final $Res Function(NetworkModel) _then;

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? kind = null,
    Object? createdAt = null,
    Object? parentNetworkId = freezed,
    Object? website = freezed,
    Object? notes = freezed,
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
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      parentNetworkId: freezed == parentNetworkId
          ? _self.parentNetworkId
          : parentNetworkId // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NetworkModel].
extension NetworkModelPatterns on NetworkModel {
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
    TResult Function(_NetworkModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NetworkModel() when $default != null:
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
    TResult Function(_NetworkModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NetworkModel():
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
    TResult? Function(_NetworkModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NetworkModel() when $default != null:
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
            @JsonKey(name: 'kind') String kind,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'parent_network_id') String? parentNetworkId,
            String? website,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NetworkModel() when $default != null:
        return $default(_that.id, _that.name, _that.kind, _that.createdAt,
            _that.parentNetworkId, _that.website, _that.notes);
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
            @JsonKey(name: 'kind') String kind,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'parent_network_id') String? parentNetworkId,
            String? website,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NetworkModel():
        return $default(_that.id, _that.name, _that.kind, _that.createdAt,
            _that.parentNetworkId, _that.website, _that.notes);
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
            @JsonKey(name: 'kind') String kind,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'parent_network_id') String? parentNetworkId,
            String? website,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NetworkModel() when $default != null:
        return $default(_that.id, _that.name, _that.kind, _that.createdAt,
            _that.parentNetworkId, _that.website, _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NetworkModel implements NetworkModel {
  const _NetworkModel(
      {required this.id,
      required this.name,
      @JsonKey(name: 'kind') required this.kind,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'parent_network_id') this.parentNetworkId,
      this.website,
      this.notes});
  factory _NetworkModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'kind')
  final String kind;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'parent_network_id')
  final String? parentNetworkId;
  @override
  final String? website;
  @override
  final String? notes;

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NetworkModelCopyWith<_NetworkModel> get copyWith =>
      __$NetworkModelCopyWithImpl<_NetworkModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NetworkModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NetworkModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.parentNetworkId, parentNetworkId) ||
                other.parentNetworkId == parentNetworkId) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, kind, createdAt, parentNetworkId, website, notes);

  @override
  String toString() {
    return 'NetworkModel(id: $id, name: $name, kind: $kind, createdAt: $createdAt, parentNetworkId: $parentNetworkId, website: $website, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$NetworkModelCopyWith<$Res>
    implements $NetworkModelCopyWith<$Res> {
  factory _$NetworkModelCopyWith(
          _NetworkModel value, $Res Function(_NetworkModel) _then) =
      __$NetworkModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'kind') String kind,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'parent_network_id') String? parentNetworkId,
      String? website,
      String? notes});
}

/// @nodoc
class __$NetworkModelCopyWithImpl<$Res>
    implements _$NetworkModelCopyWith<$Res> {
  __$NetworkModelCopyWithImpl(this._self, this._then);

  final _NetworkModel _self;
  final $Res Function(_NetworkModel) _then;

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? kind = null,
    Object? createdAt = null,
    Object? parentNetworkId = freezed,
    Object? website = freezed,
    Object? notes = freezed,
  }) {
    return _then(_NetworkModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      parentNetworkId: freezed == parentNetworkId
          ? _self.parentNetworkId
          : parentNetworkId // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
