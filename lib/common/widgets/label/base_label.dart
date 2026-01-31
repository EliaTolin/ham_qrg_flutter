import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BaseLabel extends StatelessWidget {
  const BaseLabel({required this.text, required this.icon, super.key});
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const Gap(8),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
