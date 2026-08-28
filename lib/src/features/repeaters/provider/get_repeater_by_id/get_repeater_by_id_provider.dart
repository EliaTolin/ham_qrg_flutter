import 'package:hamqrg/src/features/coverage_search/data/datasource/remote_caching_repeater_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeater_by_id_provider.g.dart';

/// Un ripetitore per id, passando dalla cache condivisa.
///
/// È il punto in cui avviene l'**aggiornamento indiretto**: ogni volta che
/// l'utente apre una scheda ripetitore — da qualunque parte dell'app — la voce
/// in cache viene riscritta col dato fresco. Una postazione salvata a ottobre
/// che contiene quel ripetitore lo mostrerà aggiornato a febbraio, senza che
/// nessuno abbia rieseguito alcun calcolo.
///
/// Offline la cache restituisce comunque la copia conservata, quindi la scheda
/// resta consultabile in campo.
@riverpod
Future<Repeater?> getRepeaterById(
  Ref ref,
  String repeaterId,
) async {
  final repository = ref.read(repeatersRepositoryProvider);
  final cache = ref.read(repeaterCacheDatasourceProvider);

  try {
    return await cache.readFresh(
      repeaterId,
      remote: () async {
        final repeater = await repository.getRepeaterById(repeaterId);
        if (repeater == null) throw const RepeaterNotFoundException();
        return repeater;
      },
    );
  } on RepeaterNotFoundException {
    return null;
  } catch (_) {
    // La cache è un acceleratore, non una dipendenza dura: se non è
    // inizializzata o il database locale è inagibile, la scheda ripetitore
    // deve continuare a funzionare leggendo direttamente dal backend. Senza
    // questa ricaduta un `init()` fallito all'avvio — che per scelta non
    // blocca l'app — renderebbe illeggibile ogni ripetitore.
    return repository.getRepeaterById(repeaterId);
  }
}

/// Il ripetitore richiesto non esiste. Serve perché la cache lavora su un tipo
/// non nullabile: un `null` non sarebbe distinguibile da un errore di rete.
class RepeaterNotFoundException implements Exception {
  const RepeaterNotFoundException();
}
