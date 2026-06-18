// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reachable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReachableRepeaterModel {
  String get id;
  double get dbm;
  @JsonKey(name: 'loss_db')
  double get lossDb;
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @JsonKey(name: 'azimuth_deg')
  double get azimuthDeg;
  bool get reachable;
  @JsonKey(name: 'itm_errno')
  int get itmErrno;

  /// Create a copy of ReachableRepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReachableRepeaterModelCopyWith<ReachableRepeaterModel> get copyWith =>
      _$ReachableRepeaterModelCopyWithImpl<ReachableRepeaterModel>(
          this as ReachableRepeaterModel, _$identity);

  /// Serializes this ReachableRepeaterModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReachableRepeaterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.lossDb, lossDb) || other.lossDb == lossDb) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.azimuthDeg, azimuthDeg) ||
                other.azimuthDeg == azimuthDeg) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable) &&
            (identical(other.itmErrno, itmErrno) ||
                other.itmErrno == itmErrno));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, dbm, lossDb, distanceKm,
      azimuthDeg, reachable, itmErrno);

  @override
  String toString() {
    return 'ReachableRepeaterModel(id: $id, dbm: $dbm, lossDb: $lossDb, distanceKm: $distanceKm, azimuthDeg: $azimuthDeg, reachable: $reachable, itmErrno: $itmErrno)';
  }
}

/// @nodoc
abstract mixin class $ReachableRepeaterModelCopyWith<$Res> {
  factory $ReachableRepeaterModelCopyWith(ReachableRepeaterModel value,
          $Res Function(ReachableRepeaterModel) _then) =
      _$ReachableRepeaterModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      double dbm,
      @JsonKey(name: 'loss_db') double lossDb,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'azimuth_deg') double azimuthDeg,
      bool reachable,
      @JsonKey(name: 'itm_errno') int itmErrno});
}

/// @nodoc
class _$ReachableRepeaterModelCopyWithImpl<$Res>
    implements $ReachableRepeaterModelCopyWith<$Res> {
  _$ReachableRepeaterModelCopyWithImpl(this._self, this._then);

  final ReachableRepeaterModel _self;
  final $Res Function(ReachableRepeaterModel) _then;

  /// Create a copy of ReachableRepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dbm = null,
    Object? lossDb = null,
    Object? distanceKm = null,
    Object? azimuthDeg = null,
    Object? reachable = null,
    Object? itmErrno = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      itmErrno: null == itmErrno
          ? _self.itmErrno
          : itmErrno // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReachableRepeaterModel].
extension ReachableRepeaterModelPatterns on ReachableRepeaterModel {
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
    TResult Function(_ReachableRepeaterModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReachableRepeaterModel() when $default != null:
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
    TResult Function(_ReachableRepeaterModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableRepeaterModel():
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
    TResult? Function(_ReachableRepeaterModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableRepeaterModel() when $default != null:
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
            double dbm,
            @JsonKey(name: 'loss_db') double lossDb,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'azimuth_deg') double azimuthDeg,
            bool reachable,
            @JsonKey(name: 'itm_errno') int itmErrno)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReachableRepeaterModel() when $default != null:
        return $default(_that.id, _that.dbm, _that.lossDb, _that.distanceKm,
            _that.azimuthDeg, _that.reachable, _that.itmErrno);
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
            double dbm,
            @JsonKey(name: 'loss_db') double lossDb,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'azimuth_deg') double azimuthDeg,
            bool reachable,
            @JsonKey(name: 'itm_errno') int itmErrno)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableRepeaterModel():
        return $default(_that.id, _that.dbm, _that.lossDb, _that.distanceKm,
            _that.azimuthDeg, _that.reachable, _that.itmErrno);
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
            double dbm,
            @JsonKey(name: 'loss_db') double lossDb,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'azimuth_deg') double azimuthDeg,
            bool reachable,
            @JsonKey(name: 'itm_errno') int itmErrno)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableRepeaterModel() when $default != null:
        return $default(_that.id, _that.dbm, _that.lossDb, _that.distanceKm,
            _that.azimuthDeg, _that.reachable, _that.itmErrno);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReachableRepeaterModel implements ReachableRepeaterModel {
  const _ReachableRepeaterModel(
      {required this.id,
      required this.dbm,
      @JsonKey(name: 'loss_db') required this.lossDb,
      @JsonKey(name: 'distance_km') required this.distanceKm,
      @JsonKey(name: 'azimuth_deg') required this.azimuthDeg,
      required this.reachable,
      @JsonKey(name: 'itm_errno') this.itmErrno = 0});
  factory _ReachableRepeaterModel.fromJson(Map<String, dynamic> json) =>
      _$ReachableRepeaterModelFromJson(json);

  @override
  final String id;
  @override
  final double dbm;
  @override
  @JsonKey(name: 'loss_db')
  final double lossDb;
  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;
  @override
  @JsonKey(name: 'azimuth_deg')
  final double azimuthDeg;
  @override
  final bool reachable;
  @override
  @JsonKey(name: 'itm_errno')
  final int itmErrno;

  /// Create a copy of ReachableRepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReachableRepeaterModelCopyWith<_ReachableRepeaterModel> get copyWith =>
      __$ReachableRepeaterModelCopyWithImpl<_ReachableRepeaterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReachableRepeaterModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReachableRepeaterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.lossDb, lossDb) || other.lossDb == lossDb) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.azimuthDeg, azimuthDeg) ||
                other.azimuthDeg == azimuthDeg) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable) &&
            (identical(other.itmErrno, itmErrno) ||
                other.itmErrno == itmErrno));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, dbm, lossDb, distanceKm,
      azimuthDeg, reachable, itmErrno);

  @override
  String toString() {
    return 'ReachableRepeaterModel(id: $id, dbm: $dbm, lossDb: $lossDb, distanceKm: $distanceKm, azimuthDeg: $azimuthDeg, reachable: $reachable, itmErrno: $itmErrno)';
  }
}

