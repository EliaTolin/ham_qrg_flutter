import 'package:flutter/material.dart';
import 'package:hamqrg/common/widgets/button/icon_button/generic_iconbutton.dart';

class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GenericIconButton(
      onPressed: onPressed,
      icon: Icons.delete,
      color: Colors.red,
    );
  }
}
