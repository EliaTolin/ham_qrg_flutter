import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/signal_helper.dart';

/// A compact 5-bar signal-strength meter driven by a received level (dBm).
/// Filled bars use the semantic signal color; empty bars are muted.
class SignalBars extends StatelessWidget {
  const SignalBars({
    required this.dbm,
    this.barWidth = 4,
    this.maxHeight = 16,
    this.spacing = 2,
    super.key,
  });

  final double dbm;
  final double barWidth;
  final double maxHeight;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filled = SignalHelper.barsFromDbm(dbm);
    final color = SignalHelper.colorFromDbm(dbm);
    final empty = theme.colorScheme.onSurface.withValues(alpha: 0.15);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(SignalHelper.maxBars, (i) {
        final h = maxHeight * (0.4 + 0.6 * (i + 1) / SignalHelper.maxBars);
        return Padding(
          padding: EdgeInsets.only(right: i == SignalHelper.maxBars - 1 ? 0 : spacing),
          child: Container(
            width: barWidth,
            height: h,
            decoration: BoxDecoration(
              color: i < filled ? color : empty,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        );
      }),
    );
  }
}