/// @nodoc
abstract mixin class _$ReachableRepeaterModelCopyWith<$Res>
    implements $ReachableRepeaterModelCopyWith<$Res> {
  factory _$ReachableRepeaterModelCopyWith(_ReachableRepeaterModel value,
          $Res Function(_ReachableRepeaterModel) _then) =
      __$ReachableRepeaterModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      double dbm,
      @JsonKey(name: 'loss_db') double lossDb,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'azimuth_deg') double azimuthDeg,
      bool reachable,
      @JsonKey(name: 'itm_errno') int itmErrno});
}

/// @nodoc
class __$ReachableRepeaterModelCopyWithImpl<$Res>
    implements _$ReachableRepeaterModelCopyWith<$Res> {
  __$ReachableRepeaterModelCopyWithImpl(this._self, this._then);

  final _ReachableRepeaterModel _self;
  final $Res Function(_ReachableRepeaterModel) _then;

  /// Create a copy of ReachableRepeaterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? dbm = null,
    Object? lossDb = null,
    Object? distanceKm = null,
    Object? azimuthDeg = null,
    Object? reachable = null,
    Object? itmErrno = null,
  }) {
    return _then(_ReachableRepeaterModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      itmErrno: null == itmErrno
          ? _self.itmErrno
          : itmErrno // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ReachableResponseModel {
  int get count;
  List<ReachableRepeaterModel> get reachable;

  /// Create a copy of ReachableResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReachableResponseModelCopyWith<ReachableResponseModel> get copyWith =>
      _$ReachableResponseModelCopyWithImpl<ReachableResponseModel>(
          this as ReachableResponseModel, _$identity);

  /// Serializes this ReachableResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReachableResponseModel &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other.reachable, reachable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(reachable));

  @override
  String toString() {
    return 'ReachableResponseModel(count: $count, reachable: $reachable)';
  }
}

/// @nodoc
abstract mixin class $ReachableResponseModelCopyWith<$Res> {
  factory $ReachableResponseModelCopyWith(ReachableResponseModel value,
          $Res Function(ReachableResponseModel) _then) =
      _$ReachableResponseModelCopyWithImpl;
  @useResult
  $Res call({int count, List<ReachableRepeaterModel> reachable});
}

/// @nodoc
class _$ReachableResponseModelCopyWithImpl<$Res>
    implements $ReachableResponseModelCopyWith<$Res> {
  _$ReachableResponseModelCopyWithImpl(this._self, this._then);

  final ReachableResponseModel _self;
  final $Res Function(ReachableResponseModel) _then;

  /// Create a copy of ReachableResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? reachable = null,
  }) {
    return _then(_self.copyWith(
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      reachable: null == reachable
          ? _self.reachable
          : reachable // ignore: cast_nullable_to_non_nullable
              as List<ReachableRepeaterModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReachableResponseModel].
extension ReachableResponseModelPatterns on ReachableResponseModel {
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
    TResult Function(_ReachableResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReachableResponseModel() when $default != null:
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
    TResult Function(_ReachableResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableResponseModel():
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
    TResult? Function(_ReachableResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableResponseModel() when $default != null:
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
    TResult Function(int count, List<ReachableRepeaterModel> reachable)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReachableResponseModel() when $default != null:
        return $default(_that.count, _that.reachable);
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
    TResult Function(int count, List<ReachableRepeaterModel> reachable)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableResponseModel():
        return $default(_that.count, _that.reachable);
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
    TResult? Function(int count, List<ReachableRepeaterModel> reachable)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReachableResponseModel() when $default != null:
        return $default(_that.count, _that.reachable);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReachableResponseModel implements ReachableResponseModel {
  const _ReachableResponseModel(
      {this.count = 0, final List<ReachableRepeaterModel> reachable = const []})
      : _reachable = reachable;
  factory _ReachableResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReachableResponseModelFromJson(json);

  @override
  @JsonKey()
  final int count;
  final List<ReachableRepeaterModel> _reachable;
  @override
  @JsonKey()
  List<ReachableRepeaterModel> get reachable {
    if (_reachable is EqualUnmodifiableListView) return _reachable;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reachable);
  }

  /// Create a copy of ReachableResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReachableResponseModelCopyWith<_ReachableResponseModel> get copyWith =>
      __$ReachableResponseModelCopyWithImpl<_ReachableResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReachableResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReachableResponseModel &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._reachable, _reachable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_reachable));

  @override
  String toString() {
    return 'ReachableResponseModel(count: $count, reachable: $reachable)';
  }
}

/// @nodoc
abstract mixin class _$ReachableResponseModelCopyWith<$Res>
    implements $ReachableResponseModelCopyWith<$Res> {
  factory _$ReachableResponseModelCopyWith(_ReachableResponseModel value,
          $Res Function(_ReachableResponseModel) _then) =
      __$ReachableResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call({int count, List<ReachableRepeaterModel> reachable});
}

/// @nodoc
class __$ReachableResponseModelCopyWithImpl<$Res>
    implements _$ReachableResponseModelCopyWith<$Res> {
  __$ReachableResponseModelCopyWithImpl(this._self, this._then);

  final _ReachableResponseModel _self;
  final $Res Function(_ReachableResponseModel) _then;

  /// Create a copy of ReachableResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? count = null,
    Object? reachable = null,
  }) {
    return _then(_ReachableResponseModel(
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      reachable: null == reachable
          ? _self._reachable
          : reachable // ignore: cast_nullable_to_non_nullable
              as List<ReachableRepeaterModel>,
    ));
  }
}

/// @nodoc
mixin _$LinkProfilePointModel {
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @JsonKey(name: 'ground_m')
  double get groundM;

  /// Create a copy of LinkProfilePointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LinkProfilePointModelCopyWith<LinkProfilePointModel> get copyWith =>
      _$LinkProfilePointModelCopyWithImpl<LinkProfilePointModel>(
          this as LinkProfilePointModel, _$identity);

  /// Serializes this LinkProfilePointModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinkProfilePointModel &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.groundM, groundM) || other.groundM == groundM));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, distanceKm, groundM);

  @override
  String toString() {
    return 'LinkProfilePointModel(distanceKm: $distanceKm, groundM: $groundM)';
  }
}

/// @nodoc
abstract mixin class $LinkProfilePointModelCopyWith<$Res> {
  factory $LinkProfilePointModelCopyWith(LinkProfilePointModel value,
          $Res Function(LinkProfilePointModel) _then) =
      _$LinkProfilePointModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'ground_m') double groundM});
}

