// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(paramRepository)
final paramRepositoryProvider = ParamRepositoryProvider._();

final class ParamRepositoryProvider extends $FunctionalProvider<ParamRepository,
    ParamRepository, ParamRepository> with $Provider<ParamRepository> {
  ParamRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'paramRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paramRepositoryHash();

  @$internal
  @override
  $ProviderElement<ParamRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ParamRepository create(Ref ref) {
    return paramRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ParamRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ParamRepository>(value),
    );
  }
}

String _$paramRepositoryHash() => r'dd93a317fb0153a8dddd5a869021239a69e230ba';
