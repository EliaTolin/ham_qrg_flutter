// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repeaters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(searchRepeaters)
final searchRepeatersProvider = SearchRepeatersFamily._();

final class SearchRepeatersProvider extends $FunctionalProvider<
        AsyncValue<List<Repeater>>, List<Repeater>, FutureOr<List<Repeater>>>
    with $FutureModifier<List<Repeater>>, $FutureProvider<List<Repeater>> {
  SearchRepeatersProvider._(
      {required SearchRepeatersFamily super.from,
      required ({
        String query,
        int limit,
        List<AccessMode>? accessModes,
      })
          super.argument})
      : super(
          retry: null,
          name: r'searchRepeatersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchRepeatersHash();

  @override
  String toString() {
    return r'searchRepeatersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Repeater>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Repeater>> create(Ref ref) {
    final argument = this.argument as ({
      String query,
      int limit,
      List<AccessMode>? accessModes,
    });
    return searchRepeaters(
      ref,
      query: argument.query,
      limit: argument.limit,
      accessModes: argument.accessModes,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchRepeatersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchRepeatersHash() => r'e7b7801388af747b861471b01dae47540b5c9ae0';

final class SearchRepeatersFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Repeater>>,
            ({
              String query,
              int limit,
              List<AccessMode>? accessModes,
            })> {
  SearchRepeatersFamily._()
      : super(
          retry: null,
          name: r'searchRepeatersProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SearchRepeatersProvider call({
    required String query,
    int limit = 100,
    List<AccessMode>? accessModes,
  }) =>
      SearchRepeatersProvider._(argument: (
        query: query,
        limit: limit,
        accessModes: accessModes,
      ), from: this);

  @override
  String toString() => r'searchRepeatersProvider';
}
