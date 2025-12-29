// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_id_from_email_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserIdFromEmail)
final getUserIdFromEmailProvider = GetUserIdFromEmailFamily._();

final class GetUserIdFromEmailProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  GetUserIdFromEmailProvider._(
      {required GetUserIdFromEmailFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getUserIdFromEmailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserIdFromEmailHash();

  @override
  String toString() {
    return r'getUserIdFromEmailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as String;
    return getUserIdFromEmail(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserIdFromEmailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserIdFromEmailHash() =>
    r'92bf0a7d9fad9140f08b3564e88e0700c2368355';

final class GetUserIdFromEmailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  GetUserIdFromEmailFamily._()
      : super(
          retry: null,
          name: r'getUserIdFromEmailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetUserIdFromEmailProvider call(
    String email,
  ) =>
      GetUserIdFromEmailProvider._(argument: email, from: this);

  @override
  String toString() => r'getUserIdFromEmailProvider';
}
