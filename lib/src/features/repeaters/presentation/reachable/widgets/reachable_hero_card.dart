import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/common/widgets/pro/pro_blur_gate.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/features/repeaters/presentation/reachable/reachable_repeaters_sheet.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_reachable/get_reachable_repeaters_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';

/// Headline upsell: "📡 you reach N repeaters from here". Pro-gated — non-Pro
/// users see a blurred teaser with the value proposition (no request fired).
class ReachableHeroCard extends ConsumerWidget {
  const ReachableHeroCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPro = ref.watch(isProProvider).maybeWhen(
          data: (v) => v,
          orElse: () => false,
        );
    final locked = AppConfigs.reachabilityRequiresPro && !isPro;

    return ProBlurGate(
      locked: locked,
      title: 'Cosa raggiungi da qui?',
      subtitle: 'Scopri i ponti che ti raggiungono, con segnale e profilo',
      ctaLabel: 'Scoprilo con PRO',
      onUnlock: () => openReachabilityPaywall(ref),
      teaser: const _HeroFrame(child: _HeroBody(count: null, teaser: true)),
      child: const _RealHero(),
    );
  }
}

class _RealHero extends ConsumerWidget {
  const _RealHero();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positionAsync = ref.watch(cachedUserPositionProvider);

    return positionAsync.when(
      loading: () => const _HeroFrame(child: _HeroBody(count: null)),
      error: (_, __) => const SizedBox.shrink(),
      data: (pos) {
        final summaryAsync = ref.watch(
          getReachableRepeatersProvider(
            latitude: pos.latitude,
            longitude: pos.longitude,
          ),
        );
        return _HeroFrame(
          onTap: () => ReachableRepeatersSheet.show(
            context,
            latitude: pos.latitude,
            longitude: pos.longitude,
          ),
          child: summaryAsync.when(
            loading: () => const _HeroBody(count: null),
            error: (_, __) => const _HeroBody(count: null),
            data: (summary) => _HeroBody(count: summary.reachableCount),
          ),
        );
      },
    );
  }
}

class _HeroFrame extends StatelessWidget {
  const _HeroFrame({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 132,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withValues(alpha: 0.7),
              theme.colorScheme.tertiary,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}

class _HeroBody extends StatelessWidget {
  const _HeroBody({required this.count, this.teaser = false});

  final int? count;
  final bool teaser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onColor = theme.colorScheme.onPrimary;
    final countText = teaser ? '••' : (count?.toString() ?? '…');

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Icon(Icons.cell_tower_rounded, color: onColor, size: 44),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Raggiungi ',
                      style: theme.textTheme.titleMedium?.copyWith(color: onColor),
                    ),
                    Text(
                      countText,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: onColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      ' ponti',
                      style: theme.textTheme.titleMedium?.copyWith(color: onColor),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  'dalla tua posizione · tocca per vederli',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: onColor.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: onColor),
        ],
      ),
    );
  }
}
