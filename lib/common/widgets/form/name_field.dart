import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';
import 'package:hamqrg/common/widgets/form/base_field.dart';

class NameField extends StatelessWidget {
  const NameField({
    required this.controller,
    required this.isRequired,
    super.key,
  });

  final TextEditingController controller;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return BaseField(
      isRequired: isRequired,
      validator: (value) {
        if (isRequired && (value == null || value == '')) {
          return 'Campo obbligatorio'.hardcoded;
        }
        return null;
      },
      controller: controller,
      icon: Icons.note,
      label: 'Nome'.hardcoded,
    );
  }
}
