import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';
import 'package:hamqrg/src/features/spots/domain/spot_state.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/pulsing_live_dot.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/spot_countdown.dart';

class SpotCard extends StatelessWidget {
  const SpotCard({
    required this.spot,
    this.showRepeaterName = false,
    this.onTap,
    this.onClose,
    this.onExpired,
    this.currentUserId,
    super.key,
  });

  final RepeaterSpot spot;
  final bool showRepeaterName;
  final VoidCallback? onTap;
  final VoidCallback? onClose;
  final VoidCallback? onExpired;
  final String? currentUserId;

  /// Formats a timestamp as relative ("5m fa", "2h fa") for recent spots,
  /// or as "dd/MM HH:mm" for older ones.
  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final local = timestamp.toLocal();
    final diff = now.difference(local);

    if (diff.inSeconds < 60) return '${diff.inSeconds}s fa';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m fa';
    if (diff.inHours < 24) return '${diff.inHours}h fa';

    final d = local.day.toString().padLeft(2, '0');
    final m = local.month.toString().padLeft(2, '0');
    final h = local.hour.toString().padLeft(2, '0');
    final min = local.minute.toString().padLeft(2, '0');
    return '$d/$m $h:$min';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final isOther = spot.isOtherSpot;
    final isOwn = currentUserId != null && spot.userId == currentUserId;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              // Pulsing red dot for active spots, access mode dot otherwise
              if (spot.isSelfSpot && spot.isActive)
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: PulsingLiveDot(),
                )
              else if (spot.accessMode != null)
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: AccessModeHelper.getAccessModeColorObject(
                      spot.accessMode!,
                    ),
                    shape: BoxShape.circle,
                  ),
                )
              else
                const SizedBox(width: 20),
              // Main content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Callsign line
                    if (isOther) ...[
                      Text(
                        spot.spottedCallsign!,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        l10n.spotListSpottedBy(spot.callsignSnapshot ?? ''),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: .6,
                          ),
                        ),
                      ),
                    ] else
                      Text(
                        spot.callsignSnapshot ?? '',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    // Repeater name (for "Ultimi spot" list)
                    if (showRepeaterName &&
                        (spot.repeaterCallsign ?? spot.repeaterName) != null)
                      Text(
                        spot.repeaterCallsign ?? spot.repeaterName ?? '',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: .6,
                          ),
                        ),
                      ),
                    // Access mode + timestamp
                    Row(
                      children: [
                        if (spot.accessMode != null) ...[
                          Text(
                            AccessModeHelper.getAccessModeLabel(
                              spot.accessMode!,
                            ),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AccessModeHelper.getAccessModeColorObject(
                                spot.accessMode!,
                              ),
                            ),
                          ),
                          Text(
                            ' · ',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: .4,
                              ),
                            ),
                          ),
                        ],
                        Text(
                          _formatTimestamp(spot.startedAt),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: .5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Badge / countdown / close button
              if (isOther)
                _Badge(
                  label: l10n.spotListBadgeReport,
                  color: theme.colorScheme.tertiary,
                )
              else if (spot.isActive && spot.expiresAt != null) ...[
                SpotCountdown(
                  expiresAt: spot.expiresAt!,
                  onExpired: onExpired,
                ),
                if (isOwn && onClose != null) ...[
                  const Gap(8),
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: IconButton(
                      onPressed: onClose,
                      icon: const Icon(Icons.close, size: 16),
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ] else
                _Badge(
                  label: l10n.spotListBadgeClosed,
                  color: theme.colorScheme.outline,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
