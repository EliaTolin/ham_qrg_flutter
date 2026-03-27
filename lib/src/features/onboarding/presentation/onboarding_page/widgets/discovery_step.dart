import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

class DiscoveryStep extends StatelessWidget {
  const DiscoveryStep({
    required this.isLoading,
    required this.nearestRepeater,
    required this.hasLocation,
    required this.onViewRepeater,
    required this.onExploreMap,
    required this.onContinue,
    super.key,
  });

  final bool isLoading;
  final Repeater? nearestRepeater;
  final bool hasLocation;
  final VoidCallback onViewRepeater;
  final VoidCallback onExploreMap;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.explore,
              size: 56,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.onboardingDiscoveryTitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            hasLocation
                ? l10n.onboardingDiscoverySubtitle
                : l10n.onboardingDiscoveryNoLocation,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(),
            )
          else if (nearestRepeater != null)
            _RepeaterCard(
              repeater: nearestRepeater!,
              onTap: onViewRepeater,
            )
          else if (!hasLocation)
            // No location — just show explore CTA
            const SizedBox.shrink()
          else
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.onboardingDiscoveryNoRepeaters,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onContinue,
              icon: const Icon(Icons.arrow_forward),
              label: Text(l10n.onboardingNext),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: onExploreMap,
            icon: const Icon(Icons.map, size: 18),
            label: Text(l10n.onboardingDiscoveryExploreMap),
          ),
        ],
      ),
    );
  }
}

class _RepeaterCard extends StatelessWidget {
  const _RepeaterCard({
    required this.repeater,
    required this.onTap,
  });

  final Repeater repeater;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    final primaryAccess =
        repeater.accesses.isNotEmpty ? repeater.accesses.first : null;
    final modeColor = primaryAccess != null
        ? AccessModeHelper.getAccessModeColorObject(primaryAccess.mode)
        : colorScheme.primary;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: modeColor.withValues(alpha: 0.3)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: modeColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      primaryAccess?.mode.name.toUpperCase() ?? '',
                      style: TextStyle(
                        color: modeColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    l10n.onboardingDiscoveryNearbyRepeater,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                repeater.name ?? repeater.callsign ?? '',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '${(repeater.frequencyHz / 1e6).toStringAsFixed(4)} MHz',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.open_in_new,
                    size: 14,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    l10n.onboardingDiscoveryViewDetails,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
