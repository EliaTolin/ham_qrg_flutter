import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/sheet/sheet_drag_handle.dart';
import 'package:hamqrg/common/widgets/sheet/sheet_error_message.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/spots/errors/spot_error.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/access_chips_selector.dart';
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
    final selectedAccess = useState<RepeaterAccess>(
      accesses.first,
    );
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
            accessId: selectedAccess.value.id,
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

    return Padding(
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
          const SheetDragHandle(),
          const Gap(16),
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
          // Access chips
          Text(
            l10n.spotCreateAccess,
            style: theme.textTheme.titleSmall,
          ),
          const Gap(8),
          AccessChipsSelector(
            accesses: accesses,
            selectedAccessId: selectedAccess.value.id,
            onSelected: (access) => selectedAccess.value = access!,
          ),
          const Gap(16),
          // Error message
          if (errorMessage.value != null) ...[
            SheetErrorMessage(message: errorMessage.value!),
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
