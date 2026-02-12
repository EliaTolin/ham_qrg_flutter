// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_propics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(uploadPropics)
final uploadPropicsProvider = UploadPropicsFamily._();

final class UploadPropicsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  UploadPropicsProvider._(
      {required UploadPropicsFamily super.from, required File super.argument})
      : super(
          retry: null,
          name: r'uploadPropicsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$uploadPropicsHash();

  @override
  String toString() {
    return r'uploadPropicsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as File;
    return uploadPropics(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UploadPropicsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$uploadPropicsHash() => r'97a5fdf11418eb576c6e10b194e8b976ccee8360';

final class UploadPropicsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, File> {
  UploadPropicsFamily._()
      : super(
          retry: null,
          name: r'uploadPropicsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UploadPropicsProvider call(
    File image,
  ) =>
      UploadPropicsProvider._(argument: image, from: this);

  @override
  String toString() => r'uploadPropicsProvider';
}
