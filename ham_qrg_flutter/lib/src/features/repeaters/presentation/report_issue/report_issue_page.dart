import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/common/widgets/snackbars/show_success_snackbar.dart';
import 'package:hamqrg/src/features/repeaters/presentation/report_issue/controller/report_issue_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ReportIssuePage extends HookConsumerWidget {
  const ReportIssuePage({
    required this.repeaterId,
    super.key,
  });

  final String repeaterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final descriptionController = useTextEditingController();
    final controllerAsync = ref.watch(reportIssueControllerProvider(repeaterId));
    final controller = ref.read(reportIssueControllerProvider(repeaterId).notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.router.maybePop(),
        ),
        title: controllerAsync.when(
          data: (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.reportIssueTitle.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                '${state.repeater.callsign} • ${state.repeater.name}',
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
          loading: () => Text(l10n.reportIssueTitle),
          error: (_, __) => Text(l10n.reportIssueTitle),
        ),
        actions: [
          controllerAsync.when(
            data: (state) {
              final isValid = controller.isFormValid();
              return TextButton(
                onPressed: isValid && !state.isSubmitting
                    ? () async {
                        try {
                          final success = await controller.submitReport();
                          if (success && context.mounted) {
                            showSuccessSnackbar(
                              context,
                              l10n.reportIssueSuccess,
                            );
                            await context.router.maybePop();
                          }
                        } catch (e) {
                          if (context.mounted) {
                            showErrorSnackbar(context, l10n.reportIssueError);
                          }
                        }
                      }
                    : null,
                child: state.isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        l10n.reportIssueSubmit.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isValid ? colorScheme.primary : null,
                        ),
                      ),
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: controllerAsync.when(
        data: (state) {
          // Sync description controller with state
          if (descriptionController.text != state.description) {
            descriptionController.text = state.description;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Headline
                Text(
                  l10n.reportIssueHeadline,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const Gap(8),
                Text(
                  l10n.reportIssueDescription,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: .8),
                  ),
                ),
                const Gap(24),

                // What to correct label
                Row(
                  children: [
                    Icon(
                      Icons.tune,
                      size: 18,
                      color: colorScheme.primary,
                    ),
                    const Gap(8),
                    Text(
                      l10n.reportIssueWhatToCorrect.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const Gap(12),

                // Description text field
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: .3,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: .1),
                    ),
                  ),
                  child: TextField(
                    controller: descriptionController,
                    onChanged: controller.setDescription,
                    maxLines: 12,
                    maxLength: ReportIssueController.maxChars,
                    decoration: InputDecoration(
                      hintText: l10n.reportIssuePlaceholder,
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: .4),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      counterText: '',
                    ),
                  ),
                ),
                const Gap(8),

                // Character count
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${state.description.length}/${ReportIssueController.maxChars}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: state.description.length > ReportIssueController.maxChars
                          ? colorScheme.error
                          : colorScheme.onSurface.withValues(alpha: .5),
                    ),
                  ),
                ),
                const Gap(24),

                // Verified submissions info card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: .3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: .1),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: .1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.info_outline,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.reportIssueVerifiedTitle,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              l10n.reportIssueVerifiedDescription,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withValues(
                                  alpha: .7,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(24),

                // Confirmation checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: state.isConfirmed,
                      onChanged: (value) => controller.setConfirmed(confirmed: value ?? false),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.setConfirmed(
                          confirmed: !state.isConfirmed,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            l10n.reportIssueConfirmCheckbox,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: .7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text(l10n.reportIssueError),
        ),
      ),
    );
  }
}
