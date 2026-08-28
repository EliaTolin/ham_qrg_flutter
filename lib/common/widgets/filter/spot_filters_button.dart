import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';

/// AppBar action that opens the spot filters sheet, showing how many
/// filters are currently active.
class SpotFiltersButton extends StatelessWidget {
  const SpotFiltersButton({
    required this.activeCount,
    required this.onPressed,
    super.key,
  });

  final int activeCount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final icon = Icon(
      activeCount > 0 ? Icons.filter_alt : Icons.filter_alt_outlined,
    );

    return IconButton(
      tooltip: l10n.spotsFiltersTitle,
      onPressed: onPressed,
      icon:
          activeCount > 0 ? Badge.count(count: activeCount, child: icon) : icon,
    );
  }
}
