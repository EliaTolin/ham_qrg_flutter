#!/usr/bin/env python3
"""Controllo di copertura delle unità di misura (spec 006-imperial-units).

Cerca i simboli di lunghezza rimasti fuori dal formattatore condiviso, sia
attaccati a un valore (`'${x} km'`) sia come stringa intera (`'m'` da sola —
la forma che un primo controllo più ingenuo lasciava passare, e che infatti
aveva lasciato l'asse Y del profilo altimetrico fisso in metri).

Fallisce con exit code 1 se compare qualcosa che non sia nell'elenco delle
eccezioni motivate qui sotto.
"""
import glob
import io
import re
import sys

# Eccezioni, ciascuna con la sua ragione. Un file entra qui solo se il simbolo
# NON è un'unità di lunghezza mostrata all'utente.
ALLOWED = {
    # Il selettore mostra i simboli *come etichette*: sono il suo contenuto.
    'lib/common/widgets/units/unit_system_selector.dart',
    # 'km' è una chiave di serializzazione JSON, non un testo.
    'lib/src/features/coverage_search/data/model/saved_station_model.dart',
    # Lunghezza d'onda: è in metri ma è il nome della banda ("two meters"),
    # identico in tutto il mondo. FR-006 la esclude esplicitamente.
    'lib/src/features/repeaters/presentation/detail/widgets/'
    'frequency_fun_facts_section.dart',
}

SKIP = ('.g.dart', '.freezed.dart', 'unit_format_helper.dart',
        'app_localizations')

WHOLE = re.compile(r"(?<![\w$])'(km|m|mi|ft)'")
SUFFIX = re.compile(r"\} ?(km|m|ft|mi)'| (km|m|ft|mi)'")


def main() -> int:
    hits = []
    for path in glob.glob('lib/**/*.dart', recursive=True):
        if any(s in path for s in SKIP) or path in ALLOWED:
            continue
        for number, line in enumerate(io.open(path, encoding='utf-8'), 1):
            if WHOLE.search(line) or SUFFIX.search(line):
                hits.append(f'{path}:{number}: {line.strip()}')

    if hits:
        print('Simboli di unità fuori dal formattatore condiviso:')
        print('\n'.join(f'  {h}' for h in hits))
        print('\nUsa context.units, oppure aggiungi il file ad ALLOWED '
              'spiegando perché non è una lunghezza mostrata all\'utente.')
        return 1
    print('✓ nessun simbolo di unità fuori dal formattatore')
    return 0


if __name__ == '__main__':
    sys.exit(main())
