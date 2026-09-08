import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/widgets/pota_location_map.dart';

class PotaParkInfoSection extends StatelessWidget {
  const PotaParkInfoSection({
    required this.park,
    this.distanceKm,
    super.key,
  });

  final PotaPark park;
  final double? distanceKm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Park identity card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colorScheme.tertiary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/pota_logo.png',
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      park.reference,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      park.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Info grid
        _buildInfoGrid(context, l10n),

        // Mini-map
        if (park.latitude != null && park.longitude != null) ...[
          const SizedBox(height: 12),
          PotaLocationMap(park: park),
        ],

        // Location details
        if (distanceKm != null ||
            park.grid6 != null ||
            park.grid4 != null ||
            (park.latitude != null && park.longitude != null)) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.1),
              ),
            ),
            child: Column(
              children: _buildLocationTiles(context, l10n),
            ),
          ),
        ],
      ],
    );
  }

  List<Widget> _buildLocationTiles(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final tiles = <Widget>[];

    if (distanceKm != null) {
      tiles.add(
        _LocationInfoTile(
          icon: Icons.straighten,
          label:
              l10n.potaDistanceAway(context.units.distanceFromKm(distanceKm!)),
          iconColor: colorScheme.primary,
        ),
      );
    }

    if (park.grid6 != null || park.grid4 != null) {
      if (tiles.isNotEmpty) {
        tiles.add(
          Divider(
            height: 20,
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        );
      }
      tiles.add(
        _LocationInfoTile(
          icon: Icons.grid_on,
          label: park.grid6 ?? park.grid4 ?? '',
          iconColor: colorScheme.tertiary,
        ),
      );
    }

    if (park.latitude != null && park.longitude != null) {
      if (tiles.isNotEmpty) {
        tiles.add(
          Divider(
            height: 20,
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        );
      }
      tiles.add(
        _LocationInfoTile(
          icon: Icons.location_on,
          label:
              '${park.latitude!.toStringAsFixed(4)}, ${park.longitude!.toStringAsFixed(4)}',
          iconColor: colorScheme.error,
        ),
      );
    }

    return tiles;
  }

  Widget _buildInfoGrid(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final items = <({IconData icon, Color color, String label, String value})>[
      if (park.parktypeDesc != null)
        (
          icon: Icons.category,
          color: colorScheme.primary,
          label: l10n.potaParkType,
          value: park.parktypeDesc!,
        ),
      if (park.locationName != null)
        (
          icon: Icons.place,
          color: colorScheme.error,
          label: l10n.potaLocation,
          value: park.locationName!,
        ),
      if (park.entityName != null)
        (
          icon: Icons.flag,
          color: colorScheme.primary,
          label: l10n.potaCountry,
          value: park.entityName!,
        ),
      if (park.firstActivator != null)
        (
          icon: Icons.person,
          color: colorScheme.tertiary,
          label: l10n.potaFirstActivation,
          value:
              '${park.firstActivator!}${park.firstActivationDate != null ? " (${park.firstActivationDate!})" : ""}',
        ),
    ];

    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          children: [
            for (var i = 0; i < items.length; i++) ...[
              if (i > 0)
                Divider(
                  height: 20,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: items[i].color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      items[i].icon,
                      size: 16,
                      color: items[i].color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[i].label,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          items[i].value,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LocationInfoTile extends StatelessWidget {
  const _LocationInfoTile({
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
