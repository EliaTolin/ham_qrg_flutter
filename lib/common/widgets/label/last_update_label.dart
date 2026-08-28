import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/time_helper.dart';
import 'package:hamqrg/l10n/app_localizations.dart';

/// Shows when the next automatic refresh of a spot list is due, counting down
/// second by second. Shared by the SOTA and POTA spot views.
///
/// [autoRefreshInterval] and [nextUpdateAt] are descriptive only: the caller
/// owns the timer, the label just mirrors it. With no interval the update is
/// presented as manual and the label falls back to "updated x ago".
class LastUpdateLabel extends StatefulWidget {
  const LastUpdateLabel({
    required this.lastUpdatedAt,
    this.nextUpdateAt,
    this.isRefreshing = false,
    this.autoRefreshInterval,
    this.onRefresh,
    super.key,
  });

  final DateTime? lastUpdatedAt;
  final DateTime? nextUpdateAt;
  final bool isRefreshing;
  final Duration? autoRefreshInterval;
  final Future<void> Function()? onRefresh;

  @override
  State<LastUpdateLabel> createState() => _LastUpdateLabelState();
}

class _LastUpdateLabelState extends State<LastUpdateLabel> {
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _restartTicker();
  }

  @override
  void didUpdateWidget(LastUpdateLabel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.nextUpdateAt != null) != (widget.nextUpdateAt != null)) {
      _restartTicker();
    }
  }

  /// A live countdown needs a per-second tick; the plain "x ago" text only
  /// needs a nudge now and then.
  void _restartTicker() {
    _ticker?.cancel();
    final period = widget.nextUpdateAt != null
        ? const Duration(seconds: 1)
        : const Duration(seconds: 30);
    _ticker = Timer.periodic(period, (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final updatedAt = widget.lastUpdatedAt;

    if (updatedAt == null && !widget.isRefreshing) {
      return const SizedBox.shrink();
    }

    final interval = widget.autoRefreshInterval;
    final isAuto = interval != null;
    final label = _label(l10n);

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.isRefreshing)
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: colorScheme.onSurfaceVariant,
            ),
          )
        else
          Icon(
            isAuto ? Icons.autorenew : Icons.refresh,
            size: 14,
            color: colorScheme.onSurfaceVariant,
          ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );

    // The countdown replaces the "updated x ago" text, so the tooltip keeps
    // that information reachable — it is what tells a stale list apart.
    final tooltip = [
      if (isAuto) l10n.spotsAutoRefreshHint(interval.inSeconds),
      if (updatedAt != null)
        l10n.spotsUpdatedAgo(TimeHelper.formatTimeAgo(updatedAt, l10n)),
      if (!isAuto) l10n.spotsManualRefreshHint,
    ].join('\n');

    final onRefresh = widget.onRefresh;
    if (onRefresh == null) {
      return Tooltip(message: tooltip, child: content);
    }

    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: widget.isRefreshing ? null : () => unawaited(onRefresh()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: content,
        ),
      ),
    );
  }

  String _label(AppLocalizations l10n) {
    if (widget.isRefreshing) return l10n.spotsUpdating;

    final nextUpdateAt = widget.nextUpdateAt;
    if (nextUpdateAt != null) {
      final remaining = nextUpdateAt.difference(DateTime.now());
      // At (or past) zero the refresh is already on its way.
      if (remaining <= Duration.zero) return l10n.spotsUpdating;
      if (remaining.inSeconds < 60) {
        return l10n.spotsNextUpdateSeconds(remaining.inSeconds);
      }
      return l10n.spotsNextUpdateMinutes(remaining.inMinutes);
    }

    return l10n.spotsUpdatedAgo(
      TimeHelper.formatTimeAgo(widget.lastUpdatedAt!, l10n),
    );
  }
}
