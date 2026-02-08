// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bm_talkgroup_names_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Fetches the full BrandMeister talkgroup name registry: `{tgId: name}`.

@ProviderFor(getBmTalkgroupNames)
final getBmTalkgroupNamesProvider = GetBmTalkgroupNamesProvider._();

/// Fetches the full BrandMeister talkgroup name registry: `{tgId: name}`.

final class GetBmTalkgroupNamesProvider extends $FunctionalProvider<
        AsyncValue<Map<String, String>>,
        Map<String, String>,
        FutureOr<Map<String, String>>>
    with
        $FutureModifier<Map<String, String>>,
        $FutureProvider<Map<String, String>> {
  /// Fetches the full BrandMeister talkgroup name registry: `{tgId: name}`.
  GetBmTalkgroupNamesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getBmTalkgroupNamesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getBmTalkgroupNamesHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, String>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, String>> create(Ref ref) {
    return getBmTalkgroupNames(ref);
  }
}

String _$getBmTalkgroupNamesHash() =>
    r'e67fa0f4f46a4579dbe6048143d028ee1657d87b';
