// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talker_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(talkerService)
final talkerServiceProvider = TalkerServiceProvider._();

final class TalkerServiceProvider
    extends $FunctionalProvider<Talker, Talker, Talker> with $Provider<Talker> {
  TalkerServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'talkerServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$talkerServiceHash();

  @$internal
  @override
  $ProviderElement<Talker> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Talker create(Ref ref) {
    return talkerService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Talker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Talker>(value),
    );
  }
}

String _$talkerServiceHash() => r'b50886bd225374c3e966e032017c94f1b4c33fe0';

@ProviderFor(talkerDioLogger)
final talkerDioLoggerProvider = TalkerDioLoggerProvider._();

final class TalkerDioLoggerProvider extends $FunctionalProvider<TalkerDioLogger,
    TalkerDioLogger, TalkerDioLogger> with $Provider<TalkerDioLogger> {
  TalkerDioLoggerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'talkerDioLoggerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$talkerDioLoggerHash();

  @$internal
  @override
  $ProviderElement<TalkerDioLogger> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TalkerDioLogger create(Ref ref) {
    return talkerDioLogger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TalkerDioLogger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TalkerDioLogger>(value),
    );
  }
}

String _$talkerDioLoggerHash() => r'4ac9e4e26520b41a4270061c599da0c82fb2981c';
