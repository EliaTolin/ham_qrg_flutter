// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_image_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getImageProfile)
final getImageProfileProvider = GetImageProfileFamily._();

final class GetImageProfileProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  GetImageProfileProvider._(
      {required GetImageProfileFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getImageProfileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getImageProfileHash();

  @override
  String toString() {
    return r'getImageProfileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as String;
    return getImageProfile(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetImageProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getImageProfileHash() => r'42edf364bae34dae48acc99b2255edb67a14d1bc';

final class GetImageProfileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String>, String> {
  GetImageProfileFamily._()
      : super(
          retry: null,
          name: r'getImageProfileProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetImageProfileProvider call(
    String path,
  ) =>
      GetImageProfileProvider._(argument: path, from: this);

  @override
  String toString() => r'getImageProfileProvider';
}
