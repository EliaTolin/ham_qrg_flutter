// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(changePassword)
final changePasswordProvider = ChangePasswordFamily._();

final class ChangePasswordProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  ChangePasswordProvider._(
      {required ChangePasswordFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'changePasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$changePasswordHash();

  @override
  String toString() {
    return r'changePasswordProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return changePassword(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChangePasswordProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$changePasswordHash() => r'f550b15e3e915624e5c58ef4e60081fdc31df29e';

final class ChangePasswordFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  ChangePasswordFamily._()
      : super(
          retry: null,
          name: r'changePasswordProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ChangePasswordProvider call(
    String password,
  ) =>
      ChangePasswordProvider._(argument: password, from: this);

  @override
  String toString() => r'changePasswordProvider';
}
