// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bm_talkgroups_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getBmTalkgroups)
final getBmTalkgroupsProvider = GetBmTalkgroupsFamily._();

final class GetBmTalkgroupsProvider extends $FunctionalProvider<
        AsyncValue<List<BmTalkgroup>>,
        List<BmTalkgroup>,
        FutureOr<List<BmTalkgroup>>>
    with
        $FutureModifier<List<BmTalkgroup>>,
        $FutureProvider<List<BmTalkgroup>> {
  GetBmTalkgroupsProvider._(
      {required GetBmTalkgroupsFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'getBmTalkgroupsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getBmTalkgroupsHash();

  @override
  String toString() {
    return r'getBmTalkgroupsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<BmTalkgroup>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<BmTalkgroup>> create(Ref ref) {
    final argument = this.argument as int;
    return getBmTalkgroups(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetBmTalkgroupsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getBmTalkgroupsHash() => r'c5e0be716739feab6439aa78f0eae72e10251d51';

final class GetBmTalkgroupsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<BmTalkgroup>>, int> {
  GetBmTalkgroupsFamily._()
      : super(
          retry: null,
          name: r'getBmTalkgroupsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetBmTalkgroupsProvider call(
    int deviceId,
  ) =>
      GetBmTalkgroupsProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'getBmTalkgroupsProvider';
}
