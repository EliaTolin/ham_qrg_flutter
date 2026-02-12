import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  const DateField({
    required this.controller,
    this.label = 'Data',
    this.isRequired = true,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final bool isRequired;

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_today),
        const Gap(10),
        Expanded(
          child: TextFormField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              labelText: label,
              suffixIcon: const Icon(Icons.date_range),
            ),
            onTap: () {
              _selectDate(context);
            },
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                // Modificata la validazione
                return 'Seleziona una data valida';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
