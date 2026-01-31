import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/repeater_detail_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/state/repeater_detail_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/community/equipment_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedbackFormCard extends ConsumerWidget {
  const FeedbackFormCard({
    required this.state,
    required this.availableAccesses,
    required this.locationController,
    required this.commentController,
    required this.controller,
    super.key,
  });

  final RepeaterDetailState state;
  final List<RepeaterAccess> availableAccesses;
  final TextEditingController locationController;
  final TextEditingController commentController;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isFormValid = controller.isFormValid();
    final isWithinDistance = controller.isWithinAllowedDistance();
    log('isWithinDistance: $isWithinDistance');
    final canSubmit = isFormValid && isWithinDistance && !state.isSubmittingFeedback;

    return Container(
      padding: const EdgeInsets.all(16),
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
          // Header section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.repeaterDetailInteractive.toUpperCase(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.repeaterDetailLogYourSignal.toUpperCase(),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.tune,
                  color: colorScheme.primary,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Equipment selection label
          Text(
            l10n.repeaterDetailUsedEquipment.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 8),
          // Equipment selection buttons
          Row(
            children: [
              Expanded(
                child: EquipmentButton(
                  icon: Icons.smartphone,
                  label: l10n.repeaterDetailStationPortable,
                  isSelected: state.selectedStation == StationKind.portable,
                  onTap: () => controller.setSelectedStation(StationKind.portable),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: EquipmentButton(
                  icon: Icons.directions_car,
                  label: l10n.repeaterDetailStationMobile,
                  isSelected: state.selectedStation == StationKind.mobile,
                  onTap: () => controller.setSelectedStation(StationKind.mobile),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: EquipmentButton(
                  icon: Icons.home,
                  label: l10n.repeaterDetailStationFixed,
                  isSelected: state.selectedStation == StationKind.fixed,
                  onTap: () => controller.setSelectedStation(StationKind.fixed),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Location field with autocomplete
          _buildLocationField(context, theme, colorScheme, l10n),
          const SizedBox(height: 16),
          // Access selection (single select)
          _buildAccessSelection(context, theme, colorScheme, l10n),
          const SizedBox(height: 16),
          // Comment field
          _buildCommentField(context, theme, colorScheme, l10n),
          // Distance warning if too far
          if (isFormValid && !isWithinDistance) ...[
            const SizedBox(height: 12),
            _buildDistanceWarning(context, theme, l10n),
          ],
          const SizedBox(height: 16),
          // Action buttons
          _buildActionButtons(context, ref, theme, l10n, canSubmit),
        ],
      ),
    );
  }

  Widget _buildLocationField(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final hasText = state.locationText != null && state.locationText!.isNotEmpty;
    final isValidated = state.isFeedbackLocationValidated;
    final showError = hasText && !isValidated;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.repeaterDetailYourLocation.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: locationController,
          onChanged: (value) {
            controller
              ..setLocationText(value)
              ..searchLocationSuggestions(value);
          },
          decoration: InputDecoration(
            hintText: l10n.repeaterDetailLocationPlaceholder,
            prefixIcon: const Icon(Icons.location_on, size: 20),
            suffixIcon: isValidated
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  )
                : null,
            filled: true,
            fillColor: colorScheme.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: showError
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.orange.withValues(alpha: 0.6),
                    ),
                  )
                : null,
            focusedBorder: showError
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.orange),
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
        if (showError && state.locationSuggestions.isEmpty) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 14,
                  color: Colors.orange.shade700,
                ),
                const SizedBox(width: 4),
                Text(
                  l10n.repeaterDetailLocationSelectHint,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.orange.shade700,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
        // Location suggestions
        if (state.locationSuggestions.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: state.locationSuggestions.map((suggestion) {
                return InkWell(
                  onTap: () {
                    controller.selectLocationSuggestion(suggestion);
                    locationController.text = suggestion.placeName;
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.place,
                          size: 18,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            suggestion.placeName,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildAccessSelection(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.repeaterDetailSelectAccessInstance.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 8),
        ...availableAccesses.map((access) {
          final isSelected = state.selectedAccessId == access.id;
          final accessColor = AccessModeHelper.getAccessModeColorObject(access.mode);
          final accessIcon = AccessModeHelper.getAccessModeIcon(access.mode);

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              onTap: () => controller.setSelectedAccessId(access.id),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? accessColor.withValues(alpha: 0.05)
                      : colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? accessColor : colorScheme.outline.withValues(alpha: 0.2),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? accessColor.withValues(alpha: 0.2)
                            : colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        accessIcon,
                        color: isSelected ? accessColor : colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getAccessTitle(access),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _getAccessSubtitle(access),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? accessColor : Colors.transparent,
                        border: Border.all(
                          color:
                              isSelected ? accessColor : colorScheme.outline.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildCommentField(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${l10n.repeaterDetailSignalObservations} *'.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: commentController,
          onChanged: controller.setComment,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: l10n.repeaterDetailSignalObservationsPlaceholder,
            filled: true,
            fillColor: colorScheme.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }

  Widget _buildDistanceWarning(
    BuildContext context,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.amber.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.amber,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              l10n.repeaterDetailDistanceWarning(
                AppConfigs.maxFeedbackDistanceKm.toInt(),
              ),
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.amber.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSubmit(
    BuildContext context,
    WidgetRef ref,
    FeedbackType type,
  ) async {
    final isAuthenticated = await requireAuthentication(context, ref);
    if (!isAuthenticated) return;

    final distance = controller.getDistanceToRepeater();
    if (distance != null && distance > AppConfigs.feedbackDistanceWarningKm && context.mounted) {
      final confirmed = await _showDistanceConfirmDialog(context, distance);
      if (!confirmed) return;
    }

    await controller.submitFeedback(type: type);
    
  }

  Future<bool> _showDistanceConfirmDialog(
    BuildContext context,
    double distanceKm,
  ) async {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        icon: Icon(
          Icons.share_location,
          color: Colors.orange.shade700,
          size: 32,
        ),
        title: Text(
          l10n.feedbackDistanceConfirmTitle,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          l10n.feedbackDistanceConfirmMessage(
            distanceKm.toStringAsFixed(0),
          ),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.feedbackDistanceConfirmCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.orange.shade700,
            ),
            child: Text(l10n.feedbackDistanceConfirmButton),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    ThemeData theme,
    AppLocalizations l10n,
    bool canSubmit,
  ) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: canSubmit ? () => _handleSubmit(context, ref, FeedbackType.like) : null,
            style: FilledButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.green.withValues(alpha: 0.12),
              disabledForegroundColor: Colors.green.withValues(alpha: 0.5),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              textStyle: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.isSubmittingFeedback)
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                else
                  const Icon(Icons.thumb_up, size: 18),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    l10n.repeaterDetailSendLike.toUpperCase(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton(
            onPressed: canSubmit ? () => _handleSubmit(context, ref, FeedbackType.down) : null,
            style: FilledButton.styleFrom(
              backgroundColor: Colors.amber.shade700,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.amber.shade700.withValues(alpha: 0.12),
              disabledForegroundColor: Colors.amber.shade700.withValues(alpha: 0.5),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              textStyle: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.isSubmittingFeedback)
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                else
                  const Icon(Icons.warning_amber_rounded, size: 18),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    l10n.repeaterDetailReportIssue.toUpperCase(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getAccessTitle(RepeaterAccess access) {
    final label = AccessModeHelper.getAccessModeLabel(access.mode);
    if (access.network != null) {
      return '$label (${access.network!.name})';
    }
    if (access.ctcssTxHz != null) {
      return '$label (${access.ctcssTxHz!.toStringAsFixed(1)}Hz)';
    }
    return label;
  }

  String _getAccessSubtitle(RepeaterAccess access) {
    final parts = <String>[];

    if (access.colorCode != null) {
      parts.add('CC: ${access.colorCode}');
    }
    if (access.dmrId != null) {
      parts.add('ID: ${access.dmrId}');
    }
    if (access.ctcssRxHz != null && access.ctcssTxHz != access.ctcssRxHz) {
      parts.add('Rx: ${access.ctcssRxHz!.toStringAsFixed(1)}Hz');
    }
    if (access.dcsCode != null) {
      parts.add('DCS: ${access.dcsCode}');
    }
    if (access.dgId != null) {
      parts.add('DG-ID: ${access.dgId}');
    }

    if (parts.isEmpty) {
      return AccessModeHelper.getAccessModeLabel(access.mode).toUpperCase();
    }
    return parts.join(' • ');
  }
}
