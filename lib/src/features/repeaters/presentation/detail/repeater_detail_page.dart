import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/icons/repeater_access_icon.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/repeater_detail_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/state/repeater_detail_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/access_modes_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/community/community_reports_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/location_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/performance_metrics_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/repeater_detail_action_buttons.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/repeater_header.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/technical_data_section.dart';
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
    final colorMode = RepeaterAccessIcon.getPrimaryColor(state.repeater.accesses);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
      slivers: [
        // Header
        RepeaterHeader(
          repeater: state.repeater,
          colorMode: colorMode,
        ),
        // Action buttons
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: RepeaterDetailActionButtons(repeater: state.repeater),
          ),
        ),
        // Content
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
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
              // Location
              LocationSection(repeater: state.repeater),
              const SizedBox(height: 16),
              // Community Reports
              CommunityReportsSection(
                state: state,
                controller: controller,
              ),
            ]),
          ),
        ),
      ],
      ),
    );
  }
}
