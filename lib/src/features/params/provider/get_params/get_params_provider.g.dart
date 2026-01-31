// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_params_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getParams)
final getParamsProvider = GetParamsProvider._();

final class GetParamsProvider extends $FunctionalProvider<
        AsyncValue<List<Param>>, List<Param>, FutureOr<List<Param>>>
    with $FutureModifier<List<Param>>, $FutureProvider<List<Param>> {
  GetParamsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getParamsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getParamsHash();

  @$internal
  @override
  $FutureProviderElement<List<Param>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Param>> create(Ref ref) {
    return getParams(ref);
  }
}

String _$getParamsHash() => r'365ef30025647b2aaddfec617463fd22f5e19886';

@ProviderFor(getParamByKey)
final getParamByKeyProvider = GetParamByKeyFamily._();

final class GetParamByKeyProvider
    extends $FunctionalProvider<AsyncValue<Param?>, Param?, FutureOr<Param?>>
    with $FutureModifier<Param?>, $FutureProvider<Param?> {
  GetParamByKeyProvider._(
      {required GetParamByKeyFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'getParamByKeyProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getParamByKeyHash();

  @override
  String toString() {
    return r'getParamByKeyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Param?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Param?> create(Ref ref) {
    final argument = this.argument as String;
    return getParamByKey(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetParamByKeyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getParamByKeyHash() => r'240952a24f77fc2d51e6365e4404c4d92e082b4f';

final class GetParamByKeyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Param?>, String> {
  GetParamByKeyFamily._()
      : super(
          retry: null,
          name: r'getParamByKeyProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetParamByKeyProvider call(
    String key,
  ) =>
      GetParamByKeyProvider._(argument: key, from: this);

  @override
  String toString() => r'getParamByKeyProvider';
}
