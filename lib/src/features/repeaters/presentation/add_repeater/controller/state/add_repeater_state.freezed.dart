// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_repeater_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddRepeaterState {
  String get name;
  String get callsign;
  String get frequency;
  String get shift;
  String get region;
  String get provinceCode;
  String get locality;
  String get latitude;
  String get longitude;
  String get locator;
  String get notes;
  List<SubmissionAccess> get accesses;
  bool get isConfirmed;
  bool get isSubmitting;

  /// Create a copy of AddRepeaterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddRepeaterStateCopyWith<AddRepeaterState> get copyWith =>
      _$AddRepeaterStateCopyWithImpl<AddRepeaterState>(
          this as AddRepeaterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddRepeaterState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other.accesses, accesses) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      callsign,
      frequency,
      shift,
      region,
      provinceCode,
      locality,
      latitude,
      longitude,
      locator,
      notes,
      const DeepCollectionEquality().hash(accesses),
      isConfirmed,
      isSubmitting);

  @override
  String toString() {
    return 'AddRepeaterState(name: $name, callsign: $callsign, frequency: $frequency, shift: $shift, region: $region, provinceCode: $provinceCode, locality: $locality, latitude: $latitude, longitude: $longitude, locator: $locator, notes: $notes, accesses: $accesses, isConfirmed: $isConfirmed, isSubmitting: $isSubmitting)';
  }
}

/// @nodoc
abstract mixin class $AddRepeaterStateCopyWith<$Res> {
  factory $AddRepeaterStateCopyWith(
          AddRepeaterState value, $Res Function(AddRepeaterState) _then) =
      _$AddRepeaterStateCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String callsign,
      String frequency,
      String shift,
      String region,
      String provinceCode,
      String locality,
      String latitude,
      String longitude,
      String locator,
      String notes,
      List<SubmissionAccess> accesses,
      bool isConfirmed,
      bool isSubmitting});
}

/// @nodoc
class _$AddRepeaterStateCopyWithImpl<$Res>
    implements $AddRepeaterStateCopyWith<$Res> {
  _$AddRepeaterStateCopyWithImpl(this._self, this._then);

  final AddRepeaterState _self;
  final $Res Function(AddRepeaterState) _then;

  /// Create a copy of AddRepeaterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? callsign = null,
    Object? frequency = null,
    Object? shift = null,
    Object? region = null,
    Object? provinceCode = null,
    Object? locality = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? locator = null,
    Object? notes = null,
    Object? accesses = null,
    Object? isConfirmed = null,
    Object? isSubmitting = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      callsign: null == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      shift: null == shift
          ? _self.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      provinceCode: null == provinceCode
          ? _self.provinceCode
          : provinceCode // ignore: cast_nullable_to_non_nullable
              as String,
      locality: null == locality
          ? _self.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      locator: null == locator
          ? _self.locator
          : locator // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      accesses: null == accesses
          ? _self.accesses
          : accesses // ignore: cast_nullable_to_non_nullable
              as List<SubmissionAccess>,
      isConfirmed: null == isConfirmed
          ? _self.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddRepeaterState].
