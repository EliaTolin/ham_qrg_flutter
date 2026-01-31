import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';
import 'package:hamqrg/common/widgets/form/base_field.dart';

class CityField extends StatelessWidget {
  const CityField({
    required this.controller,
    this.isRequired = false,
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
      icon: Icons.location_city,
      label: 'Città'.hardcoded,
    );
  }
}
