// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reports_supabase_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userReportsSupabaseDatasource)
final userReportsSupabaseDatasourceProvider =
    UserReportsSupabaseDatasourceProvider._();

final class UserReportsSupabaseDatasourceProvider extends $FunctionalProvider<
    UserReportsDatasource,
    UserReportsDatasource,
    UserReportsDatasource> with $Provider<UserReportsDatasource> {
  UserReportsSupabaseDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userReportsSupabaseDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userReportsSupabaseDatasourceHash();

  @$internal
  @override
  $ProviderElement<UserReportsDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserReportsDatasource create(Ref ref) {
    return userReportsSupabaseDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserReportsDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserReportsDatasource>(value),
    );
  }
}

String _$userReportsSupabaseDatasourceHash() =>
    r'f16d8599e22d413cc6a48bf5569b7add35db86eb';
