import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/repeater_detail_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/state/repeater_detail_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/access_modes_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/community/community_reports_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/frequency_fun_facts_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/info_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/location_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/performance_metrics_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/repeater_detail_action_buttons.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/repeater_header.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/technical_data_section.dart';
import 'package:hamqrg/src/features/spots/presentation/create_spot_sheet/create_other_spot_sheet.dart';
import 'package:hamqrg/src/features/spots/presentation/create_spot_sheet/create_spot_sheet.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/active_spots_section.dart';
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
        data: (state) => _RepeaterDetailContent(
          state: state,
          controller: controllerNotifier,
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

class _RepeaterDetailContent extends HookConsumerWidget {
  const _RepeaterDetailContent({
    required this.state,
    required this.controller,
  });

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          // Header
          RepeaterHeader(
            repeater: state.repeater,
          ),
          // Action buttons
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RepeaterDetailActionButtons(repeater: state.repeater),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Performance Metrics
                  PerformanceMetricsSection(
                    stats: state.feedbackStats,
                  ),
                  const SizedBox(height: 16),
                  // Technical Data
                  TechnicalDataSection(repeater: state.repeater),
                  const SizedBox(height: 16),
                  // Access Modes
                  AccessModesSection(repeater: state.repeater),
                  const SizedBox(height: 16),
                  // Cluster Spot buttons
                  _ClusterSection(
                    repeater: state.repeater,
                  ),
                  const SizedBox(height: 16),
                  // Active spots (Realtime)
                  ActiveSpotsSection(
                    repeaterId: state.repeater.id,
                  ),
                  const SizedBox(height: 16),
                  // Info
                  InfoSection(repeater: state.repeater),
                  const SizedBox(height: 16),
                  // Location
                  LocationSection(
                    repeater: state.repeater,
                    calculatedDistanceKm: controller.getDistanceToRepeater(),
                  ),
                  const SizedBox(height: 16),
                  // Fun Facts
                  FrequencyFunFactsSection(
                    repeater: state.repeater,
                    distanceKm: controller.getDistanceToRepeater(),
                  ),
                  const SizedBox(height: 16),
                  // Community Reports
                  CommunityReportsSection(
                    state: state,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
