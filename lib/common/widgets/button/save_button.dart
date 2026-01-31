import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({required this.onSave, this.text, super.key});
  final VoidCallback onSave;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.save,
        color: Colors.green,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreen.shade50,
      ),
      onPressed: onSave,
      label: Text(
        text ?? 'Salva',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }
}
