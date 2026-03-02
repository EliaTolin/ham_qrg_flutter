// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reports_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userReportsRepository)
final userReportsRepositoryProvider = UserReportsRepositoryProvider._();

final class UserReportsRepositoryProvider extends $FunctionalProvider<
    UserReportsRepository,
    UserReportsRepository,
    UserReportsRepository> with $Provider<UserReportsRepository> {
  UserReportsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userReportsRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userReportsRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserReportsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserReportsRepository create(Ref ref) {
    return userReportsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserReportsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserReportsRepository>(value),
    );
  }
}

String _$userReportsRepositoryHash() =>
    r'a8ae111018023a1bb09e5743fb29f27c2344d065';
