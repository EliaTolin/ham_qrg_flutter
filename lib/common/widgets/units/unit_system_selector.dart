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
class UnitSystemSelector extends ConsumerWidget {
  const UnitSystemSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final selected = ref.watch(unitSystemProvider).value ?? UnitSystem.auto;

    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<UnitSystem>(
        segments: [
          ButtonSegment(
            value: UnitSystem.auto,
            label: Text(l10n.profileUnitSystemAuto),
            icon: const Icon(Icons.settings_suggest),
          ),
          ButtonSegment(
            value: UnitSystem.metric,
            label: Text(l10n.profileUnitSystemMetric),
            icon: const Icon(Icons.straighten),
          ),
          ButtonSegment(
            value: UnitSystem.imperial,
            label: Text(l10n.profileUnitSystemImperial),
            icon: const Icon(Icons.square_foot),
          ),
        ],
        selected: {selected},
        onSelectionChanged: (values) =>
            ref.read(unitSystemProvider.notifier).setUnitSystem(values.first),
      ),
    );
  }
}
