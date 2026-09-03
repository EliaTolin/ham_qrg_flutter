import 'package:flutter/material.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/coverage_result_sheet.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';

/// Larghezza del pannello dei risultati su tablet.
const double kCoveragePanelWidth = 380;

/// Su tablet il risultato è un pannello affiancato alla mappa, non un foglio
/// modale che la copre (FR-059).
///
/// La differenza non è estetica: l'operatore vuole vedere il pin e la lista
/// **insieme**, per capire da dove arriva ciascun segnale mentre lo legge.
class CoverageResultPanel extends StatelessWidget {
  const CoverageResultPanel({
    required this.point,
    required this.breadth,
    required this.selectedModes,
    required this.onBreadthChanged,
    required this.onClose,
    this.onModeToggled,
    this.onAllModes,
    super.key,
  });

  final SearchPoint point;
  final SearchBreadth breadth;
  final Set<AccessMode> selectedModes;
  final ValueChanged<SearchBreadth> onBreadthChanged;
  final VoidCallback onClose;
  final ValueChanged<AccessMode>? onModeToggled;
  final VoidCallback? onAllModes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      elevation: 8,
      shadowColor: theme.shadowColor,
      child: SizedBox(
        width: kCoveragePanelWidth,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: onClose,
                ),
              ),
              Expanded(
                child: CoverageResultSheet(
                  point: point,
                  breadth: breadth,
                  selectedModes: selectedModes,
                  onBreadthChanged: onBreadthChanged,
                  onModeToggled: onModeToggled,
                  onAllModes: onAllModes,
                  asPanel: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
