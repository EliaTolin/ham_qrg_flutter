import 'package:flutter/material.dart';

/// Standard drag handle for bottom sheets.
/// Reusable across all modal bottom sheets in the app.
class SheetDragHandle extends StatelessWidget {
  const SheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .2),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
