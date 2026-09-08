import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/unit_system.dart';
import 'package:hamqrg/src/features/profile/provider/unit_system_notifier/unit_system_notifier.dart';

/// Selettore del sistema di misura.
///
/// Ha la forma del selettore di tema e non quella del selettore di lingua:
/// le opzioni sono tre e stanno tutte su una riga, quindi la scelta corrente
/// è leggibile senza aprire nulla e cambiarla costa un tocco invece di tre.
///
/// Vive in `common/widgets/` perché compare in **due** schermate — le
/// impostazioni dell'utente registrato e il profilo dell'anonimo: chi ha
/// appena installato l'app è anche il più probabile a dover correggere il
/// default, e non è detto che si sia registrato (FR-003, FR-014).
///
/// **Le etichette sono i simboli delle unità, non le parole.** Su uno schermo
/// da 320 dp restano tre segmenti da una novantina di pixel: "Automatico" e
/// "Imperiale" ci andavano a capo su cinque righe, e in tedesco o ungherese
/// va peggio. I simboli risolvono il problema in tutte e quindici le lingue
/// insieme, e per giunta dicono meglio della parola che cosa cambia: chi non
/// sa cosa sia il "sistema imperiale" riconosce comunque `mi`. Le parole
/// complete restano come tooltip e come etichetta per i lettori di schermo,
/// dove lo spazio non è un vincolo.
/// Il layout è bloccato da `test/unit_system_selector_layout_test.dart`.
class UnitSystemSelector extends ConsumerWidget {
  const UnitSystemSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final selected = ref.watch(unitSystemProvider).value ?? UnitSystem.auto;

    ButtonSegment<UnitSystem> segment({
      required UnitSystem value,
      required String label,
      required String description,
    }) =>
        ButtonSegment(
          value: value,
          tooltip: description,
          label: Semantics(
            label: description,
            excludeSemantics: true,
            child: Text(label),
          ),
        );

    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<UnitSystem>(
        // Nessuna icona e nessun segno di spunta: con tre voci su una riga
        // sola ogni glifo decorativo è spazio sottratto all'etichetta.
        showSelectedIcon: false,
        // Il padding di serie di SegmentedButton è pensato per due voci
        // larghe: con tre segmenti su 320 dp lascia all'etichetta meno
        // spazio di quanto ne occupi `km · m`, che sono sei caratteri.
        style: SegmentedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          visualDensity: VisualDensity.compact,
        ),
        segments: [
          segment(
            value: UnitSystem.auto,
            label: l10n.profileUnitSystemAutoShort,
            description: l10n.profileUnitSystemAuto,
          ),
          segment(
            value: UnitSystem.metric,
            label: 'km',
            description: l10n.profileUnitSystemMetric,
          ),
          segment(
            value: UnitSystem.imperial,
            label: 'mi',
            description: l10n.profileUnitSystemImperial,
          ),
        ],
        selected: {selected},
        onSelectionChanged: (values) =>
            ref.read(unitSystemProvider.notifier).setUnitSystem(values.first),
      ),
    );
  }
}
