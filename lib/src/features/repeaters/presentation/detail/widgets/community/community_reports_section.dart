import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/repeater_detail_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/state/repeater_detail_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/community/community_feedback_card.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/community/feedback_form_card.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/community/my_feedback_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommunityReportsSection extends HookConsumerWidget {
  const CommunityReportsSection({
    required this.state,
    required this.controller,
    super.key,
  });

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final profileAsync = ref.watch(getProfileProvider);

    final locationText = useTextEditingController(
      text: state.locationText,
    );
    final comment = useTextEditingController(
      text: state.comment,
    );

    // Get available accesses (those without user feedback)
    final availableAccesses = controller.getAvailableAccesses();

    // Filter out user's own feedbacks from community list
    final myFeedbackIds = state.myFeedbacks.map((f) => f.id).toSet();
    final communityFeedbacks =
        state.communityFeedbacks.where((f) => !myFeedbackIds.contains(f.id)).toList();

    // Get user info from profile
    final userCallsign = profileAsync.value?.callsign;
    final userAvatarUrl = profileAsync.value?.propic;

    // Prefill location on mount
    useEffect(
      () {
        controller.prefillUserLocation();
        return null;
      },
      [],
    );

    // Sync location text with state
    useEffect(
      () {
        if (state.locationText != null && locationText.text != state.locationText) {
          locationText.text = state.locationText!;
        }
        return null;
      },
      [state.locationText],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Feedback form first (if there are accesses without feedback)
        if (availableAccesses.isNotEmpty) ...[
          FeedbackFormCard(
            state: state,
            availableAccesses: availableAccesses,
            locationController: locationText,
            commentController: comment,
            controller: controller,
          ),
          const SizedBox(height: 24),
        ],
        // Recent Activity header
        Row(
          children: [
            Icon(
              Icons.history,
              color: colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              l10n.repeaterDetailRecentActivity,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Empty state CTA
        if (state.myFeedbacks.isEmpty && communityFeedbacks.isEmpty) ...[
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
            child: Column(
              children: [
                Icon(
                  Icons.forum_outlined,
                  size: 32,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.repeaterDetailBeFirstFeedback,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
        // User's feedbacks section
        if (state.myFeedbacks.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              l10n.repeaterDetailYourFeedback.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 10,
              ),
            ),
          ),
          ...state.myFeedbacks.map(
            (feedback) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MyFeedbackCard(
                feedback: feedback,
                userCallsign: userCallsign,
                userAvatarUrl: userAvatarUrl,
                onDelete: () => controller.deleteFeedback(feedback.id),
                isLoading: state.isDeletingFeedback,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
        // Others reports section header
        if (communityFeedbacks.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              l10n.repeaterDetailOthersReports.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 10,
              ),
            ),
          ),
          ...communityFeedbacks.map(
            (feedback) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CommunityFeedbackCard(feedback: feedback),
            ),
          ),
          if (state.feedbackStats != null &&
              (state.feedbackStats!.likesTotal + state.feedbackStats!.downTotal) >
                  communityFeedbacks.length + state.myFeedbacks.length)
            Center(
              child: TextButton(
                onPressed: () {
                  // TO-DO: Navigate to full feedbacks list
                },
                child: Text(
                  l10n.repeaterDetailViewAllReports(
                    state.feedbackStats!.likesTotal + state.feedbackStats!.downTotal,
                  ),
                ),
              ),
            ),
        ],
      ],
    );
  }
}
