// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefs_saved_stations_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(savedStationsDatasource)
final savedStationsDatasourceProvider = SavedStationsDatasourceProvider._();

final class SavedStationsDatasourceProvider extends $FunctionalProvider<
        AsyncValue<SavedStationsDatasource>,
        SavedStationsDatasource,
        FutureOr<SavedStationsDatasource>>
    with
        $FutureModifier<SavedStationsDatasource>,
        $FutureProvider<SavedStationsDatasource> {
  SavedStationsDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savedStationsDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savedStationsDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<SavedStationsDatasource> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SavedStationsDatasource> create(Ref ref) {
    return savedStationsDatasource(ref);
  }
}

String _$savedStationsDatasourceHash() =>
    r'2e473c7a5e172512669d9a5af35f7b8dcc04d70d';