extension AddRepeaterStatePatterns on AddRepeaterState {
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
    TResult Function(_AddRepeaterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRepeaterState() when $default != null:
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
    TResult Function(_AddRepeaterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRepeaterState():
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
    TResult? Function(_AddRepeaterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRepeaterState() when $default != null:
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
            String name,
            String callsign,
            String frequency,
            String shift,
            String region,
            String provinceCode,
            String locality,
            String latitude,
            String longitude,
            String locator,
            String notes,
            List<SubmissionAccess> accesses,
            bool isConfirmed,
            bool isSubmitting)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRepeaterState() when $default != null:
        return $default(
            _that.name,
            _that.callsign,
            _that.frequency,
            _that.shift,
            _that.region,
            _that.provinceCode,
            _that.locality,
            _that.latitude,
            _that.longitude,
            _that.locator,
            _that.notes,
            _that.accesses,
            _that.isConfirmed,
            _that.isSubmitting);
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
            String name,
            String callsign,
            String frequency,
            String shift,
            String region,
            String provinceCode,
            String locality,
            String latitude,
            String longitude,
            String locator,
            String notes,
            List<SubmissionAccess> accesses,
            bool isConfirmed,
            bool isSubmitting)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRepeaterState():
        return $default(
            _that.name,
            _that.callsign,
            _that.frequency,
            _that.shift,
            _that.region,
            _that.provinceCode,
            _that.locality,
            _that.latitude,
            _that.longitude,
            _that.locator,
            _that.notes,
            _that.accesses,
            _that.isConfirmed,
            _that.isSubmitting);
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
            String name,
            String callsign,
            String frequency,
            String shift,
            String region,
            String provinceCode,
            String locality,
            String latitude,
            String longitude,
            String locator,
            String notes,
            List<SubmissionAccess> accesses,
            bool isConfirmed,
            bool isSubmitting)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRepeaterState() when $default != null:
        return $default(
            _that.name,
            _that.callsign,
            _that.frequency,
            _that.shift,
            _that.region,
            _that.provinceCode,
            _that.locality,
            _that.latitude,
            _that.longitude,
            _that.locator,
            _that.notes,
            _that.accesses,
            _that.isConfirmed,
            _that.isSubmitting);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddRepeaterState implements AddRepeaterState {
  const _AddRepeaterState(
      {this.name = '',
      this.callsign = '',
      this.frequency = '',
      this.shift = '',
      this.region = '',
      this.provinceCode = '',
      this.locality = '',
      this.latitude = '',
      this.longitude = '',
      this.locator = '',
      this.notes = '',
      final List<SubmissionAccess> accesses = const [],
      this.isConfirmed = false,
      this.isSubmitting = false})
      : _accesses = accesses;

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String callsign;
  @override
  @JsonKey()
  final String frequency;
  @override
  @JsonKey()
  final String shift;
  @override
  @JsonKey()
  final String region;
  @override
  @JsonKey()
  final String provinceCode;
  @override
  @JsonKey()
  final String locality;
  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String longitude;
  @override
  @JsonKey()
  final String locator;
  @override
  @JsonKey()
  final String notes;
  final List<SubmissionAccess> _accesses;
  @override
  @JsonKey()
  List<SubmissionAccess> get accesses {
    if (_accesses is EqualUnmodifiableListView) return _accesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accesses);
  }

  @override
  @JsonKey()
  final bool isConfirmed;
  @override
  @JsonKey()
  final bool isSubmitting;

  /// Create a copy of AddRepeaterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddRepeaterStateCopyWith<_AddRepeaterState> get copyWith =>
      __$AddRepeaterStateCopyWithImpl<_AddRepeaterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddRepeaterState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locator, locator) || other.locator == locator) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._accesses, _accesses) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      callsign,
      frequency,
      shift,
      region,
      provinceCode,
      locality,
      latitude,
      longitude,
      locator,
      notes,
      const DeepCollectionEquality().hash(_accesses),
      isConfirmed,
      isSubmitting);

  @override
  String toString() {
    return 'AddRepeaterState(name: $name, callsign: $callsign, frequency: $frequency, shift: $shift, region: $region, provinceCode: $provinceCode, locality: $locality, latitude: $latitude, longitude: $longitude, locator: $locator, notes: $notes, accesses: $accesses, isConfirmed: $isConfirmed, isSubmitting: $isSubmitting)';
  }
}

/// @nodoc
abstract mixin class _$AddRepeaterStateCopyWith<$Res>
    implements $AddRepeaterStateCopyWith<$Res> {
  factory _$AddRepeaterStateCopyWith(
          _AddRepeaterState value, $Res Function(_AddRepeaterState) _then) =
      __$AddRepeaterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String callsign,
      String frequency,
      String shift,
      String region,
      String provinceCode,
      String locality,
      String latitude,
      String longitude,
      String locator,
      String notes,
      List<SubmissionAccess> accesses,
      bool isConfirmed,
      bool isSubmitting});
}

