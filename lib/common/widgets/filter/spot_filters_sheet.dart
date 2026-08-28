import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/filter/spot_filter_chip.dart';
import 'package:hamqrg/common/widgets/sheet/sheet_drag_handle.dart';

/// Bottom sheet that lets the user tweak band/mode filters on the
/// POTA/SOTA maps. Changes are applied live through the callbacks.
Future<void> showSpotFiltersSheet({
  required BuildContext context,
  required List<String> availableBands,
  required List<String> availableModes,
  required String? selectedBand,
  required String? selectedMode,
  required ValueChanged<String?> onBandChanged,
  required ValueChanged<String?> onModeChanged,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Theme.of(context).colorScheme.surface,
    showDragHandle: false,
    isScrollControlled: true,
    // Keep the sheet readable on tablets instead of stretching edge to edge.
    constraints: const BoxConstraints(maxWidth: 640),
    builder: (_) => SpotFiltersSheet(
      availableBands: availableBands,
      availableModes: availableModes,
      selectedBand: selectedBand,
      selectedMode: selectedMode,
      onBandChanged: onBandChanged,
      onModeChanged: onModeChanged,
    ),
  );
}

class SpotFiltersSheet extends StatefulWidget {
  const SpotFiltersSheet({
    required this.availableBands,
    required this.availableModes,
    required this.selectedBand,
    required this.selectedMode,
    required this.onBandChanged,
    required this.onModeChanged,
    super.key,
  });

  final List<String> availableBands;
  final List<String> availableModes;
  final String? selectedBand;
  final String? selectedMode;
  final ValueChanged<String?> onBandChanged;
  final ValueChanged<String?> onModeChanged;

  @override
  State<SpotFiltersSheet> createState() => _SpotFiltersSheetState();
}

class _SpotFiltersSheetState extends State<SpotFiltersSheet> {
  late String? _band = widget.selectedBand;
  late String? _mode = widget.selectedMode;

  void _setBand(String? band) {
    setState(() => _band = band);
    widget.onBandChanged(band);
  }

  void _setMode(String? mode) {
    setState(() => _mode = mode);
    widget.onModeChanged(mode);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final hasFilters = _band != null || _mode != null;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SheetDragHandle(),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  l10n.spotsFiltersTitle,
                  style: theme.textTheme.titleMedium,
                ),
                const Spacer(),
                if (hasFilters)
                  TextButton.icon(
                    onPressed: () {
                      _setBand(null);
                      _setMode(null);
                    },
                    icon: const Icon(Icons.filter_alt_off_outlined, size: 18),
                    label: Text(l10n.spotsFiltersReset),
                  ),
              ],
            ),
            if (widget.availableBands.isNotEmpty) ...[
              const SizedBox(height: 8),
              _SectionTitle(label: l10n.spotsFilterBand),
              const SizedBox(height: 8),
              _ChipsWrap(
                allLabel: l10n.spotsFilterAll,
                values: widget.availableBands,
                selected: _band,
                onSelected: _setBand,
              ),
            ],
            if (widget.availableModes.isNotEmpty) ...[
              const SizedBox(height: 16),
              _SectionTitle(label: l10n.spotsFilterMode),
              const SizedBox(height: 8),
              _ChipsWrap(
                allLabel: l10n.spotsFilterAll,
                values: widget.availableModes,
                selected: _mode,
                onSelected: _setMode,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      label,
      style: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _ChipsWrap extends StatelessWidget {
  const _ChipsWrap({
    required this.allLabel,
    required this.values,
    required this.selected,
    required this.onSelected,
  });

  final String allLabel;
  final List<String> values;
  final String? selected;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        SpotFilterChip(
          label: allLabel,
          selected: selected == null,
          onSelected: (_) => onSelected(null),
        ),
        ...values.map(
          (value) => SpotFilterChip(
            label: value,
            selected: selected == value,
            onSelected: (_) => onSelected(selected == value ? null : value),
          ),
        ),
      ],
    );
  }
}
