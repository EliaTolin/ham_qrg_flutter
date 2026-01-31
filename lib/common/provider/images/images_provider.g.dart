// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(uploadImage)
final uploadImageProvider = UploadImageFamily._();

final class UploadImageProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  UploadImageProvider._(
      {required UploadImageFamily super.from,
      required (
        String,
        File,
        String, {
        bool upsert,
      })
          super.argument})
      : super(
          retry: null,
          name: r'uploadImageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$uploadImageHash();

  @override
  String toString() {
    return r'uploadImageProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as (
      String,
      File,
      String, {
      bool upsert,
    });
    return uploadImage(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
      upsert: argument.upsert,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UploadImageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$uploadImageHash() => r'd60776d22ee4a338e3239500b0908dd606ac4495';

final class UploadImageFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<String>,
            (
              String,
              File,
              String, {
              bool upsert,
            })> {
  UploadImageFamily._()
      : super(
          retry: null,
          name: r'uploadImageProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UploadImageProvider call(
    String bucketName,
    File image,
    String filePath, {
    bool upsert = true,
  }) =>
      UploadImageProvider._(argument: (
        bucketName,
        image,
        filePath,
        upsert: upsert,
      ), from: this);

  @override
  String toString() => r'uploadImageProvider';
}
