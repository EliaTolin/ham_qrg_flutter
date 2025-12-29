// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserId)
final getUserIdProvider = GetUserIdProvider._();

final class GetUserIdProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  GetUserIdProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getUserIdProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserIdHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return getUserId(ref);
  }
}

String _$getUserIdHash() => r'fad56e38eb14233602a21d0aab9d246a03882e2d';
