import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/time_helper.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_report.dart';
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

    return Scaffold(
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
      ),
      body: controllerAsync.when(
        data: (state) => _buildContent(context, state, notifier),
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
    );
  }

  Widget _buildContent(
    BuildContext context,
    UserReportsState state,
    UserReportsController notifier,
  ) {
    final filteredReports = _applyFilter(state.reports, state.activeFilter);

    return Column(
      children: [
        _StatusFilterBar(
          activeFilter: state.activeFilter,
          onFilterChanged: notifier.setFilter,
        ),
        if (state.hasLoadError) _RetryBanner(onRetry: notifier.reload),
        Expanded(
          child: filteredReports.isEmpty
              ? _buildEmptyState(context, state.activeFilter)
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  itemCount: filteredReports.length,
                  itemBuilder: (_, index) => _UserReportCard(
                    report: filteredReports[index],
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(
    BuildContext context,
    UserReportStatusFilter activeFilter,
  ) {
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
              Icons.assignment_outlined,
              size: 64,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              isFiltered
                  ? l10n.userReportsEmptyFiltered
                  : l10n.userReportsEmpty,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            if (!isFiltered) ...[
              const SizedBox(height: 8),
              Text(
                l10n.userReportsEmptyDescription,
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

  List<UserReport> _applyFilter(
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
}

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

class _UserReportCard extends StatelessWidget {
  const _UserReportCard({required this.report});

  final UserReport report;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    final statusInfo = _getStatusInfo(report.status, l10n, colorScheme);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.router.push(
            RepeaterDetailRoute(repeaterId: report.repeaterId),
          );
        },
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
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:
                          colorScheme.primaryContainer.withValues(alpha: 0.5),
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
                              l10n.userReportsCoordinatorResponse,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              report.coordinatorResponse!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
      ),
    );
  }

  _StatusInfo _getStatusInfo(
    UserReportStatus status,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return switch (status) {
      UserReportStatus.pending => _StatusInfo(
          icon: Icons.hourglass_empty,
          color: Colors.amber.shade700,
          label: l10n.userReportsStatusPending,
        ),
      UserReportStatus.reviewed => _StatusInfo(
          icon: Icons.manage_search,
          color: Colors.blue.shade600,
          label: l10n.userReportsStatusReviewed,
        ),
      UserReportStatus.resolved => _StatusInfo(
          icon: Icons.check_circle_outline,
          color: Colors.green.shade600,
          label: l10n.userReportsStatusResolved,
        ),
      UserReportStatus.rejected => _StatusInfo(
          icon: Icons.cancel_outlined,
          color: Colors.red.shade600,
          label: l10n.userReportsStatusRejected,
        ),
    };
  }
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
