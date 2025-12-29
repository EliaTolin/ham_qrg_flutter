// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_storage_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_flutterSecureStorage)
final _flutterSecureStorageProvider = _FlutterSecureStorageProvider._();

final class _FlutterSecureStorageProvider extends $FunctionalProvider<
    FlutterSecureStorage,
    FlutterSecureStorage,
    FlutterSecureStorage> with $Provider<FlutterSecureStorage> {
  _FlutterSecureStorageProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'_flutterSecureStorageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$_flutterSecureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return _flutterSecureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$_flutterSecureStorageHash() =>
    r'424335f229892260797667f93ac55781b3ca9f1a';

@ProviderFor(secureStorageClient)
final secureStorageClientProvider = SecureStorageClientProvider._();

final class SecureStorageClientProvider extends $FunctionalProvider<
        AsyncValue<StorageClient>, StorageClient, FutureOr<StorageClient>>
    with $FutureModifier<StorageClient>, $FutureProvider<StorageClient> {
  SecureStorageClientProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'secureStorageClientProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$secureStorageClientHash();

  @$internal
  @override
  $FutureProviderElement<StorageClient> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<StorageClient> create(Ref ref) {
    return secureStorageClient(ref);
  }
}

String _$secureStorageClientHash() =>
    r'db9b1eb450c7602ad0ead06895873d325228e7e7';