/// @nodoc
class __$AddRepeaterStateCopyWithImpl<$Res>
    implements _$AddRepeaterStateCopyWith<$Res> {
  __$AddRepeaterStateCopyWithImpl(this._self, this._then);

  final _AddRepeaterState _self;
  final $Res Function(_AddRepeaterState) _then;

  /// Create a copy of AddRepeaterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? callsign = null,
    Object? frequency = null,
    Object? shift = null,
    Object? region = null,
    Object? provinceCode = null,
    Object? locality = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? locator = null,
    Object? notes = null,
    Object? accesses = null,
    Object? isConfirmed = null,
    Object? isSubmitting = null,
  }) {
    return _then(_AddRepeaterState(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      callsign: null == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      shift: null == shift
          ? _self.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      provinceCode: null == provinceCode
          ? _self.provinceCode
          : provinceCode // ignore: cast_nullable_to_non_nullable
              as String,
      locality: null == locality
          ? _self.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      locator: null == locator
          ? _self.locator
          : locator // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      accesses: null == accesses
          ? _self._accesses
          : accesses // ignore: cast_nullable_to_non_nullable
              as List<SubmissionAccess>,
      isConfirmed: null == isConfirmed
          ? _self.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$SubmissionAccess {
  AccessMode get mode;
  String get ctcssTxHz;
  String get ctcssRxHz;
  String get dcsCode;
  String get colorCode;
  String get talkgroup;
  String get dgId;
  String get nodeId;
  String get networkName;
  String get notes;

  /// Create a copy of SubmissionAccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmissionAccessCopyWith<SubmissionAccess> get copyWith =>
      _$SubmissionAccessCopyWithImpl<SubmissionAccess>(
          this as SubmissionAccess, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubmissionAccess &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.ctcssTxHz, ctcssTxHz) ||
                other.ctcssTxHz == ctcssTxHz) &&
            (identical(other.ctcssRxHz, ctcssRxHz) ||
                other.ctcssRxHz == ctcssRxHz) &&
            (identical(other.dcsCode, dcsCode) || other.dcsCode == dcsCode) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.talkgroup, talkgroup) ||
                other.talkgroup == talkgroup) &&
            (identical(other.dgId, dgId) || other.dgId == dgId) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.networkName, networkName) ||
                other.networkName == networkName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, ctcssTxHz, ctcssRxHz,
      dcsCode, colorCode, talkgroup, dgId, nodeId, networkName, notes);

  @override
  String toString() {
    return 'SubmissionAccess(mode: $mode, ctcssTxHz: $ctcssTxHz, ctcssRxHz: $ctcssRxHz, dcsCode: $dcsCode, colorCode: $colorCode, talkgroup: $talkgroup, dgId: $dgId, nodeId: $nodeId, networkName: $networkName, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $SubmissionAccessCopyWith<$Res> {
  factory $SubmissionAccessCopyWith(
          SubmissionAccess value, $Res Function(SubmissionAccess) _then) =
      _$SubmissionAccessCopyWithImpl;
  @useResult
  $Res call(
      {AccessMode mode,
      String ctcssTxHz,
      String ctcssRxHz,
      String dcsCode,
      String colorCode,
      String talkgroup,
      String dgId,
      String nodeId,
      String networkName,
      String notes});
}

