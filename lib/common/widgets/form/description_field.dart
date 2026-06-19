import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
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
      icon: Icons.description,
      label: l10n.fieldDescription,
      maxLines: 3,
    );
  }
}
