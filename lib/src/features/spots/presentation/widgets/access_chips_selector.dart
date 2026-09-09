import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';

/// Reusable access mode chip selector for spot creation sheets.
/// Shows a distinguishable label for each access (e.g. "Analog 88.5 Hz",
/// "DMR CC1 BM") to differentiate multiple accesses of the same mode.
class AccessChipsSelector extends StatelessWidget {
  const AccessChipsSelector({
    required this.accesses,
    required this.selectedAccessId,
    required this.onSelected,
    this.allowNone = false,
    this.noneLabel,
    super.key,
  });

  final List<RepeaterAccess> accesses;
  final String? selectedAccessId;
  final ValueChanged<RepeaterAccess?> onSelected;

  /// If true, shows a "none" chip that deselects the access.
  final bool allowNone;

  /// Label for the "none" chip (e.g. "Generico"). Required if [allowNone].
  final String? noneLabel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (allowNone)
          ChoiceChip(
            label: Text(noneLabel ?? ''),
            selected: selectedAccessId == null,
            onSelected: (_) => onSelected(null),
          ),
        ...accesses.map((access) {
          final color = AccessModeHelper.getAccessModeColorObject(access.mode);
          return ChoiceChip(
            label: Text(_accessLabel(access)),
            selected: selectedAccessId == access.id,
            onSelected: (_) => onSelected(access),
            avatar: CircleAvatar(
              backgroundColor: color,
              radius: 6,
            ),
          );
        }),
      ],
    );
  }

  /// Builds a distinguishable label for each access.
  /// E.g. "Analog 88.5 Hz", "DMR CC1 BM", "C4FM DG-ID 5", "P25 NAC 659".
  String _accessLabel(RepeaterAccess access) {
    final mode = AccessModeHelper.getAccessModeLabel(access.mode);
    final detail = _accessDetail(access);
    if (detail.isEmpty) return mode;
    return '$mode · $detail';
  }

  String _accessDetail(RepeaterAccess access) {
    final parts = <String>[];

    switch (access.mode) {
      case AccessMode.analog:
        if (access.ctcssTxHz != null) {
          parts.add('${access.ctcssTxHz!.toStringAsFixed(1)} Hz');
        } else if (access.dcsCode != null) {
          parts.add('DCS ${access.dcsCode}');
        }
      case AccessMode.dmr:
        if (access.colorCode != null) parts.add('CC${access.colorCode}');
        if (access.network != null) {
          parts.add(_shortNetworkName(access.network!.name));
        }
      case AccessMode.c4fm:
        if (access.dgId != null) parts.add('DG-ID ${access.dgId}');
      case AccessMode.dstar:
        if (access.nodeId != null) parts.add('${access.nodeId}');
      case AccessMode.p25 || AccessMode.irlp:
        // L'etichetta la conosce già `AccessModeHelper` (NAC per il P25, Node
        // per l'IRLP): riscriverla qui vorrebbe dire tenerne allineate due
        // copie, e la seconda si scopre sbagliata solo guardando la chip.
        final nodeLabel = AccessModeHelper.getNodeIdLabel(access.mode);
        if (access.nodeId != null && nodeLabel != null) {
          parts.add('$nodeLabel ${access.nodeId}');
        }
      case AccessMode.echolink:
      case AccessMode.svx:
      case AccessMode.aprs:
      case AccessMode.beacon:
      case AccessMode.atv:
      case AccessMode.nxdn:
      case AccessMode.allstar:
      case AccessMode.winlink:
        if (access.network != null) {
          parts.add(_shortNetworkName(access.network!.name));
        }
    }

    return parts.join(' ');
  }

  String _shortNetworkName(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('brandmeister')) return 'BM';
    if (lower.contains('tgif')) return 'TGIF';
    if (lower.contains('freedmr')) return 'FreeDMR';
    return name.length > 8 ? name.substring(0, 8) : name;
  }
}
