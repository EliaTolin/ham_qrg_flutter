import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coordinate_parser.dart';
import 'package:hamqrg/src/features/coverage_search/domain/place_suggestion.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point_error.dart';
import 'package:hamqrg/src/features/coverage_search/errors/coverage_search_exception.dart';
import 'package:hamqrg/src/features/coverage_search/provider/recent_searches/recent_searches_provider.dart';
import 'package:hamqrg/src/features/coverage_search/provider/search_places/search_places_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Attesa dopo l'ultima battuta prima di interrogare la geocodifica.
///
/// Sta dentro il secondo concesso ai suggerimenti (SC-002) e al tempo stesso
/// evita una richiesta a pagamento per ogni tasto premuto.
const Duration _debounce = Duration(milliseconds: 350);

/// Barra di ricerca del punto: località, indirizzi e coordinate decimali.
///
/// Funziona per **tutti** gli utenti (FR-011): cercare un posto e spostare la
/// mappa è navigazione, non la capacità venduta. Ciò che è Pro è il responso di
/// ricezione, che arriva dopo.
class PlaceSearchBar extends HookConsumerWidget {
  const PlaceSearchBar({
    required this.onSelected,
    this.onError,
    super.key,
  });

  /// Invocata quando l'utente fissa un punto.
  final ValueChanged<SearchPoint> onSelected;

  /// Invocata quando la selezione fallisce, per mostrare il banner sulla mappa.
  final ValueChanged<SearchPointError>? onError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    final textController = useTextEditingController();
    final focusNode = useFocusNode();
    final query = useState<String>('');
    final isOpen = useState<bool>(false);
    final debounceTimer = useRef<Timer?>(null);

    useEffect(
      () {
        void onFocusChange() => isOpen.value = focusNode.hasFocus;
        focusNode.addListener(onFocusChange);
        return () {
          focusNode.removeListener(onFocusChange);
          debounceTimer.value?.cancel();
        };
      },
      [focusNode],
    );

    void select(SearchPoint point) {
      focusNode.unfocus();
      textController.clear();
      query.value = '';
      onSelected(point);
    }

    void onChanged(String value) {
      debounceTimer.value?.cancel();
      debounceTimer.value = Timer(_debounce, () => query.value = value.trim());
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          color: theme.colorScheme.surface,
          elevation: 4,
          shadowColor: theme.shadowColor,
          borderRadius: BorderRadius.circular(28),
          child: TextField(
            controller: textController,
            focusNode: focusNode,
            textInputAction: TextInputAction.search,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: l10n.coverageSearchHint,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              suffixIcon: textController.text.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () {
                        textController.clear();
                        query.value = '';
                      },
                    ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            ),
          ),
        ),
        if (isOpen.value)
          _SuggestionsPanel(
            query: query.value,
            onSelected: select,
            onError: onError,
          ),
      ],
    );
  }
}

class _SuggestionsPanel extends ConsumerWidget {
  const _SuggestionsPanel({
    required this.query,
    required this.onSelected,
    required this.onError,
  });

  final String query;
  final ValueChanged<SearchPoint> onSelected;
  final ValueChanged<SearchPointError>? onError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // Material e non Container: i ListTile dei suggerimenti disegnano l'onda
    // del tocco sul Material più vicino, e senza un antenato adatto Flutter
    // segnala a ogni frame che lo splash sarebbe invisibile.
    return Container(
      margin: const EdgeInsets.only(top: 8),
      constraints: const BoxConstraints(maxHeight: 340),
      child: Material(
        color: theme.colorScheme.surface,
        elevation: 3,
        shadowColor: theme.shadowColor,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: _panelBody(context, ref)),
            const Divider(height: 1),
            // La via d'uscita resta SEMPRE visibile, non solo a lista vuota:
            // Mapbox restituisce quasi sempre corrispondenze fuzzy anziché
            // nessun risultato, quindi il fallimento tipico non è la lista vuota
            // ma suggerimenti fuori tema, e l'utente deve poter tirare dritto.
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
              child: Row(
                children: [
                  Icon(
                    Icons.touch_app_outlined,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      context.localization.coverageSearchTip,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _panelBody(BuildContext context, WidgetRef ref) {
    // Le coordinate si riconoscono in locale: nessuna chiamata di rete, nessun
    // costo, risposta istantanea.
    final parsed = parseCoordinates(query);
    switch (parsed) {
      case ParsedCoordinates():
        return _CoordinateTile(
          coordinates: parsed,
          onSelected: onSelected,
        );
      case CoordinatesOutOfRange():
        return _PanelMessage(
          icon: Icons.error_outline_rounded,
          message: context.localization.coverageSearchErrorOutOfRange,
          isError: true,
        );
      case NotCoordinates():
        break;
    }

    if (query.length < 3) return _RecentList(onSelected: onSelected);

    final language = Localizations.localeOf(context).languageCode;
    final suggestions =
        ref.watch(searchPlacesProvider(query: query, language: language));

    return suggestions.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) {
        final isOffline = error is GeocodingUnavailableException;
        onError?.call(
          isOffline
              ? SearchPointError.geocodingUnavailable
              : SearchPointError.geocodingFailed,
        );
        return _PanelMessage(
          icon:
              isOffline ? Icons.wifi_off_rounded : Icons.error_outline_rounded,
          message: isOffline
              ? context.localization.coverageSearchErrorOffline
              : context.localization.coverageSearchErrorFailed,
          isError: true,
        );
      },
      data: (places) {
        if (places.isEmpty) {
          return _PanelMessage(
            icon: Icons.search_off_rounded,
            message: context.localization.coverageSearchNoResults,
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: places.length,
          itemBuilder: (context, index) => _SuggestionTile(
            suggestion: places[index],
            onSelected: onSelected,
          ),
        );
      },
    );
  }
}

class _SuggestionTile extends StatelessWidget {
  const _SuggestionTile({required this.suggestion, required this.onSelected});

  final PlaceSuggestion suggestion;
  final ValueChanged<SearchPoint> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(
        Icons.place_outlined,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      title: Text(suggestion.label, style: theme.textTheme.bodyLarge),
      subtitle: suggestion.context == null
          ? null
          : Text(
              suggestion.context!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
      onTap: () => onSelected(suggestion.toSearchPoint()),
    );
  }
}

class _CoordinateTile extends StatelessWidget {
  const _CoordinateTile({required this.coordinates, required this.onSelected});

  final ParsedCoordinates coordinates;
  final ValueChanged<SearchPoint> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading:
          Icon(Icons.my_location_rounded, color: theme.colorScheme.primary),
      title: Text(
        formatCoordinates(coordinates.latitude, coordinates.longitude),
        style: theme.textTheme.bodyLarge,
      ),
      onTap: () => onSelected(coordinates.toSearchPoint()),
    );
  }
}

class _RecentList extends ConsumerWidget {
  const _RecentList({required this.onSelected});

  final ValueChanged<SearchPoint> onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final recents = ref.watch(recentSearchesProvider).value ?? const [];
    if (recents.isEmpty) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Text(
            context.localization.coverageSearchRecentTitle,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: recents.length,
            itemBuilder: (context, index) {
              final recent = recents[index];
              return ListTile(
                dense: true,
                leading: Icon(
                  Icons.history_rounded,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                title: Text(recent.label, style: theme.textTheme.bodyMedium),
                onTap: () => onSelected(recent.toSearchPoint()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PanelMessage extends StatelessWidget {
  const _PanelMessage({
    required this.icon,
    required this.message,
    this.isError = false,
  });

  final IconData icon;
  final String message;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color =
        isError ? theme.colorScheme.error : theme.colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
