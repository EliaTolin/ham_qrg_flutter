import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';
import 'package:hamqrg/common/widgets/form/base_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BaseField(
      isRequired: true,
      validator: (value) {
        if (value == null || value == '') {
          return 'Campo obbligatorio'.hardcoded;
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
