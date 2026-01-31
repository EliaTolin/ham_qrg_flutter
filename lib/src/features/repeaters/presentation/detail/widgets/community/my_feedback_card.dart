import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/time_helper.dart';
import 'package:hamqrg/common/widgets/profile/profile_avatar.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/shared_widgets.dart';

class MyFeedbackCard extends StatelessWidget {
  const MyFeedbackCard({
    required this.feedback,
    required this.onDelete,
    required this.isLoading,
    this.userCallsign,
    this.userAvatarUrl,
    super.key,
  });

  final RepeaterFeedback feedback;
  final String? userCallsign;
  final String? userAvatarUrl;
  final VoidCallback onDelete;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final displayCallsign = userCallsign ?? feedback.userId.substring(0, 6).toUpperCase();
    final isLike = feedback.type == FeedbackType.like;
    final badgeColor = isLike ? Colors.green : Colors.amber;
    final accessColor = AccessModeHelper.getAccessModeColorObject(feedback.repeaterAccess.mode);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildAvatar(theme, colorScheme),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayCallsign,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        TimeHelper.formatTimeAgo(feedback.createdAt, l10n),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: badgeColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isLike ? Icons.thumb_up : Icons.warning_amber_rounded,
                      size: 14,
                      color: badgeColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isLike ? l10n.repeaterDetailLike : l10n.repeaterDetailReportLabel,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: badgeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Access mode badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: accessColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: accessColor.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  AccessModeHelper.getAccessModeIcon(
                    feedback.repeaterAccess.mode,
                  ),
                  size: 14,
                  color: accessColor,
                ),
                const SizedBox(width: 4),
                Text(
                  _getAccessDescription(feedback.repeaterAccess),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: accessColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Info chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              InfoChip(
                icon: _getStationIcon(feedback.station),
                label: _getStationLabel(feedback.station, l10n),
              ),
            ],
          ),
          if (feedback.comment.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                feedback.comment,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ],
          const SizedBox(height: 12),
          // Delete button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: isLoading ? null : onDelete,
              icon: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.delete_outline, size: 18),
              label: Text(l10n.repeaterDetailRemove),
              style: TextButton.styleFrom(
                foregroundColor: colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(ThemeData theme, ColorScheme colorScheme) {
    if (userAvatarUrl != null) {
      return ProfileAvatar(
        imageProfilePath: userAvatarUrl,
        size: 36,
      );
    }
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.1),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          'YOU',
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String _getAccessDescription(RepeaterAccess access) {
    final label = AccessModeHelper.getAccessModeLabel(access.mode);
    if (access.network != null) {
      return '$label - ${access.network!.name}';
    }
    if (access.ctcssTxHz != null) {
      return '$label (${access.ctcssTxHz!.toStringAsFixed(1)}Hz)';
    }
    return label;
  }

  IconData _getStationIcon(StationKind station) {
    switch (station) {
      case StationKind.portable:
        return Icons.smartphone;
      case StationKind.mobile:
        return Icons.directions_car;
      case StationKind.fixed:
        return Icons.home;
    }
  }

  String _getStationLabel(StationKind station, AppLocalizations l10n) {
    switch (station) {
      case StationKind.portable:
        return l10n.repeaterDetailStationPortable;
      case StationKind.mobile:
        return l10n.repeaterDetailStationMobile;
      case StationKind.fixed:
        return l10n.repeaterDetailStationFixed;
    }
  }
}
