import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/brandmeister/provider/get_bm_talkgroup_names/get_bm_talkgroup_names_provider.dart';
import 'package:hamqrg/src/features/brandmeister/provider/get_bm_talkgroups/get_bm_talkgroups_provider.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Highest DMR talkgroup id (24 bit, like DMR ids). Mirrors the CHECK
/// constraint on `repeater_spots.talkgroup` and the edge function.
const kMaxTalkgroup = 16777215;

/// Optional talkgroup picker for spot creation sheets.
///
/// Renders nothing unless [access] is a DMR access: a talkgroup on any other
/// mode is rejected by the edge function anyway, which re-reads the mode from
/// the database rather than trusting the client.
///
/// When the repeater is on BrandMeister and has a node id, its static
/// talkgroups become chips — three taps instead of a keyboard. Any other DMR
/// network (TGIF, local ones) falls back to the free numeric field, which is
/// always reachable through the "other" chip.
class TalkgroupSelector extends HookConsumerWidget {
  const TalkgroupSelector({
    required this.access,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final RepeaterAccess? access;
  final int? value;
  final ValueChanged<int?> onChanged;

  /// Whether a talkgroup can be declared on [access]. Callers use it to lay
  /// out their own spacing; the widget guards on it again anyway.
  static bool supports(RepeaterAccess? access) =>
      access?.mode == AccessMode.dmr;

  bool get _isBrandmeister =>
      access?.network?.name.toLowerCase().contains('brandmeister') ?? false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Hooks first, unconditionally: the guard below must never change how
    // many hooks this build calls, or a rebuild with a different access
    // would trip the hooks assertion.
    final customController = useTextEditingController();
    final showCustomField = useState(false);
    final customError = useState<String?>(null);

    final selectedAccess = access;
    if (selectedAccess == null || !supports(selectedAccess)) {
      return const SizedBox.shrink();
    }

    final l10n = context.localization;
    final theme = Theme.of(context);

    final nodeId = selectedAccess.nodeId;
    final hasBmSource = nodeId != null && _isBrandmeister;

    final asyncTalkgroups =
        hasBmSource ? ref.watch(getBmTalkgroupsProvider(nodeId)) : null;
    final asyncNames =
        hasBmSource ? ref.watch(getBmTalkgroupNamesProvider) : null;

    // Static talkgroups of the device, de-duplicated (the same TG can be
    // linked on both timeslots) and ordered.
    final staticIds = (asyncTalkgroups?.value ?? const [])
        .map((tg) => tg.talkgroupId)
        .toSet();
    final orderedIds = staticIds.toList()..sort();
    final names = asyncNames?.value ?? const <String, String>{};

    final isLoading = asyncTalkgroups?.isLoading ?? false;

    void selectChip(int talkgroupId) {
      showCustomField.value = false;
      customController.clear();
      customError.value = null;
      // Tapping the selected chip again clears the declaration.
      onChanged(value == talkgroupId ? null : talkgroupId);
    }

    void onCustomChanged(String raw) {
      final trimmed = raw.trim();
      final parsed = int.tryParse(trimmed);
      final isValid = parsed != null && parsed >= 1 && parsed <= kMaxTalkgroup;
      customError.value =
          trimmed.isEmpty || isValid ? null : l10n.spotCreateTalkgroupInvalid;
      onChanged(isValid ? parsed : null);
    }

    final isCustomSelected =
        showCustomField.value || (value != null && !staticIds.contains(value));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.spotCreateTalkgroup,
          style: theme.textTheme.titleSmall,
        ),
        const Gap(8),
        if (isLoading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator.adaptive(strokeWidth: 2),
            ),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...orderedIds.map((id) {
                final name = names[id.toString()];
                return ChoiceChip(
                  label: Text(
                    name == null
                        ? l10n.spotTalkgroupShort(id)
                        : l10n.spotTalkgroupChipNamed(id, name),
                  ),
                  selected: value == id && !showCustomField.value,
                  onSelected: (_) => selectChip(id),
                );
              }),
              ChoiceChip(
                label: Text(l10n.spotCreateTalkgroupOther),
                selected: isCustomSelected,
                onSelected: (_) {
                  final opening = !showCustomField.value;
                  showCustomField.value = opening;
                  customError.value = null;
                  // Closing the field, or opening it while a chip was
                  // selected, both leave the declaration empty.
                  if (!opening || staticIds.contains(value)) {
                    customController.clear();
                    onChanged(null);
                  }
                },
              ),
            ],
          ),
        if (isCustomSelected) ...[
          const Gap(8),
          TextField(
            controller: customController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: onCustomChanged,
            decoration: InputDecoration(
              hintText: l10n.spotCreateTalkgroupHint,
              border: const OutlineInputBorder(),
              isDense: true,
              errorText: customError.value,
            ),
          ),
        ],
      ],
    );
  }
}
