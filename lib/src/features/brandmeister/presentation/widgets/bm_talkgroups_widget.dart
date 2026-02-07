import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hamqrg/src/features/brandmeister/domain/bm_talkgroup.dart';
import 'package:hamqrg/src/features/brandmeister/provider/get_bm_device/get_bm_device_provider.dart';
import 'package:hamqrg/src/features/brandmeister/provider/get_bm_talkgroups/get_bm_talkgroups_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Widget that displays BrandMeister device info (description + static
/// talkgroups) for the given device/node ID.
class BmTalkgroupsWidget extends ConsumerWidget {
  const BmTalkgroupsWidget({required this.deviceId, super.key});

  final int deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDevice = ref.watch(getBmDeviceProvider(deviceId));
    final asyncTalkgroups = ref.watch(getBmTalkgroupsProvider(deviceId));

    // Show loading only while both are loading
    if (asyncDevice.isLoading && asyncTalkgroups.isLoading) {
      return const SizedBox(
        height: 48,
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    final device = asyncDevice.value;
    final talkgroups = asyncTalkgroups.value ?? [];

    final description = device?.description?.trim();
    final hasDescription = description != null && description.isNotEmpty;
    final hasTalkgroups = talkgroups.isNotEmpty;

    if (!hasDescription && !hasTalkgroups) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasDescription) ...[
          _DeviceDescription(description: description),
          if (hasTalkgroups) const SizedBox(height: 12),
        ],
        if (hasTalkgroups) _TalkgroupList(talkgroups: talkgroups),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Device description — renders HTML if detected, plain text otherwise
// ---------------------------------------------------------------------------
class _DeviceDescription extends StatelessWidget {
  const _DeviceDescription({required this.description});

  final String description;

  static final _htmlTagPattern = RegExp(r'<[a-z][\s\S]*>', caseSensitive: false);

  bool get _isHtml => _htmlTagPattern.hasMatch(description);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DESCRIZIONE',
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        if (_isHtml)
          HtmlWidget(
            description,
            textStyle: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface,
            ),
          )
        else
          Text(
            description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Talkgroup list — chips with TG id + timeslot
// ---------------------------------------------------------------------------
class _TalkgroupList extends StatelessWidget {
  const _TalkgroupList({required this.talkgroups});

  final List<BmTalkgroup> talkgroups;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TALKGROUP STATICI',
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: talkgroups.map((tg) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'TG ${tg.talkgroupId}',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'TS${tg.slot}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
