// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_caching_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(imageCachingService)
final imageCachingServiceProvider = ImageCachingServiceProvider._();

final class ImageCachingServiceProvider extends $FunctionalProvider<
        AsyncValue<ImageCachingService>,
        ImageCachingService,
        FutureOr<ImageCachingService>>
    with
        $FutureModifier<ImageCachingService>,
        $FutureProvider<ImageCachingService> {
  ImageCachingServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'imageCachingServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$imageCachingServiceHash();

  @$internal
  @override
  $FutureProviderElement<ImageCachingService> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ImageCachingService> create(Ref ref) {
    return imageCachingService(ref);
  }
}

String _$imageCachingServiceHash() =>
    r'2748faaf9530c9bba9868a34ef594827c5c614c9';