/// @nodoc
class _$LinkProfilePointModelCopyWithImpl<$Res>
    implements $LinkProfilePointModelCopyWith<$Res> {
  _$LinkProfilePointModelCopyWithImpl(this._self, this._then);

  final LinkProfilePointModel _self;
  final $Res Function(LinkProfilePointModel) _then;

  /// Create a copy of LinkProfilePointModel
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

/// Adds pattern-matching-related methods to [LinkProfilePointModel].
extension LinkProfilePointModelPatterns on LinkProfilePointModel {
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
    TResult Function(_LinkProfilePointModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePointModel() when $default != null:
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
    TResult Function(_LinkProfilePointModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePointModel():
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
    TResult? Function(_LinkProfilePointModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePointModel() when $default != null:
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
    TResult Function(@JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'ground_m') double groundM)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePointModel() when $default != null:
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
    TResult Function(@JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'ground_m') double groundM)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePointModel():
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
    TResult? Function(@JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'ground_m') double groundM)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkProfilePointModel() when $default != null:
        return $default(_that.distanceKm, _that.groundM);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LinkProfilePointModel implements LinkProfilePointModel {
  const _LinkProfilePointModel(
      {@JsonKey(name: 'distance_km') required this.distanceKm,
      @JsonKey(name: 'ground_m') required this.groundM});
  factory _LinkProfilePointModel.fromJson(Map<String, dynamic> json) =>
      _$LinkProfilePointModelFromJson(json);

  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;
  @override
  @JsonKey(name: 'ground_m')
  final double groundM;

  /// Create a copy of LinkProfilePointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LinkProfilePointModelCopyWith<_LinkProfilePointModel> get copyWith =>
      __$LinkProfilePointModelCopyWithImpl<_LinkProfilePointModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LinkProfilePointModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LinkProfilePointModel &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.groundM, groundM) || other.groundM == groundM));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, distanceKm, groundM);

  @override
  String toString() {
    return 'LinkProfilePointModel(distanceKm: $distanceKm, groundM: $groundM)';
  }
}

