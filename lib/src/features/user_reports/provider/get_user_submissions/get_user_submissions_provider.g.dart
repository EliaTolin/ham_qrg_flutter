// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_submissions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserSubmissions)
final getUserSubmissionsProvider = GetUserSubmissionsProvider._();

final class GetUserSubmissionsProvider extends $FunctionalProvider<
        AsyncValue<List<UserSubmission>>,
        List<UserSubmission>,
        FutureOr<List<UserSubmission>>>
    with
        $FutureModifier<List<UserSubmission>>,
        $FutureProvider<List<UserSubmission>> {
  GetUserSubmissionsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getUserSubmissionsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserSubmissionsHash();

  @$internal
  @override
  $FutureProviderElement<List<UserSubmission>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserSubmission>> create(Ref ref) {
    return getUserSubmissions(ref);
  }
}

String _$getUserSubmissionsHash() =>
    r'e357394f33fc1f6db7618a86988ab90dbc1961b6';
