// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bm_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getBmDevice)
final getBmDeviceProvider = GetBmDeviceFamily._();

final class GetBmDeviceProvider extends $FunctionalProvider<
        AsyncValue<BmDevice>, BmDevice, FutureOr<BmDevice>>
    with $FutureModifier<BmDevice>, $FutureProvider<BmDevice> {
  GetBmDeviceProvider._(
      {required GetBmDeviceFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'getBmDeviceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getBmDeviceHash();

  @override
  String toString() {
    return r'getBmDeviceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<BmDevice> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<BmDevice> create(Ref ref) {
    final argument = this.argument as int;
    return getBmDevice(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetBmDeviceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getBmDeviceHash() => r'8718c975ec9a82b92a3b287fdcf747e05dfb2e32';

final class GetBmDeviceFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<BmDevice>, int> {
  GetBmDeviceFamily._()
      : super(
          retry: null,
          name: r'getBmDeviceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetBmDeviceProvider call(
    int deviceId,
  ) =>
      GetBmDeviceProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'getBmDeviceProvider';
}
