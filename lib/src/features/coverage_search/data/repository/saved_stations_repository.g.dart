// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_stations_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(savedStationsRepository)
final savedStationsRepositoryProvider = SavedStationsRepositoryProvider._();

final class SavedStationsRepositoryProvider extends $FunctionalProvider<
        AsyncValue<SavedStationsRepository>,
        SavedStationsRepository,
        FutureOr<SavedStationsRepository>>
    with
        $FutureModifier<SavedStationsRepository>,
        $FutureProvider<SavedStationsRepository> {
  SavedStationsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savedStationsRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savedStationsRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<SavedStationsRepository> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SavedStationsRepository> create(Ref ref) {
    return savedStationsRepository(ref);
  }
}

String _$savedStationsRepositoryHash() =>
    r'af9f3a5c969de669a1c98884c2d615fe09aa8fc8';
