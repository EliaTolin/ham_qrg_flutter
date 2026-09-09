import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Tiene in vita il risultato di un provider autoDispose per un tempo dato.
extension KeepAliveForRef on Ref {
  /// Sopravvive [duration] all'ultimo ascoltatore, poi torna a smaltirsi da
  /// solo.
  ///
  /// Serve a non buttare via il lavoro *fra due schermate*. Il caso che l'ha
  /// resa necessaria: la splash precarica preferiti e ripetitori vicini, poi
  /// naviga; il suo controller viene smontato, con esso muore l'unico
  /// ascoltatore, e la home rifà da zero le stesse quattro richieste che
  /// erano appena tornate. Nel log di avvio si vedeva chiaramente —
  /// `getFavoriteRepeaters` e `getRepeatersNearby` due volte a mezzo secondo
  /// di distanza — e quella mezza secondata era una pagina vuota con lo
  /// spinner, che sembrava un secondo caricamento dell'app.
  ///
  /// **Non è una cache dei dati**: l'invalidazione esplicita continua a
  /// funzionare identica (aggiunta/rimozione di un preferito, `reload` della
  /// home), quindi questa finestra non può far vedere un dato che l'app sa
  /// già essere vecchio. È solo il permesso di non morire nell'istante fra
  /// una schermata e la successiva.
  void keepAliveFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);
    onDispose(timer.cancel);
  }
}

/// Finestra condivisa dai provider che la splash precarica per la home.
///
/// Larga quanto basta a coprire la transizione splash → home anche su un
/// avvio lento, stretta abbastanza da restare una transizione e non una
/// cache: chi torna sulla home più tardi rilegge.
const kHandoverKeepAlive = Duration(seconds: 30);
