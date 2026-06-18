import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/repeater_card.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_reachable/get_reachable_repeaters_provider.dart';

/// Bottom sheet listing the repeaters reachable from the user, strongest
/// first, each shown with the standard repeater card + its predicted signal.
class ReachableRepeatersSheet extends ConsumerWidget {
  const ReachableRepeatersSheet({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final double latitude;
  final double longitude;

  static Future<void> show(
    BuildContext context, {
    required double latitude,
    required double longitude,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => ReachableRepeatersSheet(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final async = ref.watch(
      getReachableRepeatersProvider(latitude: latitude, longitude: longitude),
    );

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      maxChildSize: 0.92,
      builder: (context, scrollController) => async.when(
        loading: () => const Center(
          heightFactor: 6,
          child: CircularProgressIndicator(),
        ),
        error: (_, __) => Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Impossibile calcolare i ponti raggiungibili.',
            style: theme.textTheme.bodyLarge,
          ),
        ),
        data: (summary) {
          final entries = summary.entries.where((e) => e.reachable).toList();
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Raggiungi ${summary.reachableCount} ${summary.reachableCount == 1 ? "ponte" : "ponti"}',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Dalla tua posizione, ordinati per segnale',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (entries.isEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Nessun ponte raggiungibile nei dintorni.',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList.builder(
                    itemCount: entries.length,
                    itemBuilder: (context, i) {
                      final entry = entries[i];
                      return RepeaterCard(
                        repeater: entry.repeater,
                        signalDbm: entry.dbm,
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
