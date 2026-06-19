import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
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
    final l10n = context.localization;
    return BaseField(
      isRequired: isRequired,
      validator: (value) {
        if (isRequired && (value == null || value == '')) {
          return l10n.commonFieldRequired;
        }
        return null;
      },
      controller: controller,
      icon: Icons.location_city,
      label: l10n.fieldCity,
    );
  }
}
