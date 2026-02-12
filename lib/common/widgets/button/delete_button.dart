import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({required this.onDelete, this.text, super.key});
  final String? text;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.shade50,
      ),
      onPressed: onDelete,
      label: Text(
        text ?? 'Elimina',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}
