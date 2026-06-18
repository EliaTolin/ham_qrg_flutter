import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/common/utils/signal_helper.dart';
import 'package:hamqrg/common/widgets/signal/signal_bars.dart';
import 'package:hamqrg/src/features/repeaters/domain/reachable/reachable_link.dart';
import 'package:hamqrg/src/features/repeaters/presentation/reachable/widgets/link_profile_chart.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_reachable/get_reachable_repeaters_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_reachable/get_repeater_link_provider.dart';

/// Bottom sheet listing the repeaters reachable from the user, strongest
/// first, each with a signal meter. Tapping a row opens its link profile.
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
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
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
                SliverList.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, i) => _ReachableRow(
                    entry: entries[i],
                    userLat: latitude,
                    userLon: longitude,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ReachableRow extends StatelessWidget {
  const _ReachableRow({
    required this.entry,
    required this.userLat,
    required this.userLon,
  });

  final ReachableEntry entry;
  final double userLat;
  final double userLon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final r = entry.repeater;
    final title = r.callsign ?? r.name ?? 'Ponte';

    return ListTile(
      onTap: () => _openChart(context),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(
        '${entry.distanceKm.toStringAsFixed(1)} km · ${(r.frequencyHz / 1000000).toStringAsFixed(3)} MHz',
        style: theme.textTheme.bodySmall,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            SignalHelper.dbmLabel(entry.dbm),
            style: theme.textTheme.labelMedium?.copyWith(
              color: SignalHelper.colorFromDbm(entry.dbm),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 10),
          SignalBars(dbm: entry.dbm),
        ],
      ),
    );
  }

  void _openChart(BuildContext context) {
    final r = entry.repeater;
    if (r.latitude == null || r.longitude == null) return;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              r.callsign ?? r.name ?? 'Ponte',
              style: Theme.of(ctx).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Consumer(
              builder: (context, ref, _) {
                final linkAsync = ref.watch(
                  getRepeaterLinkProvider(
                    userLat: userLat,
                    userLon: userLon,
                    repeaterId: r.id,
                    repeaterLat: r.latitude!,
                    repeaterLon: r.longitude!,
                    frequencyHz: r.frequencyHz,
                  ),
                );
                return linkAsync.when(
                  loading: () => const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (_, __) => const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text('Profilo non disponibile.'),
                  ),
                  data: (link) => LinkProfileChart(link: link),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
