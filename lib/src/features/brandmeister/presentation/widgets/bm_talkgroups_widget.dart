import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hamqrg/src/features/brandmeister/domain/bm_talkgroup.dart';
import 'package:hamqrg/src/features/brandmeister/provider/get_bm_device/get_bm_device_provider.dart';
import 'package:hamqrg/src/features/brandmeister/provider/get_bm_talkgroup_names/get_bm_talkgroup_names_provider.dart';
import 'package:hamqrg/src/features/brandmeister/provider/get_bm_talkgroups/get_bm_talkgroups_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Expandable widget that lazily loads BrandMeister device info
/// (description + static talkgroups with names) on tap.
class BmTalkgroupsWidget extends StatefulWidget {
  const BmTalkgroupsWidget({required this.deviceId, super.key});

  final int deviceId;

  @override
  State<BmTalkgroupsWidget> createState() => _BmTalkgroupsWidgetState();
}

class _BmTalkgroupsWidgetState extends State<BmTalkgroupsWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Theme(
        // Remove default ExpansionTile dividers
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 12),
          childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          shape: const RoundedRectangleBorder(),
          initiallyExpanded: _expanded,
          onExpansionChanged: (expanded) {
            setState(() => _expanded = expanded);
          },
          leading: Icon(
            Icons.cell_tower,
            size: 20,
            color: colorScheme.primary,
          ),
          title: Text(
            'BrandMeister Talkgroups',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          children: [
            if (_expanded) _BmContent(deviceId: widget.deviceId),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Content loaded lazily when expanded
// ---------------------------------------------------------------------------
class _BmContent extends ConsumerWidget {
  const _BmContent({required this.deviceId});

  final int deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDevice = ref.watch(getBmDeviceProvider(deviceId));
    final asyncTalkgroups = ref.watch(getBmTalkgroupsProvider(deviceId));
    final asyncNames = ref.watch(getBmTalkgroupNamesProvider);

    final isLoading = asyncTalkgroups.isLoading ||
        asyncDevice.isLoading ||
        asyncNames.isLoading;

    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    final hasError = asyncTalkgroups.hasError && asyncDevice.hasError;
    if (hasError) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'Impossibile caricare i dati BrandMeister.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
      );
    }

    final device = asyncDevice.value;
    final talkgroups = asyncTalkgroups.value ?? [];
    final tgNames = asyncNames.value ?? {};

    final description = device?.description?.trim();
    final hasDescription = description != null && description.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasDescription) ...[
          _DeviceDescription(description: description),
          if (talkgroups.isNotEmpty) const SizedBox(height: 12),
        ],
        if (talkgroups.isNotEmpty)
          _TalkgroupList(talkgroups: talkgroups, names: tgNames),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Device description — renders HTML, Markdown, or plain text
// ---------------------------------------------------------------------------

enum _DescriptionFormat { html, markdown, plain }

class _DeviceDescription extends StatelessWidget {
  const _DeviceDescription({required this.description});

  final String description;

  /// Matches common HTML tags: <p>, <br>, <div>, <a href=...>, etc.
  static final _htmlTagPattern = RegExp(
    r'<(p|br|div|span|a|b|i|u|h[1-6]|ul|ol|li|table|tr|td|th|img|strong|em)\b[^>]*>',
    caseSensitive: false,
  );

  /// Matches common Markdown patterns:
  /// - `# heading`, `## heading`
  /// - `**bold**` or `__bold__`
  /// - `[link text](url)`
  /// - `- list item` or `* list item`
  /// - ``` `code` ```
  static final _markdownPattern = RegExp(
    r'(^#{1,6}\s)|(\*\*[^*]+\*\*)|(__.+__)|(\[.+?\]\(.+?\))|(^[\-\*]\s)|(`.+?`)',
    multiLine: true,
  );

  _DescriptionFormat get _format {
    if (_htmlTagPattern.hasMatch(description)) return _DescriptionFormat.html;
    if (_markdownPattern.hasMatch(description)) {
      return _DescriptionFormat.markdown;
    }
    return _DescriptionFormat.plain;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bodyStyle = theme.textTheme.bodySmall?.copyWith(
      color: colorScheme.onSurface,
    );

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
        switch (_format) {
          _DescriptionFormat.html => HtmlWidget(
              description,
              textStyle: bodyStyle,
            ),
          _DescriptionFormat.markdown => MarkdownBody(
              data: description,
              styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
                p: bodyStyle,
              ),
            ),
          _DescriptionFormat.plain => Text(
              description,
              style: bodyStyle,
            ),
        },
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Talkgroup list — chips with TG id, name + timeslot
// ---------------------------------------------------------------------------
class _TalkgroupList extends StatelessWidget {
  const _TalkgroupList({required this.talkgroups, required this.names});

  final List<BmTalkgroup> talkgroups;
  final Map<String, String> names;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: talkgroups.map((tg) {
        final tgName = names[tg.talkgroupId.toString()];
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.15),
              ),
            ),
            child: Row(
              children: [
                // TG ID
                Text(
                  'TG ${tg.talkgroupId}',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
                const SizedBox(width: 8),
                // Timeslot badge
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
                // TG Name
                if (tgName != null) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      tgName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
