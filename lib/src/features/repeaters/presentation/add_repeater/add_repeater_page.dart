import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/common/widgets/snackbars/show_success_snackbar.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/presentation/add_repeater/controller/add_repeater_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/add_repeater/controller/state/add_repeater_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AddRepeaterPage extends HookConsumerWidget {
  const AddRepeaterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final state = ref.watch(addRepeaterControllerProvider);
    final controller = ref.read(addRepeaterControllerProvider.notifier);

    final nameCtrl = useTextEditingController();
    final callsignCtrl = useTextEditingController();
    final frequencyCtrl = useTextEditingController();
    final shiftCtrl = useTextEditingController();
    final regionCtrl = useTextEditingController();
    final provinceCtrl = useTextEditingController();
    final localityCtrl = useTextEditingController();
    final latCtrl = useTextEditingController();
    final lonCtrl = useTextEditingController();
    final locatorCtrl = useTextEditingController();
    final notesCtrl = useTextEditingController();

    final isValid = controller.isFormValid();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.router.maybePop(),
        ),
        title: Text(l10n.addRepeaterTitle),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline
            Text(
              l10n.addRepeaterHeadline,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const Gap(8),
            Text(
              l10n.addRepeaterDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: .8),
              ),
            ),
            const Gap(24),

            // --- Repeater data section ---
            _SectionHeader(
              icon: Icons.cell_tower,
              label: l10n.addRepeaterSectionRepeater,
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterName,
              hint: l10n.addRepeaterNameHint,
              controller: nameCtrl,
              onChanged: controller.setName,
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterCallsign,
              hint: l10n.addRepeaterCallsignHint,
              controller: callsignCtrl,
              onChanged: controller.setCallsign,
              textCapitalization: TextCapitalization.characters,
            ),
            if (!controller.hasNameOrCallsign &&
                (nameCtrl.text.isNotEmpty || callsignCtrl.text.isNotEmpty))
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  l10n.addRepeaterNameOrCallsignRequired,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.error,
                  ),
                ),
              ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterFrequency,
              hint: l10n.addRepeaterFrequencyHint,
              controller: frequencyCtrl,
              onChanged: controller.setFrequency,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
              ],
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterShift,
              hint: l10n.addRepeaterShiftHint,
              controller: shiftCtrl,
              onChanged: controller.setShift,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d.,-]')),
              ],
            ),
            const Gap(24),

            // --- Location section ---
            _SectionHeader(
              icon: Icons.location_on,
              label: l10n.addRepeaterSectionLocation,
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterRegion,
              hint: l10n.addRepeaterRegionHint,
              controller: regionCtrl,
              onChanged: controller.setRegion,
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterProvinceCode,
              hint: l10n.addRepeaterProvinceCodeHint,
              controller: provinceCtrl,
              onChanged: controller.setProvinceCode,
              textCapitalization: TextCapitalization.characters,
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterLocality,
              hint: l10n.addRepeaterLocalityHint,
              controller: localityCtrl,
              onChanged: controller.setLocality,
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterLatitude,
              hint: l10n.addRepeaterLatitudeHint,
              controller: latCtrl,
              onChanged: controller.setLatitude,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d.,-]')),
              ],
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterLongitude,
              hint: l10n.addRepeaterLongitudeHint,
              controller: lonCtrl,
              onChanged: controller.setLongitude,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d.,-]')),
              ],
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterLocator,
              hint: l10n.addRepeaterLocatorHint,
              controller: locatorCtrl,
              onChanged: controller.setLocator,
              textCapitalization: TextCapitalization.characters,
            ),
            const Gap(24),

            // --- Accesses section ---
            _SectionHeader(
              icon: Icons.tune,
              label: l10n.addRepeaterSectionAccesses,
            ),
            const Gap(12),
            if (state.accesses.isEmpty)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:
                      colorScheme.surfaceContainerHighest.withValues(alpha: .2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.onSurface.withValues(alpha: .1),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.cell_tower_outlined,
                      size: 32,
                      color: colorScheme.onSurface.withValues(alpha: .3),
                    ),
                    const Gap(8),
                    Text(
                      l10n.addRepeaterAtLeastOneAccess,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: .5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ...List.generate(state.accesses.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _AccessCard(
                  index: index,
                  access: state.accesses[index],
                  controller: controller,
                ),
              );
            }),
            const Gap(8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: controller.addAccess,
                icon: const Icon(Icons.add, size: 20),
                label: Text(l10n.addRepeaterAddAccess),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 20,
                  ),
                  side: BorderSide(
                    color: colorScheme.primary.withValues(alpha: .5),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const Gap(24),

            // --- Notes section ---
            _SectionHeader(
              icon: Icons.notes,
              label: l10n.addRepeaterSectionNotes,
            ),
            const Gap(12),
            _FormField(
              label: l10n.addRepeaterNotes,
              hint: l10n.addRepeaterNotesHint,
              controller: notesCtrl,
              onChanged: controller.setNotes,
              maxLines: 4,
            ),
            const Gap(24),

            // Info card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:
                    colorScheme.surfaceContainerHighest.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: .1),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: .1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.info_outline,
                      size: 16,
                      color: colorScheme.primary,
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.addRepeaterVerifiedTitle,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          l10n.addRepeaterVerifiedDescription,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: .7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(24),

            // Confirmation checkbox
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: state.isConfirmed,
                  onChanged: (value) =>
                      controller.setConfirmed(confirmed: value ?? false),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.setConfirmed(
                      confirmed: !state.isConfirmed,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        l10n.addRepeaterConfirmCheckbox,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: .7),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(24),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: isValid && !state.isSubmitting
                    ? () async {
                        try {
                          final success = await controller.submit();
                          if (success && context.mounted) {
                            showSuccessSnackbar(
                              context,
                              l10n.addRepeaterSuccess,
                            );
                            await context.router.maybePop();
                          }
                        } catch (e) {
                          if (context.mounted) {
                            showErrorSnackbar(
                              context,
                              l10n.addRepeaterError,
                            );
                          }
                        }
                      }
                    : null,
                icon: state.isSubmitting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.send),
                label: Text(l10n.addRepeaterSubmit),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const Gap(32),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, size: 18, color: colorScheme.primary),
        const Gap(8),
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
        ),
      ],
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.onChanged,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.inputFormatters,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: .3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withValues(alpha: .4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withValues(alpha: .4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
    );
  }
}