/// @nodoc
class _$SubmissionAccessCopyWithImpl<$Res>
    implements $SubmissionAccessCopyWith<$Res> {
  _$SubmissionAccessCopyWithImpl(this._self, this._then);

  final SubmissionAccess _self;
  final $Res Function(SubmissionAccess) _then;

  /// Create a copy of SubmissionAccess
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? ctcssTxHz = null,
    Object? ctcssRxHz = null,
    Object? dcsCode = null,
    Object? colorCode = null,
    Object? talkgroup = null,
    Object? dgId = null,
    Object? nodeId = null,
    Object? networkName = null,
    Object? notes = null,
  }) {
    return _then(_self.copyWith(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AccessMode,
      ctcssTxHz: null == ctcssTxHz
          ? _self.ctcssTxHz
          : ctcssTxHz // ignore: cast_nullable_to_non_nullable
              as String,
      ctcssRxHz: null == ctcssRxHz
          ? _self.ctcssRxHz
          : ctcssRxHz // ignore: cast_nullable_to_non_nullable
              as String,
      dcsCode: null == dcsCode
          ? _self.dcsCode
          : dcsCode // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      talkgroup: null == talkgroup
          ? _self.talkgroup
          : talkgroup // ignore: cast_nullable_to_non_nullable
              as String,
      dgId: null == dgId
          ? _self.dgId
          : dgId // ignore: cast_nullable_to_non_nullable
              as String,
      nodeId: null == nodeId
          ? _self.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      networkName: null == networkName
          ? _self.networkName
          : networkName // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubmissionAccess].
extension SubmissionAccessPatterns on SubmissionAccess {
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
    TResult Function(_SubmissionAccess value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionAccess() when $default != null:
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
    TResult Function(_SubmissionAccess value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionAccess():
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
    TResult? Function(_SubmissionAccess value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionAccess() when $default != null:
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
            AccessMode mode,
            String ctcssTxHz,
            String ctcssRxHz,
            String dcsCode,
            String colorCode,
            String talkgroup,
            String dgId,
            String nodeId,
            String networkName,
            String notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionAccess() when $default != null:
        return $default(
            _that.mode,
            _that.ctcssTxHz,
            _that.ctcssRxHz,
            _that.dcsCode,
            _that.colorCode,
            _that.talkgroup,
            _that.dgId,
            _that.nodeId,
            _that.networkName,
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
            AccessMode mode,
            String ctcssTxHz,
            String ctcssRxHz,
            String dcsCode,
            String colorCode,
            String talkgroup,
            String dgId,
            String nodeId,
            String networkName,
            String notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionAccess():
        return $default(
            _that.mode,
            _that.ctcssTxHz,
            _that.ctcssRxHz,
            _that.dcsCode,
            _that.colorCode,
            _that.talkgroup,
            _that.dgId,
            _that.nodeId,
            _that.networkName,
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
            AccessMode mode,
            String ctcssTxHz,
            String ctcssRxHz,
            String dcsCode,
            String colorCode,
            String talkgroup,
            String dgId,
            String nodeId,
            String networkName,
            String notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionAccess() when $default != null:
        return $default(
            _that.mode,
            _that.ctcssTxHz,
            _that.ctcssRxHz,
            _that.dcsCode,
            _that.colorCode,
            _that.talkgroup,
            _that.dgId,
            _that.nodeId,
            _that.networkName,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SubmissionAccess implements SubmissionAccess {
  const _SubmissionAccess(
      {required this.mode,
      this.ctcssTxHz = '',
      this.ctcssRxHz = '',
      this.dcsCode = '',
      this.colorCode = '',
      this.talkgroup = '',
      this.dgId = '',
      this.nodeId = '',
      this.networkName = '',
      this.notes = ''});

  @override
  final AccessMode mode;
  @override
  @JsonKey()
  final String ctcssTxHz;
  @override
  @JsonKey()
  final String ctcssRxHz;
  @override
  @JsonKey()
  final String dcsCode;
  @override
  @JsonKey()
  final String colorCode;
  @override
  @JsonKey()
  final String talkgroup;
  @override
  @JsonKey()
  final String dgId;
  @override
  @JsonKey()
  final String nodeId;
  @override
  @JsonKey()
  final String networkName;
  @override
  @JsonKey()
  final String notes;

  /// Create a copy of SubmissionAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubmissionAccessCopyWith<_SubmissionAccess> get copyWith =>
      __$SubmissionAccessCopyWithImpl<_SubmissionAccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubmissionAccess &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.ctcssTxHz, ctcssTxHz) ||
                other.ctcssTxHz == ctcssTxHz) &&
            (identical(other.ctcssRxHz, ctcssRxHz) ||
                other.ctcssRxHz == ctcssRxHz) &&
            (identical(other.dcsCode, dcsCode) || other.dcsCode == dcsCode) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.talkgroup, talkgroup) ||
                other.talkgroup == talkgroup) &&
            (identical(other.dgId, dgId) || other.dgId == dgId) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.networkName, networkName) ||
                other.networkName == networkName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, ctcssTxHz, ctcssRxHz,
      dcsCode, colorCode, talkgroup, dgId, nodeId, networkName, notes);

  @override
  String toString() {
    return 'SubmissionAccess(mode: $mode, ctcssTxHz: $ctcssTxHz, ctcssRxHz: $ctcssRxHz, dcsCode: $dcsCode, colorCode: $colorCode, talkgroup: $talkgroup, dgId: $dgId, nodeId: $nodeId, networkName: $networkName, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$SubmissionAccessCopyWith<$Res>
    implements $SubmissionAccessCopyWith<$Res> {
  factory _$SubmissionAccessCopyWith(
          _SubmissionAccess value, $Res Function(_SubmissionAccess) _then) =
      __$SubmissionAccessCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AccessMode mode,
      String ctcssTxHz,
      String ctcssRxHz,
      String dcsCode,
      String colorCode,
      String talkgroup,
      String dgId,
      String nodeId,
      String networkName,
      String notes});
}

/// @nodoc
class __$SubmissionAccessCopyWithImpl<$Res>
    implements _$SubmissionAccessCopyWith<$Res> {
  __$SubmissionAccessCopyWithImpl(this._self, this._then);

  final _SubmissionAccess _self;
  final $Res Function(_SubmissionAccess) _then;

  /// Create a copy of SubmissionAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mode = null,
    Object? ctcssTxHz = null,
    Object? ctcssRxHz = null,
    Object? dcsCode = null,
    Object? colorCode = null,
    Object? talkgroup = null,
    Object? dgId = null,
    Object? nodeId = null,
    Object? networkName = null,
    Object? notes = null,
  }) {
    return _then(_SubmissionAccess(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AccessMode,
      ctcssTxHz: null == ctcssTxHz
          ? _self.ctcssTxHz
          : ctcssTxHz // ignore: cast_nullable_to_non_nullable
              as String,
      ctcssRxHz: null == ctcssRxHz
          ? _self.ctcssRxHz
          : ctcssRxHz // ignore: cast_nullable_to_non_nullable
              as String,
      dcsCode: null == dcsCode
          ? _self.dcsCode
          : dcsCode // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      talkgroup: null == talkgroup
          ? _self.talkgroup
          : talkgroup // ignore: cast_nullable_to_non_nullable
              as String,
      dgId: null == dgId
          ? _self.dgId
          : dgId // ignore: cast_nullable_to_non_nullable
              as String,
      nodeId: null == nodeId
          ? _self.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      networkName: null == networkName
          ? _self.networkName
          : networkName // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
