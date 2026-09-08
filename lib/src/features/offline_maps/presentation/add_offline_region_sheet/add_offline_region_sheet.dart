import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/clients/mapbox_offline/impl/mapbox_offline_client_impl.dart';
import 'package:hamqrg/clients/mapbox_offline/mapbox_offline_client.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/bytes_format_helper.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/place_search_bar.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Sheet di download di una nuova regione offline. Il centro è la posizione
/// attuale dell'utente oppure un luogo cercato (città, indirizzo, coordinate):
/// si può preparare la mappa di una zona in cui si andrà, non solo di dove
/// ci si trova. Restituisce la richiesta confermata, o `null`.
Future<OfflineRegionRequest?> showAddOfflineRegionSheet(
  BuildContext context,
  WidgetRef ref,
) {
  return showModalBottomSheet<OfflineRegionRequest>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => const _AddOfflineRegionSheet(),
  );
}

const _radiusOptionsKm = [10.0, 25.0, 50.0];

typedef _Center = ({double latitude, double longitude});

enum _CenterMode { myLocation, search }

class _AddOfflineRegionSheet extends HookConsumerWidget {
  const _AddOfflineRegionSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final nameController = useTextEditingController();
    final selectedRadius = useState(_radiusOptionsKm[1]);
    final estimate = useState<OfflineRegionEstimate?>(null);
    final centerMode = useState(_CenterMode.myLocation);
    final myPosition = useState<_Center?>(null);
    final searchPoint = useState<SearchPoint?>(null);

    final center = switch (centerMode.value) {
      _CenterMode.myLocation => myPosition.value,
      _CenterMode.search => switch (searchPoint.value) {
          final point? => (
              latitude: point.latitude,
              longitude: point.longitude
            ),
          null => null,
        },
    };

    // Posizione attuale (o default dell'app se il GPS non è disponibile).
    useEffect(
      () {
        var disposed = false;
        Future<void> load() async {
          final current = await ref
              .read(locationServiceProvider)
              .getCurrentPositionOrDefault();
          if (disposed) return;
          myPosition.value = (
            latitude: current.latitude,
            longitude: current.longitude,
          );
        }

        load();
        return () => disposed = true;
      },
      const [],
    );

    // La stima si aggiorna al cambio di raggio o di centro.
    useEffect(
      () {
        if (center == null) return null;
        var disposed = false;
        Future<void> load() async {
          estimate.value = null;
          try {
            final result =
                await ref.read(mapboxOfflineClientProvider).estimateRegion(
                      _buildRequest(
                        name: '',
                        center: center,
                        radiusKm: selectedRadius.value,
                      ),
                    );
            if (!disposed) estimate.value = result;
          } catch (_) {
            // Stima non disponibile (es. offline): il download resta
            // possibile, semplicemente senza anteprima della dimensione.
          }
        }

        load();
        return () => disposed = true;
      },
      [selectedRadius.value, center],
    );

    void onPlaceSelected(SearchPoint point) {
      searchPoint.value = point;
      // Il nome della regione si precompila col luogo, se l'utente non ne ha
      // già scritto uno.
      if (nameController.text.trim().isEmpty) {
        nameController.text = point.label;
      }
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.offlineMapsAddRegion,
            style: theme.textTheme.titleLarge,
          ),
          const Gap(16),
          SegmentedButton<_CenterMode>(
            segments: [
              ButtonSegment(
                value: _CenterMode.myLocation,
                icon: const Icon(Icons.my_location_rounded),
                label: Text(l10n.offlineMapsCenterMine),
              ),
              ButtonSegment(
                value: _CenterMode.search,
                icon: const Icon(Icons.search_rounded),
                label: Text(l10n.offlineMapsCenterSearch),
              ),
            ],
            selected: {centerMode.value},
            onSelectionChanged: (selection) =>
                centerMode.value = selection.first,
          ),
          const Gap(12),
          switch (centerMode.value) {
            _CenterMode.myLocation => Text(
                l10n.offlineMapsCenterInfo,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            _CenterMode.search => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.offlineMapsCenterSearchInfo,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Gap(8),
                  PlaceSearchBar(onSelected: onPlaceSelected),
                  if (searchPoint.value case final point?) ...[
                    const Gap(8),
                    Row(
                      children: [
                        Icon(
                          Icons.place_rounded,
                          size: 18,
                          color: colorScheme.primary,
                        ),
                        const Gap(6),
                        Expanded(
                          child: Text(
                            l10n.offlineMapsCenterSelected(point.label),
                            style: theme.textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
          },
          const Gap(16),
          TextField(
            controller: nameController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: l10n.offlineMapsRegionNameLabel,
              hintText: l10n.offlineMapsRegionNameHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const Gap(16),
          Text(
            l10n.offlineMapsRadiusLabel,
            style: theme.textTheme.labelMedium,
          ),
          const Gap(8),
          Wrap(
            spacing: 8,
            children: [
              for (final radius in _radiusOptionsKm)
                ChoiceChip(
                  label: Text(context.units.presetRadius(radius)),
                  selected: selectedRadius.value == radius,
                  onSelected: (_) => selectedRadius.value = radius,
                ),
            ],
          ),
          const Gap(16),
          if (estimate.value case final size?)
            Text(
              l10n.offlineMapsEstimatedSize(
                BytesFormatHelper.format(size.transferSizeBytes),
              ),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          const Gap(16),
          FilledButton.icon(
            onPressed: center == null
                ? null
                : () => Navigator.of(context).pop(
                      _buildRequest(
                        name: nameController.text.trim(),
                        center: center,
                        radiusKm: selectedRadius.value,
                      ),
                    ),
            icon: const Icon(Icons.download_for_offline_outlined),
            label: Text(l10n.offlineMapsDownload),
          ),
        ],
      ),
    );
  }

  OfflineRegionRequest _buildRequest({
    required String name,
    required _Center center,
    required double radiusKm,
  }) {
    final id = 'region_${DateTime.now().millisecondsSinceEpoch}';
    return OfflineRegionRequest(
      id: id,
      name: name.isEmpty ? id : name,
      latitude: center.latitude,
      longitude: center.longitude,
      radiusKm: radiusKm,
    );
  }
}
