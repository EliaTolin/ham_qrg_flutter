import 'package:hamqrg/config/app_configs.dart';

/// Costruttore dei link condivisibili che riaprono l'app.
///
/// Tutto ciò che può aprire HamQRG sta sotto `/app/`, e nient'altro del sito
/// lo fa: `apple-app-site-association` e l'intent filter Android sono limitati
/// a quel prefisso. Oltre il prefisso il percorso è già quello del router
/// dell'app, quindi una stazione è `/app/home/repeater/<id>`.
///
/// Chi non ha l'app riceve la pagina web corrispondente: il sito reindirizza
/// il link alla scheda del ripetitore.
class DeepLinkUtils {
  const DeepLinkUtils._();

  /// Prefisso dei link universali. Deve restare allineato a
  /// `_deepLinkPrefix` in `lib/src/app.dart` e ai file di associazione
  /// pubblicati dal sito.
  static const prefix = '/app';

  /// [path] è un percorso del router dell'app, con o senza slash iniziale.
  static String buildDeepLink(String path) {
    // `getSite()` termina con uno slash: senza questa normalizzazione il link
    // uscirebbe con un doppio slash e non verrebbe riconosciuto.
    final site = AppConfigs.getSite().replaceAll(RegExp(r'/+$'), '');
    final route = path.startsWith('/') ? path : '/$path';
    return '$site$prefix$route';
  }

  /// Link diretto alla scheda di un ripetitore.
  ///
  /// L'identificativo è l'UUID del database, non lo slug usato dal sito: lo
  /// slug esiste per le persone e per i motori di ricerca, l'UUID è ciò che
  /// il router dell'app risolve.
  static String repeater(String repeaterId) =>
      buildDeepLink('/home/repeater/$repeaterId');

  /// Link alla mappa.
  static String map() => buildDeepLink('/home/map');
}
