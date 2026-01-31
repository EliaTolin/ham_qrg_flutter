import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';
import 'package:hamqrg/common/widgets/form/base_field.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
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
          return 'Campo obbligatorio';
        }
        return null;
      },
      controller: controller,
      icon: Icons.description,
      label: 'Descrizione'.hardcoded,
      maxLines: 3,
    );
  }
}
