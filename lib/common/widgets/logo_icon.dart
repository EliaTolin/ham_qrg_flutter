import 'package:flutter/material.dart';
import 'package:hamqrg/resources/resources.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({super.key, this.size = 64});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(
          image: const AssetImage(ImageAssets.icon),
          width: size,
          height: size,
        ),
      ),
    );
  }
}
