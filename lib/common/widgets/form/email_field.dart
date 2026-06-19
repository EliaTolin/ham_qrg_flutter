import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/form/base_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return BaseField(
      isRequired: true,
      validator: (value) {
        if (value == null || value == '') {
          return l10n.commonFieldRequired;
        }
        return null;
      },
      controller: controller,
      icon: Icons.email,
      textInputType: TextInputType.emailAddress,
      label: 'Email',
    );
  }
}
