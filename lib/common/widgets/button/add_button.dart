import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    required this.onAdd,
    this.text,
    super.key,
    this.enabled = true,
  });
  final String? text;
  final VoidCallback onAdd;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.add,
        color: Colors.green,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade50,
      ),
      onPressed: enabled ? onAdd : null,
      label: Text(
        text ?? 'Aggiungi',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }
}