/// @nodoc
abstract mixin class _$LinkProfilePointModelCopyWith<$Res>
    implements $LinkProfilePointModelCopyWith<$Res> {
  factory _$LinkProfilePointModelCopyWith(_LinkProfilePointModel value,
          $Res Function(_LinkProfilePointModel) _then) =
      __$LinkProfilePointModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'ground_m') double groundM});
}

/// @nodoc
class __$LinkProfilePointModelCopyWithImpl<$Res>
    implements _$LinkProfilePointModelCopyWith<$Res> {
  __$LinkProfilePointModelCopyWithImpl(this._self, this._then);

  final _LinkProfilePointModel _self;
  final $Res Function(_LinkProfilePointModel) _then;

  /// Create a copy of LinkProfilePointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? distanceKm = null,
    Object? groundM = null,
  }) {
    return _then(_LinkProfilePointModel(
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
mixin _$LinkDetailModel {
  String get id;
  double get dbm;
  @JsonKey(name: 'loss_db')
  double get lossDb;
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @JsonKey(name: 'azimuth_deg')
  double get azimuthDeg;
  bool get reachable;
  @JsonKey(name: 'itm_errno')
  int get itmErrno;
  List<LinkProfilePointModel> get profile;

  /// Create a copy of LinkDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LinkDetailModelCopyWith<LinkDetailModel> get copyWith =>
      _$LinkDetailModelCopyWithImpl<LinkDetailModel>(
          this as LinkDetailModel, _$identity);

  /// Serializes this LinkDetailModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinkDetailModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.lossDb, lossDb) || other.lossDb == lossDb) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.azimuthDeg, azimuthDeg) ||
                other.azimuthDeg == azimuthDeg) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable) &&
            (identical(other.itmErrno, itmErrno) ||
                other.itmErrno == itmErrno) &&
            const DeepCollectionEquality().equals(other.profile, profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      dbm,
      lossDb,
      distanceKm,
      azimuthDeg,
      reachable,
      itmErrno,
      const DeepCollectionEquality().hash(profile));

  @override
  String toString() {
    return 'LinkDetailModel(id: $id, dbm: $dbm, lossDb: $lossDb, distanceKm: $distanceKm, azimuthDeg: $azimuthDeg, reachable: $reachable, itmErrno: $itmErrno, profile: $profile)';
  }
}

/// @nodoc
abstract mixin class $LinkDetailModelCopyWith<$Res> {
  factory $LinkDetailModelCopyWith(
          LinkDetailModel value, $Res Function(LinkDetailModel) _then) =
      _$LinkDetailModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      double dbm,
      @JsonKey(name: 'loss_db') double lossDb,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'azimuth_deg') double azimuthDeg,
      bool reachable,
      @JsonKey(name: 'itm_errno') int itmErrno,
      List<LinkProfilePointModel> profile});
}

