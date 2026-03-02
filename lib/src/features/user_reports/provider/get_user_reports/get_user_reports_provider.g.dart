// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_reports_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserReports)
final getUserReportsProvider = GetUserReportsProvider._();

final class GetUserReportsProvider extends $FunctionalProvider<
        AsyncValue<List<UserReport>>,
        List<UserReport>,
        FutureOr<List<UserReport>>>
    with $FutureModifier<List<UserReport>>, $FutureProvider<List<UserReport>> {
  GetUserReportsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getUserReportsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserReportsHash();

  @$internal
  @override
  $FutureProviderElement<List<UserReport>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserReport>> create(Ref ref) {
    return getUserReports(ref);
  }
}

String _$getUserReportsHash() => r'02631a52351b05f9788a3d7f036aedae65fd233f';
