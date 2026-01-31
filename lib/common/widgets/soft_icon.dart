import 'package:flutter/material.dart';

class SoftIcon extends StatelessWidget {
  const SoftIcon({
    required this.icon,
    required this.bg,
    required this.fg,
    super.key,
    this.padding = const EdgeInsets.all(8),
    this.radius = 12,
    this.size = 28,
  });

  final IconData icon;
  final Color bg;
  final Color fg;
  final EdgeInsets padding;
  final double radius;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Icon(icon, color: fg, size: size),
    );
  }
}
