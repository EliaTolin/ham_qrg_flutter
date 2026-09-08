import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/clients/mapbox_offline/mapbox_offline_client.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/bytes_format_helper.dart';
import 'package:hamqrg/common/widgets/empty_state_widget.dart';
import 'package:hamqrg/common/widgets/error/app_error_widget.dart';
import 'package:hamqrg/common/widgets/loading/circular_loading_widget.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/src/features/offline_maps/presentation/add_offline_region_sheet/add_offline_region_sheet.dart';
import 'package:hamqrg/src/features/offline_maps/presentation/offline_maps_page/controller/offline_maps_controller.dart';
import 'package:hamqrg/src/features/offline_maps/presentation/offline_maps_page/controller/state/offline_maps_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Formatta una dimensione in MB/GB leggibili (simboli non linguistici).

/// PRO: gestione delle regioni di mappa scaricate per l'uso offline.
@RoutePage()
class OfflineMapsPage extends HookConsumerWidget {
  const OfflineMapsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final asyncState = ref.watch(offlineMapsControllerProvider);
    final notifier = ref.read(offlineMapsControllerProvider.notifier);

    ref.listen(offlineMapsControllerProvider, (previous, next) {
      final prev = previous?.value;
      final value = next.value;
      if (value == null) return;
      if (value.hasDownloadError && !(prev?.hasDownloadError ?? false)) {
        showErrorSnackbar(context, l10n.offlineMapsDownloadError);
        notifier.clearErrors();
      }
      if (value.hasDeleteError && !(prev?.hasDeleteError ?? false)) {
        showErrorSnackbar(context, l10n.offlineMapsDeleteError);
        notifier.clearErrors();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.offlineMapsTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (asyncState.value?.downloadingRegionId != null)
            ? null
            : () async {
                final request = await showAddOfflineRegionSheet(context, ref);
                if (request != null) {
                  await notifier.download(request);
                }
              },
        icon: const Icon(Icons.download_for_offline_outlined),
        label: Text(l10n.offlineMapsAddRegion),
      ),
      body: asyncState.when(
        loading: CircularLoadingWidget.new,
        error: (error, stackTrace) => AppErrorWidget(
          label: 'Offline maps',
          error: error,
          stackTrace: stackTrace,
          onRetry: () => ref.invalidate(offlineMapsControllerProvider),
        ),
        data: (state) => _RegionsList(state: state, notifier: notifier),
      ),
    );
  }
}

class _RegionsList extends StatelessWidget {
  const _RegionsList({required this.state, required this.notifier});

  final OfflineMapsState state;
  final OfflineMapsController notifier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (state.regions.isEmpty && state.downloadingRegionId == null) {
      return EmptyStateWidget(
        icon: Icons.map_outlined,
        message: l10n.offlineMapsEmpty,
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
      children: [
        if (state.downloadingRegionId != null) ...[
          _DownloadProgressCard(state: state),
          const Gap(12),
        ],
        for (final region in state.regions) ...[
          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  region.isComplete
                      ? Icons.map_outlined
                      : Icons.downloading_outlined,
                  color: colorScheme.onPrimary,
                  size: 20,
                ),
              ),
              title: Text(region.name),
              subtitle: Text(
                region.isComplete
                    ? l10n.offlineMapsRegionSubtitle(
                        region.radiusKm == null
                            ? '-'
                            : context.units.presetRadius(region.radiusKm!),
                        BytesFormatHelper.format(region.sizeBytes),
                      )
                    : l10n.offlineMapsIncomplete,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: region.isComplete
                      ? colorScheme.onSurfaceVariant
                      : colorScheme.error,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!region.isComplete && state.downloadingRegionId == null)
                    TextButton(
                      onPressed: () => notifier.resume(region),
                      child: Text(l10n.offlineMapsResume),
                    ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: colorScheme.error,
                    ),
                    onPressed: () => _confirmDelete(context, region),
                  ),
                ],
              ),
            ),
          ),
          const Gap(12),
        ],
      ],
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    OfflineRegionSnapshot region,
  ) async {
    final l10n = context.localization;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.offlineMapsDeleteConfirmTitle),
        content: Text(l10n.offlineMapsDeleteConfirmMessage(region.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.offlineMapsDeleteConfirm),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      await notifier.delete(region.id);
    }
  }
}

class _DownloadProgressCard extends StatelessWidget {
  const _DownloadProgressCard({required this.state});

  final OfflineMapsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final percent = (state.downloadProgress * 100).round();

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.downloadPhase == OfflineDownloadPhase.stylePack
                  ? l10n.offlineMapsDownloadingStyle
                  : l10n.offlineMapsDownloadingTiles('$percent'),
              style: theme.textTheme.bodyMedium,
            ),
            const Gap(12),
            LinearProgressIndicator(value: state.downloadProgress),
          ],
        ),
      ),
    );
  }
}
