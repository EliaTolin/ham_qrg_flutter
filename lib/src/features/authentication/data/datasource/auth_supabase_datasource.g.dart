// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_supabase_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authSupabaseDatasource)
final authSupabaseDatasourceProvider = AuthSupabaseDatasourceProvider._();

final class AuthSupabaseDatasourceProvider extends $FunctionalProvider<
        AsyncValue<AuthSupabaseDatasource>,
        AuthSupabaseDatasource,
        FutureOr<AuthSupabaseDatasource>>
    with
        $FutureModifier<AuthSupabaseDatasource>,
        $FutureProvider<AuthSupabaseDatasource> {
  AuthSupabaseDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authSupabaseDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authSupabaseDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<AuthSupabaseDatasource> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AuthSupabaseDatasource> create(Ref ref) {
    return authSupabaseDatasource(ref);
  }
}

String _$authSupabaseDatasourceHash() =>
    r'27a3cc27f09180ca0234eda8d73e2b9426d7d1a1';
