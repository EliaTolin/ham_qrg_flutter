import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/controller/pota_spot_detail_controller.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/controller/state/pota_spot_detail_state.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/widgets/pota_park_info_section.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/widgets/pota_spot_header.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart'
    show spotTimeAgo;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class PotaSpotDetailPage extends HookConsumerWidget {
  const PotaSpotDetailPage({
    @PathParam('spotId') required this.spotId,
    @PathParam('reference') required this.reference,
    super.key,
  });

  final int spotId;
  final String reference;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
      potaSpotDetailControllerProvider(spotId, reference),
    );

    return Scaffold(
      body: asyncState.when(
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
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                context.localization.potaLoadError,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        data: (state) => _PotaSpotDetailContent(state: state),
      ),
    );
  }
}

class _PotaSpotDetailContent extends StatelessWidget {
  const _PotaSpotDetailContent({required this.state});

  final PotaSpotDetailState state;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Header
        PotaSpotHeader(spot: state.spot),

        // Action buttons
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: _ActionButtonsRow(
              activator: state.spot.activator,
              parkWebsite: state.park?.website,
            ),
          ),
        ),

        // Content
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Park info
                if (state.park != null)
                  PotaParkInfoSection(
                    park: state.park!,
                    distanceKm: state.distanceKm,
                  ),

                // Spot details section
                const SizedBox(height: 16),
                _SpotDetailsSection(state: state),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionButtonsRow extends StatelessWidget {
  const _ActionButtonsRow({
    required this.activator,
    this.parkWebsite,
  });

  final String activator;
  final String? parkWebsite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // QRZ.com lookup
            Expanded(
              child: _ActionButton(
                icon: Icons.person_search,
                label: l10n.potaOpenQrz,
                onTap: () => _openQrz(context, activator),
              ),
            ),
            VerticalDivider(
              width: 1,
              color: colorScheme.outline.withValues(alpha: 0.15),
            ),
            // Park website
            if (parkWebsite != null) ...[
              Expanded(
                child: _ActionButton(
                  icon: Icons.language,
                  label: l10n.potaParkWebsite,
                  onTap: () => _openUrl(context, parkWebsite!),
                ),
              ),
              VerticalDivider(
                width: 1,
                color: colorScheme.outline.withValues(alpha: 0.15),
              ),
            ],
            // POTA page
            Expanded(
              child: _ActionButton(
                icon: Icons.open_in_new,
                label: 'POTA',
                onTap: () => _openUrl(
                  context,
                  'https://pota.app',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openQrz(BuildContext context, String callsign) async {
    final uri = Uri.parse('https://www.qrz.com/db/$callsign');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else if (context.mounted) {
      showErrorSnackbar(context, context.localization.potaQrzError);
    }
  }

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else if (context.mounted) {
      showErrorSnackbar(context, context.localization.potaQrzError);
    }
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: colorScheme.onSurfaceVariant),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _SpotDetailsSection extends StatelessWidget {
  const _SpotDetailsSection({required this.state});

  final PotaSpotDetailState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final spot = state.spot;

    final hasDetails = spot.spotter != null ||
        (spot.comments != null && spot.comments!.isNotEmpty) ||
        spot.source != null;

    if (!hasDetails) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Row(
            children: [
              Icon(Icons.info_outline, size: 18, color: colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                'Spot Info',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Spotted time
          _SpotDetailTile(
            icon: Icons.access_time,
            label: l10n.potaLastSpotted,
            value: spotTimeAgo(spot.spotTime),
            iconColor: colorScheme.primary,
          ),

          // Spotter
          if (spot.spotter != null) ...[
            Divider(
              height: 20,
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
            _SpotDetailTile(
              icon: Icons.hearing,
              label: l10n.potaSpotter,
              value: spot.spotter!,
              iconColor: Colors.teal,
            ),
          ],

          // Comments
          if (spot.comments != null && spot.comments!.isNotEmpty) ...[
            Divider(
              height: 20,
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
            _SpotDetailTile(
              icon: Icons.chat_bubble_outline,
              label: l10n.potaComments,
              value: spot.comments!,
              iconColor: Colors.amber.shade700,
            ),
          ],

          // Source
          if (spot.source != null) ...[
            Divider(
              height: 20,
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
            _SpotDetailTile(
              icon: Icons.source,
              label: 'Source',
              value: spot.source!,
              iconColor: colorScheme.onSurfaceVariant,
            ),
          ],
        ],
      ),
    );
  }
}

class _SpotDetailTile extends StatelessWidget {
  const _SpotDetailTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
