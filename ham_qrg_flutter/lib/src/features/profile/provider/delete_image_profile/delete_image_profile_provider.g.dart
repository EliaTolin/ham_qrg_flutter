// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_image_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deleteImageProfile)
final deleteImageProfileProvider = DeleteImageProfileProvider._();

final class DeleteImageProfileProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  DeleteImageProfileProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteImageProfileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteImageProfileHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return deleteImageProfile(ref);
  }
}

String _$deleteImageProfileHash() =>
    r'54ea23b5893490342d4c342ca9f62975635b6491';
