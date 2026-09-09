import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/service/in_app_rating/in_app_rating_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Widget invisibile che chiede la recensione quando la schermata si è posata.
///
/// Sta in un widget e non nel controller perché il *momento* è metà del
/// lavoro: il prompt di sistema è modale e ruba il primo gesto: presentarlo
/// mentre la home si sta ancora componendo lo fa arrivare addosso a un utente
/// che stava per toccare altro, ed è il modo più rapido di trasformare una
/// richiesta in un fastidio (e in una stella in meno).
///
/// Le condizioni su *quando* è lecito chiedere stanno tutte in
/// [InAppRatingService]: qui c'è solo il momento buono.
class InAppRatingTrigger extends HookConsumerWidget {
  const InAppRatingTrigger({super.key});

  /// Attesa dopo il primo frame: abbastanza perché la home sia disegnata e
  /// l'utente l'abbia guardata, poco perché sia ancora lì.
  static const _settleDelay = Duration(seconds: 4);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        var cancelled = false;

        unawaited(
          Future<void>.delayed(_settleDelay).then((_) async {
            if (cancelled || !context.mounted) return;
            if (!_isFrontmost(context)) return;
            await ref.read(inAppRatingServiceProvider).requestReviewIfNeeded();
          }),
        );

        return () => cancelled = true;
      },
      const [],
    );

    return const SizedBox.shrink();
  }

  /// `true` se davanti a questa pagina non c'è nient'altro.
  ///
  /// Due domande diverse e ugualmente necessarie: che nel navigator di questa
  /// pagina non sia stata spinta un'altra rotta, e che sul navigator radice
  /// non sia aperta una modale (changelog, dialog di aggiornamento richiesto,
  /// paywall). Sovrapporre il prompt di sistema a una di quelle significa
  /// coprire la modale e perdere entrambe le interazioni.
  bool _isFrontmost(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route == null || !route.isCurrent) return false;
    return !Navigator.of(context, rootNavigator: true).canPop();
  }
}
