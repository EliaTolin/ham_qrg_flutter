import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'cached_repeater.freezed.dart';

/// Soglia oltre la quale un dato conservato viene segnalato come
/// potenzialmente non aggiornato (FR-046).
///
/// Segnala soltanto: non autorizza alcuna rimozione. Una postazione vecchia è
/// comunque infinitamente più utile di una postazione assente, e in campo non
/// c'è rete per rigenerarla.
const Duration kStaleThreshold = Duration(days: 30);

/// Un ripetitore risolto dalla cache condivisa, con la sua data.
@freezed
abstract class CachedRepeater with _$CachedRepeater {
  const factory CachedRepeater({
    required Repeater repeater,
    required DateTime cachedAt,
  }) = _CachedRepeater;

  const CachedRepeater._();

  bool isStaleAt(DateTime now) => now.difference(cachedAt) > kStaleThreshold;
}
