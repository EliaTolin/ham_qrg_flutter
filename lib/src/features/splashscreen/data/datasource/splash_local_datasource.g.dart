// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_local_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(splashLocalDatasource)
final splashLocalDatasourceProvider = SplashLocalDatasourceProvider._();

final class SplashLocalDatasourceProvider extends $FunctionalProvider<
        AsyncValue<SplashDatasource>,
        SplashDatasource,
        FutureOr<SplashDatasource>>
    with $FutureModifier<SplashDatasource>, $FutureProvider<SplashDatasource> {
  SplashLocalDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'splashLocalDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$splashLocalDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<SplashDatasource> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SplashDatasource> create(Ref ref) {
    return splashLocalDatasource(ref);
  }
}

String _$splashLocalDatasourceHash() =>
    r'a4fd8e5dfa21cd2380f1b9ec9f33a2aed868b3e0';
