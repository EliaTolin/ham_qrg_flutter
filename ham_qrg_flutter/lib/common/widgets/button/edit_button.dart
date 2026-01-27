import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';

class EditButton extends StatelessWidget {
  const EditButton({required this.onEdit, this.text, super.key});
  final String? text;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.edit, color: Colors.orange),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade50),
      onPressed: onEdit,
      label: Text(
        text ?? 'Modifica'.hardcoded,
        style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
      ),
    );
  }
}
