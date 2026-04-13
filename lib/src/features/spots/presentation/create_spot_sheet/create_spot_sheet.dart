import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/spots/errors/spot_error.dart';
import 'package:hamqrg/src/features/spots/provider/create_spot/create_spot_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _durations = [5, 15, 30, 60];

Future<bool> showCreateSpotSheet(
  BuildContext context, {
  required String repeaterId,
  required List<RepeaterAccess> accesses,
}) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _CreateSpotSheet(
      repeaterId: repeaterId,
      accesses: accesses,
    ),
  );
  return result ?? false;
}

class _CreateSpotSheet extends HookConsumerWidget {
  const _CreateSpotSheet({
    required this.repeaterId,
    required this.accesses,
  });

  final String repeaterId;
  final List<RepeaterAccess> accesses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final selectedDuration = useState<int>(15);
    final selectedAccess = useState<RepeaterAccess?>(null);
    final isLoading = useState(false);
    final errorMessage = useState<String?>(null);

    Future<void> onConfirm() async {
      isLoading.value = true;
      errorMessage.value = null;
      try {
        await ref.read(
          createSpotProvider(
            repeaterId: repeaterId,
            durationMinutes: selectedDuration.value,
            accessId: selectedAccess.value?.id,
          ).future,
        );
        if (context.mounted) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.spotCreateSuccessSelf)),
          );
        }
      } on SpotError catch (e) {
        errorMessage.value = mapSpotError(e, l10n);
      } catch (_) {
        errorMessage.value = l10n.spotErrorGeneric;
      } finally {
        isLoading.value = false;
      }
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface.withValues(alpha: .2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Gap(16),
            // Title
            Text(
              l10n.spotCreateTitle,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(16),
            // Duration chips
            Text(
              l10n.spotCreateDuration,
              style: theme.textTheme.titleSmall,
            ),
            const Gap(8),
            Wrap(
              spacing: 8,
              children: _durations.map((minutes) {
                final isSelected = selectedDuration.value == minutes;
                return ChoiceChip(
                  label: Text(l10n.spotDurationMinutes(minutes)),
                  selected: isSelected,
                  onSelected: (_) => selectedDuration.value = minutes,
                );
              }).toList(),
            ),
            const Gap(16),
            // Access dropdown (optional)
            if (accesses.isNotEmpty) ...[
              Text(
                l10n.spotCreateAccess,
                style: theme.textTheme.titleSmall,
              ),
              const Gap(8),
              Wrap(
                spacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('Generico'),
                    selected: selectedAccess.value == null,
                    onSelected: (_) => selectedAccess.value = null,
                  ),
                  ...accesses.map((access) {
                    final isSelected = selectedAccess.value?.id == access.id;
                    final color =
                        AccessModeHelper.getAccessModeColorObject(access.mode);
                    return ChoiceChip(
                      label: Text(
                        AccessModeHelper.getAccessModeLabel(access.mode),
                      ),
                      selected: isSelected,
                      onSelected: (_) => selectedAccess.value = access,
                      avatar: CircleAvatar(
                        backgroundColor: color,
                        radius: 6,
                      ),
                    );
                  }),
                ],
              ),
              const Gap(16),
            ],
            // Error message
            if (errorMessage.value != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: theme.colorScheme.error,
                      size: 20,
                    ),
                    const Gap(8),
                    Expanded(
                      child: Text(
                        errorMessage.value!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(12),
            ],
            // Confirm button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: isLoading.value ? null : onConfirm,
                child: isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                        ),
                      )
                    : Text(l10n.spotCreateConfirm),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String mapSpotError(SpotError error, AppLocalizations l10n) {
  return switch (error) {
    SpotErrorAuthRequired() => l10n.spotErrorAuthRequired,
    SpotErrorCallsignRequired() => l10n.spotErrorCallsignRequired,
    SpotErrorInvalidDuration() => l10n.spotErrorInvalidDuration,
    SpotErrorRepeaterNotFound() => l10n.spotErrorRepeaterNotFound,
    SpotErrorInvalidAccess() => l10n.spotErrorInvalidAccess,
    SpotErrorSpotNotFound() => l10n.spotErrorSpotNotFound,
    SpotErrorForbidden() => l10n.spotErrorForbidden,
    SpotErrorAlreadyClosed() => l10n.spotErrorAlreadyClosed,
    SpotErrorUnknown() => l10n.spotErrorGeneric,
  };
}
