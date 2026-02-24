// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altimetric_profile_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(altimetricProfileRepository)
final altimetricProfileRepositoryProvider =
    AltimetricProfileRepositoryProvider._();

final class AltimetricProfileRepositoryProvider extends $FunctionalProvider<
    AltimetricProfileRepository,
    AltimetricProfileRepository,
    AltimetricProfileRepository> with $Provider<AltimetricProfileRepository> {
  AltimetricProfileRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'altimetricProfileRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$altimetricProfileRepositoryHash();

  @$internal
  @override
  $ProviderElement<AltimetricProfileRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AltimetricProfileRepository create(Ref ref) {
    return altimetricProfileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AltimetricProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AltimetricProfileRepository>(value),
    );
  }
}

String _$altimetricProfileRepositoryHash() =>
    r'541f4415c39d1c5dc7ef2c88b5fc38fd10949026';