/// @nodoc
class _$LinkDetailModelCopyWithImpl<$Res>
    implements $LinkDetailModelCopyWith<$Res> {
  _$LinkDetailModelCopyWithImpl(this._self, this._then);

  final LinkDetailModel _self;
  final $Res Function(LinkDetailModel) _then;

  /// Create a copy of LinkDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dbm = null,
    Object? lossDb = null,
    Object? distanceKm = null,
    Object? azimuthDeg = null,
    Object? reachable = null,
    Object? itmErrno = null,
    Object? profile = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      itmErrno: null == itmErrno
          ? _self.itmErrno
          : itmErrno // ignore: cast_nullable_to_non_nullable
              as int,
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as List<LinkProfilePointModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [LinkDetailModel].
extension LinkDetailModelPatterns on LinkDetailModel {
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
    TResult Function(_LinkDetailModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LinkDetailModel() when $default != null:
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
    TResult Function(_LinkDetailModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkDetailModel():
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
    TResult? Function(_LinkDetailModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkDetailModel() when $default != null:
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
            double dbm,
            @JsonKey(name: 'loss_db') double lossDb,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'azimuth_deg') double azimuthDeg,
            bool reachable,
            @JsonKey(name: 'itm_errno') int itmErrno,
            List<LinkProfilePointModel> profile)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LinkDetailModel() when $default != null:
        return $default(_that.id, _that.dbm, _that.lossDb, _that.distanceKm,
            _that.azimuthDeg, _that.reachable, _that.itmErrno, _that.profile);
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
            double dbm,
            @JsonKey(name: 'loss_db') double lossDb,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'azimuth_deg') double azimuthDeg,
            bool reachable,
            @JsonKey(name: 'itm_errno') int itmErrno,
            List<LinkProfilePointModel> profile)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkDetailModel():
        return $default(_that.id, _that.dbm, _that.lossDb, _that.distanceKm,
            _that.azimuthDeg, _that.reachable, _that.itmErrno, _that.profile);
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
            double dbm,
            @JsonKey(name: 'loss_db') double lossDb,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'azimuth_deg') double azimuthDeg,
            bool reachable,
            @JsonKey(name: 'itm_errno') int itmErrno,
            List<LinkProfilePointModel> profile)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LinkDetailModel() when $default != null:
        return $default(_that.id, _that.dbm, _that.lossDb, _that.distanceKm,
            _that.azimuthDeg, _that.reachable, _that.itmErrno, _that.profile);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LinkDetailModel implements LinkDetailModel {
  const _LinkDetailModel(
      {required this.id,
      required this.dbm,
      @JsonKey(name: 'loss_db') required this.lossDb,
      @JsonKey(name: 'distance_km') required this.distanceKm,
      @JsonKey(name: 'azimuth_deg') required this.azimuthDeg,
      required this.reachable,
      @JsonKey(name: 'itm_errno') this.itmErrno = 0,
      final List<LinkProfilePointModel> profile = const []})
      : _profile = profile;
  factory _LinkDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LinkDetailModelFromJson(json);

  @override
  final String id;
  @override
  final double dbm;
  @override
  @JsonKey(name: 'loss_db')
  final double lossDb;
  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;
  @override
  @JsonKey(name: 'azimuth_deg')
  final double azimuthDeg;
  @override
  final bool reachable;
  @override
  @JsonKey(name: 'itm_errno')
  final int itmErrno;
  final List<LinkProfilePointModel> _profile;
  @override
  @JsonKey()
  List<LinkProfilePointModel> get profile {
    if (_profile is EqualUnmodifiableListView) return _profile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profile);
  }

  /// Create a copy of LinkDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LinkDetailModelCopyWith<_LinkDetailModel> get copyWith =>
      __$LinkDetailModelCopyWithImpl<_LinkDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LinkDetailModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LinkDetailModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dbm, dbm) || other.dbm == dbm) &&
            (identical(other.lossDb, lossDb) || other.lossDb == lossDb) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.azimuthDeg, azimuthDeg) ||
                other.azimuthDeg == azimuthDeg) &&
            (identical(other.reachable, reachable) ||
                other.reachable == reachable) &&
            (identical(other.itmErrno, itmErrno) ||
                other.itmErrno == itmErrno) &&
            const DeepCollectionEquality().equals(other._profile, _profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      dbm,
      lossDb,
      distanceKm,
      azimuthDeg,
      reachable,
      itmErrno,
      const DeepCollectionEquality().hash(_profile));

  @override
  String toString() {
    return 'LinkDetailModel(id: $id, dbm: $dbm, lossDb: $lossDb, distanceKm: $distanceKm, azimuthDeg: $azimuthDeg, reachable: $reachable, itmErrno: $itmErrno, profile: $profile)';
  }
}

