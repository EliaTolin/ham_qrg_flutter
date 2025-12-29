// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_pref_storage_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_sharedPreferences)
final _sharedPreferencesProvider = _SharedPreferencesProvider._();

final class _SharedPreferencesProvider extends $FunctionalProvider<
        AsyncValue<SharedPreferences>,
        SharedPreferences,
        FutureOr<SharedPreferences>>
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  _SharedPreferencesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'_sharedPreferencesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$_sharedPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return _sharedPreferences(ref);
  }
}

String _$_sharedPreferencesHash() =>
    r'a20d3a2ec6ca1b476d47637177bb4ce55823fb2e';

@ProviderFor(sharedPrefStorageClient)
final sharedPrefStorageClientProvider = SharedPrefStorageClientProvider._();

final class SharedPrefStorageClientProvider extends $FunctionalProvider<
        AsyncValue<StorageClient>, StorageClient, FutureOr<StorageClient>>
    with $FutureModifier<StorageClient>, $FutureProvider<StorageClient> {
  SharedPrefStorageClientProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sharedPrefStorageClientProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sharedPrefStorageClientHash();

  @$internal
  @override
  $FutureProviderElement<StorageClient> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<StorageClient> create(Ref ref) {
    return sharedPrefStorageClient(ref);
  }
}

String _$sharedPrefStorageClientHash() =>
    r'8c174807b42e1e332a26c4ff78fd607e9a65599c';
