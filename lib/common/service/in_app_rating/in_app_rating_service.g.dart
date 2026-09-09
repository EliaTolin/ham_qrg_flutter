// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_rating_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `keepAlive`: le due bandiere di sessione (avvio già contato, recensione già
/// chiesta) vivono nell'istanza, e un provider ricreato le azzererebbe —
/// l'avvio verrebbe contato due volte e il prompt potrebbe ripresentarsi nello
/// stesso avvio.

@ProviderFor(inAppRatingService)
final inAppRatingServiceProvider = InAppRatingServiceProvider._();

/// `keepAlive`: le due bandiere di sessione (avvio già contato, recensione già
/// chiesta) vivono nell'istanza, e un provider ricreato le azzererebbe —
/// l'avvio verrebbe contato due volte e il prompt potrebbe ripresentarsi nello
/// stesso avvio.

final class InAppRatingServiceProvider extends $FunctionalProvider<
    InAppRatingService,
    InAppRatingService,
    InAppRatingService> with $Provider<InAppRatingService> {
  /// `keepAlive`: le due bandiere di sessione (avvio già contato, recensione già
  /// chiesta) vivono nell'istanza, e un provider ricreato le azzererebbe —
  /// l'avvio verrebbe contato due volte e il prompt potrebbe ripresentarsi nello
  /// stesso avvio.
  InAppRatingServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'inAppRatingServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$inAppRatingServiceHash();

  @$internal
  @override
  $ProviderElement<InAppRatingService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InAppRatingService create(Ref ref) {
    return inAppRatingService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InAppRatingService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InAppRatingService>(value),
    );
  }
}

String _$inAppRatingServiceHash() =>
    r'e7a7ce79d67fe68da13677ffe39c176746d953ef';
