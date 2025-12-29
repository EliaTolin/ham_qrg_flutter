// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_local_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeLocalDatasource)
final homeLocalDatasourceProvider = HomeLocalDatasourceProvider._();

final class HomeLocalDatasourceProvider extends $FunctionalProvider<
        AsyncValue<HomeDatasource>, HomeDatasource, FutureOr<HomeDatasource>>
    with $FutureModifier<HomeDatasource>, $FutureProvider<HomeDatasource> {
  HomeLocalDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeLocalDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeLocalDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<HomeDatasource> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HomeDatasource> create(Ref ref) {
    return homeLocalDatasource(ref);
  }
}

String _$homeLocalDatasourceHash() =>
    r'd2302c9a8db7e91a925ce373194a8d2c4f779aea';