/// @nodoc
abstract mixin class _$LinkDetailModelCopyWith<$Res>
    implements $LinkDetailModelCopyWith<$Res> {
  factory _$LinkDetailModelCopyWith(
          _LinkDetailModel value, $Res Function(_LinkDetailModel) _then) =
      __$LinkDetailModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      double dbm,
      @JsonKey(name: 'loss_db') double lossDb,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'azimuth_deg') double azimuthDeg,
      bool reachable,
      @JsonKey(name: 'itm_errno') int itmErrno,
      List<LinkProfilePointModel> profile});
}

/// @nodoc
class __$LinkDetailModelCopyWithImpl<$Res>
    implements _$LinkDetailModelCopyWith<$Res> {
  __$LinkDetailModelCopyWithImpl(this._self, this._then);

  final _LinkDetailModel _self;
  final $Res Function(_LinkDetailModel) _then;

  /// Create a copy of LinkDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? dbm = null,
    Object? lossDb = null,
    Object? distanceKm = null,
    Object? azimuthDeg = null,
    Object? reachable = null,
    Object? itmErrno = null,
    Object? profile = null,
  }) {
    return _then(_LinkDetailModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      itmErrno: null == itmErrno
          ? _self.itmErrno
          : itmErrno // ignore: cast_nullable_to_non_nullable
              as int,
      profile: null == profile
          ? _self._profile
          : profile // ignore: cast_nullable_to_non_nullable
              as List<LinkProfilePointModel>,
    ));
  }
}

// dart format on