class _AccessCard extends HookWidget {
  const _AccessCard({
    required this.index,
    required this.access,
    required this.controller,
  });

  final int index;
  final SubmissionAccess access;
  final AddRepeaterController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: .1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(
                l10n.addRepeaterAccessNumber(index + 1),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () => controller.removeAccess(index),
                icon: Icon(
                  Icons.delete_outline,
                  size: 18,
                  color: colorScheme.error,
                ),
                label: Text(
                  l10n.addRepeaterRemoveAccess,
                  style: TextStyle(color: colorScheme.error),
                ),
              ),
            ],
          ),
          const Gap(12),

          // Mode selector
          DropdownButtonFormField<AccessMode>(
            initialValue: access.mode,
            decoration: InputDecoration(
              labelText: l10n.addRepeaterAccessMode,
              filled: true,
              fillColor: colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colorScheme.onSurface.withValues(alpha: .4),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colorScheme.onSurface.withValues(alpha: .4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.primary),
              ),
            ),
            items: AccessMode.values.map((mode) {
              return DropdownMenuItem(
                value: mode,
                child: Text(mode.name.toUpperCase()),
              );
            }).toList(),
            onChanged: (mode) {
              if (mode != null) controller.updateAccessMode(index, mode);
            },
          ),
          const Gap(12),

          // Mode-specific fields
          ..._buildModeFields(context, l10n),
        ],
      ),
    );
  }

  List<Widget> _buildModeFields(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    switch (access.mode) {
      case AccessMode.analog:
        return [
          Row(
            children: [
              Expanded(
                child: _AccessTextField(
                  label: l10n.addRepeaterAccessCtcssTx,
                  hint: l10n.addRepeaterAccessCtcssTxHint,
                  value: access.ctcssTxHz,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (v) => controller.updateAccessField(
                    index,
                    access.copyWith(ctcssTxHz: v),
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: _AccessTextField(
                  label: l10n.addRepeaterAccessCtcssRx,
                  hint: l10n.addRepeaterAccessCtcssRxHint,
                  value: access.ctcssRxHz,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (v) => controller.updateAccessField(
                    index,
                    access.copyWith(ctcssRxHz: v),
                  ),
                ),
              ),
            ],
          ),
        ];
      case AccessMode.dmr:
        return [
          Row(
            children: [
              Expanded(
                child: _AccessTextField(
                  label: l10n.addRepeaterAccessColorCode,
                  hint: l10n.addRepeaterAccessColorCodeHint,
                  value: access.colorCode,
                  keyboardType: TextInputType.number,
                  onChanged: (v) => controller.updateAccessField(
                    index,
                    access.copyWith(colorCode: v),
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: _AccessTextField(
                  label: l10n.addRepeaterAccessTalkgroup,
                  hint: l10n.addRepeaterAccessTalkgroupHint,
                  value: access.talkgroup,
                  keyboardType: TextInputType.number,
                  onChanged: (v) => controller.updateAccessField(
                    index,
                    access.copyWith(talkgroup: v),
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          _AccessTextField(
            label: l10n.addRepeaterAccessNetworkName,
            hint: l10n.addRepeaterAccessNetworkNameHint,
            value: access.networkName,
            onChanged: (v) => controller.updateAccessField(
              index,
              access.copyWith(networkName: v),
            ),
          ),
        ];
      case AccessMode.c4fm:
        return [
          _AccessTextField(
            label: l10n.addRepeaterAccessDgId,
            hint: l10n.addRepeaterAccessDgIdHint,
            value: access.dgId,
            keyboardType: TextInputType.number,
            onChanged: (v) => controller.updateAccessField(
              index,
              access.copyWith(dgId: v),
            ),
          ),
          const Gap(12),
          _AccessTextField(
            label: l10n.addRepeaterAccessNetworkName,
            hint: l10n.addRepeaterAccessNetworkNameHint,
            value: access.networkName,
            onChanged: (v) => controller.updateAccessField(
              index,
              access.copyWith(networkName: v),
            ),
          ),
        ];
      case AccessMode.dstar:
        return [
          _AccessTextField(
            label: l10n.addRepeaterAccessNetworkName,
            hint: l10n.addRepeaterAccessNetworkNameHint,
            value: access.networkName,
            onChanged: (v) => controller.updateAccessField(
              index,
              access.copyWith(networkName: v),
            ),
          ),
        ];
      case AccessMode.echolink ||
            AccessMode.svx ||
            AccessMode.allstar ||
            AccessMode.irlp:
        return [
          _AccessTextField(
            label: l10n.addRepeaterAccessNodeId,
            hint: l10n.addRepeaterAccessNodeIdHint,
            value: access.nodeId,
            keyboardType: TextInputType.number,
            onChanged: (v) => controller.updateAccessField(
              index,
              access.copyWith(nodeId: v),
            ),
          ),
          const Gap(12),
          _AccessTextField(
            label: l10n.addRepeaterAccessNetworkName,
            hint: l10n.addRepeaterAccessNetworkNameHint,
            value: access.networkName,
            onChanged: (v) => controller.updateAccessField(
              index,
              access.copyWith(networkName: v),
            ),
          ),
        ];
      case AccessMode.p25:
        // Il NAC occupa lo stesso campo `nodeId` degli altri identificativi di
        // nodo: cambia solo l'etichetta, non il dato inviato al backend.
        return [
          _AccessTextField(
            label: l10n.addRepeaterAccessNac,
            hint: l10n.addRepeaterAccessNacHint,
            value: access.nodeId,
            keyboardType: TextInputType.number,
            onChanged: (v) => controller.updateAccessField(
              index,
              access.copyWith(nodeId: v),
            ),
          ),
          const Gap(12),
          _AccessTextField(
            label: l10n.addRepeaterAccessNetworkName,
            hint: l10n.addRepeaterAccessNetworkNameHint,
            value: access.networkName,
            onChanged: (v) => controller.updateAccessField(
              index,
              access.copyWith(networkName: v),
            ),
          ),
        ];
      case AccessMode.aprs ||
            AccessMode.beacon ||
            AccessMode.atv ||
            AccessMode.nxdn ||
            AccessMode.winlink:
        return [];
    }
  }
}

class _AccessTextField extends HookWidget {
  const _AccessTextField({
    required this.label,
    required this.hint,
    required this.value,
    required this.onChanged,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final String value;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final ctrl = useTextEditingController(text: value);
    final colorScheme = Theme.of(context).colorScheme;

    return TextField(
      controller: ctrl,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withValues(alpha: .4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withValues(alpha: .4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
    );
  }
}
