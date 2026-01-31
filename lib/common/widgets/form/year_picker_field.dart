import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/dialogs/show_year_picker.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';

class YearPickerField extends StatelessWidget {
  const YearPickerField({
    required this.onChanged,
    required this.selectedDate,
    required this.isRequired,
    super.key,
  });
  final Function(DateTime) onChanged;
  final DateTime? selectedDate;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_today),
        const Gap(10),
        Expanded(
          child: TextFormField(
            readOnly: true, // Make the field read-only
            initialValue: selectedDate?.year.toString(),
            decoration: InputDecoration(
              labelText: 'Anno'.hardcoded + (isRequired ? ' *' : ''),
              hintText: 'Seleziona una data'.hardcoded,
            ),
            onTap: () {
              selectDate(context);
            },
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return 'Seleziona un anno valido'.hardcoded;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final newDate = await showYearPicker(context: context, selectedDate: selectedDate);
    if (newDate != null) {
      onChanged(newDate);
    }
  }
}
