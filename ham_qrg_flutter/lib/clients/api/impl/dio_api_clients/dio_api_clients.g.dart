// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_api_clients.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_dio)
final _dioProvider = _DioFamily._();

final class _DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  _DioProvider._(
      {required _DioFamily super.from,
      required ({
        TalkerDioLogger talkerDioLogger,
        String? token,
        String? baseUrl,
      })
          super.argument})
      : super(
          retry: null,
          name: r'_dioProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$_dioHash();

  @override
  String toString() {
    return r'_dioProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    final argument = this.argument as ({
      TalkerDioLogger talkerDioLogger,
      String? token,
      String? baseUrl,
    });
    return _dio(
      ref,
      talkerDioLogger: argument.talkerDioLogger,
      token: argument.token,
      baseUrl: argument.baseUrl,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _DioProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_dioHash() => r'3b45d47f1f6221c1f453d937a7b6c78f0b4ec8a8';

final class _DioFamily extends $Family
    with
        $FunctionalFamilyOverride<
            Dio,
            ({
              TalkerDioLogger talkerDioLogger,
              String? token,
              String? baseUrl,
            })> {
  _DioFamily._()
      : super(
          retry: null,
          name: r'_dioProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  _DioProvider call({
    required TalkerDioLogger talkerDioLogger,
    required String? token,
    String? baseUrl,
  }) =>
      _DioProvider._(argument: (
        talkerDioLogger: talkerDioLogger,
        token: token,
        baseUrl: baseUrl,
      ), from: this);

  @override
  String toString() => r'_dioProvider';
}

@ProviderFor(dioResponseMapper)
final dioResponseMapperProvider = DioResponseMapperProvider._();

final class DioResponseMapperProvider extends $FunctionalProvider<
    ResponseMappers<dynamic>,
    ResponseMappers<dynamic>,
    ResponseMappers<dynamic>> with $Provider<ResponseMappers<dynamic>> {
  DioResponseMapperProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dioResponseMapperProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dioResponseMapperHash();

  @$internal
  @override
  $ProviderElement<ResponseMappers<dynamic>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ResponseMappers<dynamic> create(Ref ref) {
    return dioResponseMapper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResponseMappers<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResponseMappers<dynamic>>(value),
    );
  }
}

String _$dioResponseMapperHash() => r'6d6613cc2ccc74e9fb702bc6ce5517c892e9d30b';

@ProviderFor(dioApiClient)
final dioApiClientProvider = DioApiClientFamily._();

final class DioApiClientProvider extends $FunctionalProvider<
        AsyncValue<DioApiClient>, DioApiClient, FutureOr<DioApiClient>>
    with $FutureModifier<DioApiClient>, $FutureProvider<DioApiClient> {
  DioApiClientProvider._(
      {required DioApiClientFamily super.from,
      required ({
        String? baseUrl,
        String? token,
      })
          super.argument})
      : super(
          retry: null,
          name: r'dioApiClientProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dioApiClientHash();

  @override
  String toString() {
    return r'dioApiClientProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<DioApiClient> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DioApiClient> create(Ref ref) {
    final argument = this.argument as ({
      String? baseUrl,
      String? token,
    });
    return dioApiClient(
      ref,
      baseUrl: argument.baseUrl,
      token: argument.token,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DioApiClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dioApiClientHash() => r'df9fb4bcf97293da3de10f4f3274809bea42fd2c';

final class DioApiClientFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<DioApiClient>,
            ({
              String? baseUrl,
              String? token,
            })> {
  DioApiClientFamily._()
      : super(
          retry: null,
          name: r'dioApiClientProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DioApiClientProvider call({
    String? baseUrl,
    String? token,
  }) =>
      DioApiClientProvider._(argument: (
        baseUrl: baseUrl,
        token: token,
      ), from: this);

  @override
  String toString() => r'dioApiClientProvider';
}
