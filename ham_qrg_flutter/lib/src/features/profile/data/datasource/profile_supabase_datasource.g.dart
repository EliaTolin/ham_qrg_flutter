// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_supabase_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profileSupabaseDatasource)
final profileSupabaseDatasourceProvider = ProfileSupabaseDatasourceProvider._();

final class ProfileSupabaseDatasourceProvider extends $FunctionalProvider<
    ProfileDatasource,
    ProfileDatasource,
    ProfileDatasource> with $Provider<ProfileDatasource> {
  ProfileSupabaseDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'profileSupabaseDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$profileSupabaseDatasourceHash();

  @$internal
  @override
  $ProviderElement<ProfileDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProfileDatasource create(Ref ref) {
    return profileSupabaseDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileDatasource>(value),
    );
  }
}

String _$profileSupabaseDatasourceHash() =>
    r'6a62345e7ad1953630d129bc4428ea45564b1a85';
