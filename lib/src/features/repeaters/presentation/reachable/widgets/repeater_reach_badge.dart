import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/signal_helper.dart';
import 'package:hamqrg/common/widgets/pro/pro_blur_gate.dart';
import 'package:hamqrg/common/widgets/signal/signal_bars.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/features/repeaters/domain/reachable/reachable_link.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/reachable/widgets/link_profile_chart.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_reachable/get_repeater_link_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_price_line.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// "Do I reach this repeater from where I am?" — a Pro-gated badge for the
/// repeater detail. Non-Pro users see a blurred teaser (no request); Pro users
/// see the real verdict + signal, and can tap to open the link profile chart.
class RepeaterReachBadge extends HookConsumerWidget {
  const RepeaterReachBadge({required this.repeater, super.key});

  final Repeater repeater;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (repeater.latitude == null || repeater.longitude == null) {
      return const SizedBox.shrink();
    }
    final isPro = ref.watch(isProProvider).maybeWhen(
          data: (v) => v,
          orElse: () => false,
        );
    final locked = AppConfigs.reachabilityRequiresPro && !isPro;
    final l10n = context.localization;
    final analytics = ref.read(analyticsClientProvider);

    // Una sola registrazione per cambio di stato, non a ogni ricostruzione:
    // il badge si ridisegna spesso e conteggiare i rebuild gonfierebbe il
    // numeratore del funnel rendendo il tasso di conversione inutilizzabile.
    useEffect(
      () {
        if (locked) {
          analytics.track(
            AnalyticsEvent.coverageTeaserShown,
            surface: AnalyticsSurface.reachBadge,
          );
        }
        return null;
      },
      [locked],
    );

    return ProBlurGate(
      locked: locked,
      title: l10n.reachBadgeTitle,
      subtitle: l10n.reachBadgeSubtitle,
      ctaLabel: l10n.reachDiscoverCta,
      onUnlock: () => openPaywall(
        ref,
        PaywallPlacement.reachBadge,
        surface: AnalyticsSurface.reachBadge,
      ),
      // Compatto: qui il gate è un elemento fra molti sul dettaglio del
      // ripetitore, non la schermata. Nella forma impilata occupava mezzo
      // schermo e spingeva sotto la piega frequenze, toni e accessi — cioè
      // proprio ciò per cui l'utente ha aperto la pagina.
      dense: true,
      footer: const ProPriceLine(
        placement: PaywallPlacement.reachBadge,
        dense: true,
      ),
      teaser: const _BadgeFrame(child: _MockBadgeRow()),
      child: _RealReachBadge(repeater: repeater),
    );
  }
}

class _RealReachBadge extends ConsumerWidget {
  const _RealReachBadge({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positionAsync = ref.watch(cachedUserPositionProvider);

    return positionAsync.when(
      loading: () => const _BadgeFrame(child: _BadgeLoading()),
      error: (_, __) => const SizedBox.shrink(),
      data: (pos) {
        final linkAsync = ref.watch(
          getRepeaterLinkProvider(
            userLat: pos.latitude,
            userLon: pos.longitude,
            repeaterId: repeater.id,
            repeaterLat: repeater.latitude!,
            repeaterLon: repeater.longitude!,
            frequencyHz: repeater.frequencyHz,
          ),
        );
        return linkAsync.when(
          loading: () => const _BadgeFrame(child: _BadgeLoading()),
          error: (_, __) => const SizedBox.shrink(),
          data: (link) => _BadgeFrame(
            onTap: link.points.length >= 2
                ? () => _openProfile(context, link)
                : null,
            child: _BadgeContent(link: link),
          ),
        );
      },
    );
  }

  void _openProfile(BuildContext context, LinkProfile link) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          0,
          20,
          20 + MediaQuery.of(ctx).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repeater.callsign ??
                  repeater.name ??
                  ctx.localization.reachRepeaterFallback,
              style: Theme.of(ctx).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            LinkProfileChart(link: link),
          ],
        ),
      ),
    );
  }
}

class _BadgeFrame extends StatelessWidget {
  const _BadgeFrame({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color:
              theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        child: child,
      ),
    );
  }
}

class _BadgeContent extends StatelessWidget {
  const _BadgeContent({required this.link});

  final LinkProfile link;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final reachable = link.reachable;
    final color = SignalHelper.colorFromDbm(link.dbm);
    final distance = context.units.distanceFromKm(link.distanceKm);

    return Row(
      children: [
        Icon(
          reachable ? Icons.check_circle_rounded : Icons.cancel_rounded,
          color: reachable
              ? color
              : theme.colorScheme.onSurface.withValues(alpha: 0.4),
          size: 22,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reachable ? l10n.reachReachable : l10n.reachOutOfCoverage,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                reachable
                    ? l10n.reachReachableDetail(
                        SignalHelper.dbmLabel(link.dbm),
                        distance,
                      )
                    : l10n.reachDistanceFromHere(distance),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                ),
              ),
            ],
          ),
        ),
        if (reachable) SignalBars(dbm: link.dbm),
      ],
    );
  }
}

class _BadgeLoading extends StatelessWidget {
  const _BadgeLoading();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: 12),
        Text(
          context.localization.reachComputing,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

/// Static mock shown (blurred) to non-Pro users — no data, no request.
class _MockBadgeRow extends StatelessWidget {
  const _MockBadgeRow();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          Icons.check_circle_rounded,
          color: SignalHelper.colorFromDbm(-88),
          size: 22,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localization.reachReachable,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '-•• dBm · •• ${context.units.longSymbol}',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SignalBars(dbm: -88),
      ],
    );
  }
}
