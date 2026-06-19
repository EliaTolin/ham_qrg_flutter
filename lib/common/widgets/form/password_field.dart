import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/form/base_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    required this.controller,
    required this.label,
    super.key,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return BaseField(
      controller: controller,
      isRequired: true,
      icon: Icons.password,
      obscureText: true,
      maxLines: 1,
      label: label,
      textInputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value == '') {
          return l10n.commonFieldRequired;
        }
        if (value != null && (value as String).length < 6) {
          return l10n.validationPasswordMinLength;
        }
        return null;
      },
    );
  }
}
