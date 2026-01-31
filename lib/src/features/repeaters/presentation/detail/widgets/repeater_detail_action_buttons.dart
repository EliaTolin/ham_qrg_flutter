import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/favorite_repeaters_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class RepeaterDetailActionButtons extends ConsumerWidget {
  const RepeaterDetailActionButtons({
    required this.repeater,
    super.key,
  });

  final Repeater repeater;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final favoritesAsync = ref.watch(favoriteRepeatersProvider);
    final isFavorite = favoritesAsync.value?.ids.contains(repeater.id) ?? false;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              icon: isFavorite ? Icons.favorite : Icons.favorite_border,
              iconColor: isFavorite ? Colors.pink : null,
              label: isFavorite ? l10n.repeaterDetailSaved : l10n.repeaterDetailSave,
              onTap: () => _onFavoriteTap(context, ref, isFavorite),
            ),
          ),
          Container(
            width: 1,
            height: 32,
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
          Expanded(
            child: _ActionButton(
              icon: Icons.share,
              label: l10n.repeaterDetailShare,
              onTap: () => _onShareTap(context),
            ),
          ),
          Container(
            width: 1,
            height: 32,
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
          Expanded(
            child: _ActionButton(
              icon: Icons.flag_outlined,
              label: l10n.repeaterDetailReport,
              onTap: () => _onReportTap(context, ref),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onFavoriteTap(
    BuildContext context,
    WidgetRef ref,
    bool isFavorite,
  ) async {
    final isAuthenticated = await requireAuthentication(context, ref);
    if (!isAuthenticated) return;

    final notifier = ref.read(favoriteRepeatersProvider.notifier);
    if (isFavorite) {
      await notifier.remove(repeater.id);
    } else {
      await notifier.add(repeater.id);
    }
  }

  Future<void> _onShareTap(BuildContext context) async {
    final l10n = context.localization;
    final shareText = RepeaterFormatHelper.formatShareMessage(
      repeater,
      l10n.repeaterDetailShareMessage,
    );

    await SharePlus.instance.share(ShareParams(text: shareText));
  }

  Future<void> _onReportTap(BuildContext context, WidgetRef ref) async {
    final isAuthenticated = await requireAuthentication(context, ref);
    if (!isAuthenticated) return;

    if (context.mounted) {
      await context.router.push(ReportIssueRoute(repeaterId: repeater.id));
    }
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: iconColor ?? colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
