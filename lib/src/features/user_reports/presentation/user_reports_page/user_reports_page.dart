import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/time_helper.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_report.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_submission.dart';
import 'package:hamqrg/src/features/user_reports/presentation/user_reports_page/controller/state/user_reports_state.dart';
import 'package:hamqrg/src/features/user_reports/presentation/user_reports_page/controller/user_reports_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class UserReportsPage extends HookConsumerWidget {
  const UserReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);

    final controllerAsync = ref.watch(userReportsControllerProvider);
    final notifier = ref.read(userReportsControllerProvider.notifier);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.userReportsTitle,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.router.maybePop(),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.userReportsTabReports),
              Tab(text: l10n.userReportsTabSubmissions),
            ],
          ),
        ),
        body: controllerAsync.when(
          data: (state) => _buildTabContent(context, state, notifier),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          error: (error, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.userReportsError,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: notifier.reload,
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(
    BuildContext context,
    UserReportsState state,
    UserReportsController notifier,
  ) {
    return Column(
      children: [
        _StatusFilterBar(
          activeFilter: state.activeFilter,
          onFilterChanged: notifier.setFilter,
        ),
        if (state.hasLoadError) _RetryBanner(onRetry: notifier.reload),
        Expanded(
          child: TabBarView(
            children: [
              _ReportsTab(
                reports: _applyReportFilter(
                  state.reports,
                  state.activeFilter,
                ),
                activeFilter: state.activeFilter,
              ),
              _SubmissionsTab(
                submissions: _applySubmissionFilter(
                  state.submissions,
                  state.activeFilter,
                ),
                activeFilter: state.activeFilter,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<UserReport> _applyReportFilter(
    List<UserReport> reports,
    UserReportStatusFilter filter,
  ) {
    return switch (filter) {
      UserReportStatusFilter.all => reports,
      UserReportStatusFilter.open => reports
          .where(
            (r) =>
                r.status == UserReportStatus.pending ||
                r.status == UserReportStatus.reviewed,
          )
          .toList(),
      UserReportStatusFilter.closed => reports
          .where(
            (r) =>
                r.status == UserReportStatus.resolved ||
                r.status == UserReportStatus.rejected,
          )
          .toList(),
    };
  }

  List<UserSubmission> _applySubmissionFilter(
    List<UserSubmission> submissions,
    UserReportStatusFilter filter,
  ) {
    return switch (filter) {
      UserReportStatusFilter.all => submissions,
      UserReportStatusFilter.open => submissions
          .where((s) => s.status == UserSubmissionStatus.pending)
          .toList(),
      UserReportStatusFilter.closed => submissions
          .where(
            (s) =>
                s.status == UserSubmissionStatus.approved ||
                s.status == UserSubmissionStatus.rejected,
          )
          .toList(),
    };
  }
}

// ---------------------------------------------------------------------------
// Reports Tab
// ---------------------------------------------------------------------------

class _ReportsTab extends StatelessWidget {
  const _ReportsTab({
    required this.reports,
    required this.activeFilter,
  });

  final List<UserReport> reports;
  final UserReportStatusFilter activeFilter;

  @override
  Widget build(BuildContext context) {
    if (reports.isEmpty) {
      return _buildEmptyState(context, activeFilter, isSubmissions: false);
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: reports.length,
      itemBuilder: (_, index) => _UserReportCard(report: reports[index]),
    );
  }
}

// ---------------------------------------------------------------------------
// Submissions Tab
// ---------------------------------------------------------------------------

class _SubmissionsTab extends StatelessWidget {
  const _SubmissionsTab({
    required this.submissions,
    required this.activeFilter,
  });

  final List<UserSubmission> submissions;
  final UserReportStatusFilter activeFilter;

  @override
  Widget build(BuildContext context) {
    if (submissions.isEmpty) {
      return _buildEmptyState(context, activeFilter, isSubmissions: true);
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: submissions.length,
      itemBuilder: (_, index) =>
          _UserSubmissionCard(submission: submissions[index]),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared empty state
// ---------------------------------------------------------------------------

Widget _buildEmptyState(
  BuildContext context,
  UserReportStatusFilter activeFilter, {
  required bool isSubmissions,
}) {
  final l10n = context.localization;
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  final isFiltered = activeFilter != UserReportStatusFilter.all;

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSubmissions ? Icons.cell_tower : Icons.assignment_outlined,
            size: 64,
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            isFiltered
                ? (isSubmissions
                    ? l10n.userSubmissionsEmptyFiltered
                    : l10n.userReportsEmptyFiltered)
                : (isSubmissions
                    ? l10n.userSubmissionsEmpty
                    : l10n.userReportsEmpty),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          if (!isFiltered) ...[
            const SizedBox(height: 8),
            Text(
              isSubmissions
                  ? l10n.userSubmissionsEmptyDescription
                  : l10n.userReportsEmptyDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    ),
  );
}

// ---------------------------------------------------------------------------
// Status Filter Bar
// ---------------------------------------------------------------------------

class _StatusFilterBar extends StatelessWidget {
  const _StatusFilterBar({
    required this.activeFilter,
    required this.onFilterChanged,
  });

  final UserReportStatusFilter activeFilter;
  final ValueChanged<UserReportStatusFilter> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Row(
        children: [
          _FilterChip(
            label: l10n.userReportsFilterAll,
            isSelected: activeFilter == UserReportStatusFilter.all,
            onTap: () => onFilterChanged(UserReportStatusFilter.all),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: l10n.userReportsFilterOpen,
            isSelected: activeFilter == UserReportStatusFilter.open,
            onTap: () => onFilterChanged(UserReportStatusFilter.open),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: l10n.userReportsFilterClosed,
            isSelected: activeFilter == UserReportStatusFilter.closed,
            onTap: () => onFilterChanged(UserReportStatusFilter.closed),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: isSelected
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Retry Banner
// ---------------------------------------------------------------------------

class _RetryBanner extends StatelessWidget {
  const _RetryBanner({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: colorScheme.errorContainer,
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 20,
            color: colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              l10n.userReportsRetryBanner,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onErrorContainer,
                  ),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(l10n.retry),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Coordinator Response Widget (shared)
// ---------------------------------------------------------------------------

class _CoordinatorResponseBox extends StatelessWidget {
  const _CoordinatorResponseBox({required this.response, required this.label});

  final String response;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.primaryContainer.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.support_agent,
            size: 18,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  response,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Report Card
// ---------------------------------------------------------------------------

class _UserReportCard extends StatelessWidget {
  const _UserReportCard({required this.report});

  final UserReport report;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    final statusInfo = _getReportStatusInfo(report.status, l10n, colorScheme);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusInfo.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    statusInfo.icon,
                    color: statusInfo.color,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        report.repeaterCallsign,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (report.repeaterName != null &&
                          report.repeaterName!.isNotEmpty)
                        Text(
                          report.repeaterName!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusInfo.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    statusInfo.label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: statusInfo.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              report.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.8),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (report.coordinatorResponse != null &&
                report.coordinatorResponse!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _CoordinatorResponseBox(
                response: report.coordinatorResponse!,
                label: l10n.userReportsCoordinatorResponse,
              ),
            ],
            const SizedBox(height: 8),
            Text(
              TimeHelper.formatTimeAgo(report.createdAt, l10n),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Submission Card
// ---------------------------------------------------------------------------

class _UserSubmissionCard extends StatelessWidget {
  const _UserSubmissionCard({required this.submission});

  final UserSubmission submission;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    final statusInfo =
        _getSubmissionStatusInfo(submission.status, l10n, colorScheme);
    final label = submission.callsign ?? submission.name ?? '—';
    final frequencyMhz = (submission.frequencyHz / 1000000).toStringAsFixed(4);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusInfo.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    statusInfo.icon,
                    color: statusInfo.color,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '$frequencyMhz MHz',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusInfo.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    statusInfo.label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: statusInfo.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            if (submission.coordinatorResponse != null &&
                submission.coordinatorResponse!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _CoordinatorResponseBox(
                response: submission.coordinatorResponse!,
                label: l10n.userSubmissionsCoordinatorResponse,
              ),
            ],
            const SizedBox(height: 8),
            Text(
              TimeHelper.formatTimeAgo(submission.createdAt, l10n),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Status helpers
// ---------------------------------------------------------------------------

_StatusInfo _getReportStatusInfo(
  UserReportStatus status,
  AppLocalizations l10n,
  ColorScheme colorScheme,
) {
  return switch (status) {
    UserReportStatus.pending => _StatusInfo(
        icon: Icons.hourglass_empty,
        color: colorScheme.tertiary,
        label: l10n.userReportsStatusPending,
      ),
    UserReportStatus.reviewed => _StatusInfo(
        icon: Icons.manage_search,
        color: colorScheme.primary,
        label: l10n.userReportsStatusReviewed,
      ),
    UserReportStatus.resolved => _StatusInfo(
        icon: Icons.check_circle_outline,
        color: colorScheme.tertiary,
        label: l10n.userReportsStatusResolved,
      ),
    UserReportStatus.rejected => _StatusInfo(
        icon: Icons.cancel_outlined,
        color: colorScheme.error,
        label: l10n.userReportsStatusRejected,
      ),
  };
}

_StatusInfo _getSubmissionStatusInfo(
  UserSubmissionStatus status,
  AppLocalizations l10n,
  ColorScheme colorScheme,
) {
  return switch (status) {
    UserSubmissionStatus.pending => _StatusInfo(
        icon: Icons.hourglass_empty,
        color: colorScheme.tertiary,
        label: l10n.userSubmissionsStatusPending,
      ),
    UserSubmissionStatus.approved => _StatusInfo(
        icon: Icons.check_circle_outline,
        color: colorScheme.tertiary,
        label: l10n.userSubmissionsStatusApproved,
      ),
    UserSubmissionStatus.rejected => _StatusInfo(
        icon: Icons.cancel_outlined,
        color: colorScheme.error,
        label: l10n.userSubmissionsStatusRejected,
      ),
  };
}

class _StatusInfo {
  const _StatusInfo({
    required this.icon,
    required this.color,
    required this.label,
  });

  final IconData icon;
  final Color color;
  final String label;
}
