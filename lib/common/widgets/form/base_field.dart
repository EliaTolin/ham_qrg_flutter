import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BaseField extends StatelessWidget {
  const BaseField({
    required this.validator,
    required this.controller,
    required this.icon,
    required this.label,
    required this.isRequired,
    this.textInputType,
    this.obscureText = false,
    this.maxLines,
    super.key,
  });
  final TextEditingController controller;
  final IconData icon;
  final String label;
  final TextInputType? textInputType;
  final FormFieldValidator validator;
  final bool isRequired;
  final bool obscureText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
        ),
        const Gap(10),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: isRequired ? '$label *' : label,
            ),
            keyboardType: textInputType,
            validator: validator,
            maxLines: maxLines,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
