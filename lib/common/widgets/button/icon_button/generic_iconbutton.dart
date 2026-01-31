import 'package:flutter/material.dart';

class GenericIconButton extends StatelessWidget {
  const GenericIconButton({
    required this.onPressed,
    required this.icon,
    required this.color,
    this.size = 28.0, // Dimensione predefinita dell'icona
    this.tooltip,
    super.key,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final double size; // Aggiunto parametro per la dimensione dell'icona
  final String? tooltip; // Aggiunto parametro opzionale per tooltip

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            color: color,
            size: size,
          ),
        ),
      ),
    );
  }
}
