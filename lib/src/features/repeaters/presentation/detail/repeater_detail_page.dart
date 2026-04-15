import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/responsive/responsive_layout.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/repeater_detail_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/state/repeater_detail_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/repeater_detail_tablet.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/access_modes_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/community/community_reports_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/frequency_fun_facts_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/info_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/location_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/performance_metrics_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/repeater_detail_action_buttons.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/repeater_header.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/technical_data_section.dart';
import 'package:hamqrg/src/features/spots/domain/spot_state.dart';
import 'package:hamqrg/src/features/spots/presentation/create_spot_sheet/create_other_spot_sheet.dart';
import 'package:hamqrg/src/features/spots/presentation/create_spot_sheet/create_spot_sheet.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/active_spots_section.dart';
import 'package:hamqrg/src/features/spots/provider/active_spots_notifier/active_spots_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RepeaterDetailPage extends HookConsumerWidget {
  const RepeaterDetailPage({
    required this.repeaterId,
    super.key,
  });

  final String repeaterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerAsync = ref.watch(
      repeaterDetailControllerProvider(repeaterId),
    );
    final controllerNotifier = ref.read(
      repeaterDetailControllerProvider(repeaterId).notifier,
    );

    return Scaffold(
      body: controllerAsync.when(
        data: (state) => ResponsiveLayout(
          mobile: (_) => _RepeaterDetailContent(
            state: state,
            controller: controllerNotifier,
          ),
          tablet: (_) => RepeaterDetailTablet(
            state: state,
            controller: controllerNotifier,
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                context.localization.error_message,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RepeaterDetailContent extends StatefulWidget {
  const _RepeaterDetailContent({
    required this.state,
    required this.controller,
  });

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  State<_RepeaterDetailContent> createState() => _RepeaterDetailContentState();
}

class _RepeaterDetailContentState extends State<_RepeaterDetailContent>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          RepeaterHeader(repeater: widget.state.repeater),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RepeaterDetailActionButtons(
                repeater: widget.state.repeater,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(
              tabBar: TabBar(
                controller: _tabController,
                labelColor: theme.colorScheme.primary,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                indicatorColor: theme.colorScheme.primary,
                indicatorWeight: 3,
                labelStyle: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: theme.textTheme.titleSmall,
                tabs: [
                  const Tab(text: 'Info'),
                  Tab(
                    child: _ClusterTabLabel(
                      repeaterId: widget.state.repeater.id,
                    ),
                  ),
                  Tab(
                    child: _CommunityTabLabel(
                      likesTotal: widget.state.feedbackStats?.likesTotal ?? 0,
                    ),
                  ),
                ],
              ),
              backgroundColor: theme.colorScheme.surface,
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            _InfoTab(state: widget.state, controller: widget.controller),
            _ClusterTab(state: widget.state),
            _CommunityTab(state: widget.state, controller: widget.controller),
          ],
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate({
    required this.tabBar,
    required this.backgroundColor,
  });

  final TabBar tabBar;
  final Color backgroundColor;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: backgroundColor,
      elevation: overlapsContent ? 2 : 0,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) =>
      oldDelegate.tabBar != tabBar ||
      oldDelegate.backgroundColor != backgroundColor;
}

class _InfoTab extends StatelessWidget {
  const _InfoTab({required this.state, required this.controller});

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TechnicalDataSection(repeater: state.repeater),
          const SizedBox(height: 16),
          AccessModesSection(repeater: state.repeater),
          const SizedBox(height: 16),
          InfoSection(repeater: state.repeater),
          const SizedBox(height: 16),
          LocationSection(
            repeater: state.repeater,
            calculatedDistanceKm: controller.getDistanceToRepeater(),
          ),
          const SizedBox(height: 16),
          FrequencyFunFactsSection(
            repeater: state.repeater,
            distanceKm: controller.getDistanceToRepeater(),
          ),
        ],
      ),
    );
  }
}

class _ClusterTab extends StatelessWidget {
  const _ClusterTab({required this.state});

  final RepeaterDetailState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ClusterSection(repeater: state.repeater),
          const SizedBox(height: 16),
          ActiveSpotsSection(repeaterId: state.repeater.id),
        ],
      ),
    );
  }
}

class _CommunityTab extends StatelessWidget {
  const _CommunityTab({required this.state, required this.controller});

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PerformanceMetricsSection(stats: state.feedbackStats),
          const SizedBox(height: 16),
          CommunityReportsSection(state: state, controller: controller),
        ],
      ),
    );
  }
}

class _ClusterTabLabel extends ConsumerWidget {
  const _ClusterTabLabel({required this.repeaterId});

  final String repeaterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotsAsync = ref.watch(activeSpotsProvider(repeaterId));
    final hasActive = spotsAsync.maybeWhen(
      data: (spots) => spots.any((s) => s.isActive),
      orElse: () => false,
    );

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
            child: Text('Cluster', overflow: TextOverflow.ellipsis),
          ),
          if (hasActive) ...[
            const SizedBox(width: 6),
            const _LiveDot(),
          ],
        ],
      ),
    );
  }
}

class _CommunityTabLabel extends StatelessWidget {
  const _CommunityTabLabel({required this.likesTotal});

  final int likesTotal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
            child: Text('Community', overflow: TextOverflow.ellipsis),
          ),
          if (likesTotal > 0) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.thumb_up_rounded,
                    size: 11,
                    color: theme.colorScheme.onTertiaryContainer,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '$likesTotal',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onTertiaryContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _LiveDot extends StatefulWidget {
  const _LiveDot();

  @override
  State<_LiveDot> createState() => _LiveDotState();
}

class _LiveDotState extends State<_LiveDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.error;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value;
        return SizedBox(
          width: 14,
          height: 14,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.25 * (1 - t)),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.6),
                      blurRadius: 4 + 4 * t,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ClusterSection extends HookConsumerWidget {
  const _ClusterSection({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cluster',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () async {
                  final authenticated =
                      await requireAuthentication(context, ref);
                  if (!authenticated || !context.mounted) return;
                  await showCreateSpotSheet(
                    context,
                    repeaterId: repeater.id,
                    accesses: repeater.accesses,
                  );
                },
                icon: const Icon(Icons.cell_tower, size: 18),
                label: Text(l10n.spotCreateTitle),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {
                  final authenticated =
                      await requireAuthentication(context, ref);
                  if (!authenticated || !context.mounted) return;
                  await showCreateOtherSpotSheet(
                    context,
                    repeaterId: repeater.id,
                    accesses: repeater.accesses,
                  );
                },
                icon: const Icon(Icons.person_search, size: 18),
                label: Text(l10n.spotCreateOtherTitle),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
