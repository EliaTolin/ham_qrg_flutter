import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/brandmeister/presentation/widgets/bm_talkgroups_widget.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

class AccessModesSection extends StatelessWidget {
  const AccessModesSection({
    required this.repeater,
    super.key,
  });

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (repeater.accesses.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Icon(
                Icons.cell_tower,
                color: colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.accessConfiguration,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ...repeater.accesses.map((access) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AccessModeCard(access: access),
          );
        }),
      ],
    );
  }
}

class AccessModeCard extends StatelessWidget {
  const AccessModeCard({
    required this.access,
    super.key,
  });

  final RepeaterAccess access;

  bool get _isBrandmeister => access.network?.name.toLowerCase().contains('brandmeister') ?? false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accessColor = AccessModeHelper.getAccessModeColorObject(access.mode);
    final accessLabel = AccessModeHelper.getAccessModeLabel(access.mode);
    final accessIcon = AccessModeHelper.getAccessModeIcon(access.mode);

    final isDmr = access.mode == AccessMode.dmr;
    final isAnalog = access.mode == AccessMode.analog;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: accessColor.withValues(alpha: 0.3),
        ),
      ),
      child: Stack(
        children: [
          // Gradient glow in bottom-right corner
          Positioned(
            bottom: -80,
            right: -80,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    accessColor.withValues(alpha: 0.25),
                    accessColor.withValues(alpha: 0.08),
                    accessColor.withValues(alpha: 0),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with badge and icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: accessColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: accessColor.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        accessLabel.toUpperCase(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: accessColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Icon(
                      accessIcon,
                      color: accessColor.withValues(alpha: 0.5),
                      size: 32,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Content based on access mode
                if (isAnalog) _buildAnalogContent(context),
                if (isDmr) _buildDmrContent(context),
                if (!isAnalog && !isDmr) _buildGenericContent(context),
                // BrandMeister talkgroups (DMR with nodeId on BrandMeister network)
                if (isDmr && access.nodeId != null && _isBrandmeister) ...[
                  const SizedBox(height: 12),
                  BmTalkgroupsWidget(deviceId: access.nodeId!),
                ],
                // Network (shown for all access modes)
                if (access.network != null) _buildNetworkSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalogContent(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      spacing: 8,
      children: [
        // CTCSS Tx
        if (access.ctcssTxHz != null) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CTCSS Tx',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  access.ctcssTxHz!.toStringAsFixed(1),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
        // CTCSS Rx
        if (access.ctcssRxHz != null) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CTCSS Rx',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  access.ctcssRxHz!.toStringAsFixed(1),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
        // DCS
        if (access.dcsCode != null) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DCS',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  access.dcsCode.toString(),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDmrContent(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Color Code and DMR ID row
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COLOR CODE',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    access.colorCode?.toString() ?? '-',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AccessModeHelper.getNodeIdLabel(access.mode)?.toUpperCase() ?? 'NODE ID',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    access.nodeId?.toString() ?? '-',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenericContent(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final details = <Widget>[];

    // Node ID (shown for modes that have a node-like identifier)
    final nodeIdLabel = AccessModeHelper.getNodeIdLabel(access.mode);
    if (nodeIdLabel != null && access.nodeId != null) {
      details.add(
        _buildDetailRow(context, nodeIdLabel.toUpperCase(), access.nodeId.toString()),
      );
    }

    // C4FM specific
    if (access.mode == AccessMode.c4fm && access.dgId != null) {
      details.add(
        _buildDetailRow(context, 'DG-ID', access.dgId.toString()),
      );
    }

    // CTCSS/DCS if present
    if (access.ctcssTxHz != null || access.ctcssRxHz != null) {
      details.add(
        _buildDetailRow(
          context,
          'TONE',
          access.ctcssTxHz != null
              ? '${access.ctcssTxHz!.toStringAsFixed(1)} Hz'
              : '${access.ctcssRxHz!.toStringAsFixed(1)} Hz',
        ),
      );
    }

    // Notes if present
    if (access.notes != null && access.notes!.isNotEmpty) {
      details.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NOTES',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              access.notes!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    if (details.isEmpty) {
      return Text(
        'No additional details',
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: details.expand((widget) => [widget, const SizedBox(height: 8)]).toList()
        ..removeLast(),
    );
  }

  Widget _buildNetworkSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.1),
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.hub_outlined,
                size: 14,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                l10n.repeaterDetailNetwork.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 10,
                ),
              ),
              const Spacer(),
              Text(
                access.network!.name,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
