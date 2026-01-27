import 'package:flutter/material.dart';
import 'package:hamqrg/common/widgets/button/icon_button/generic_iconbutton.dart';

class AddIconButton extends StatelessWidget {
  const AddIconButton({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GenericIconButton(
      onPressed: onPressed,
      icon: Icons.add,
      color: Colors.green,
    );
  }
}
