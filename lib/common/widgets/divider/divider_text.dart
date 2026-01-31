import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  const DividerText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(text),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
