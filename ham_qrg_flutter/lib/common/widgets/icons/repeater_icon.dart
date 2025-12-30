import 'package:flutter/material.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';

class RepeaterIcon extends StatelessWidget {
  const RepeaterIcon({required this.mode, super.key});

  final RepeaterMode mode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: RepeaterModeHelper.getModeColorObject(mode).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.cell_tower, color: RepeaterModeHelper.getModeColorObject(mode), size: 24),
    );
  }
}
