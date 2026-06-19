import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/dialogs/show_year_picker.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';

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
    final l10n = context.localization;
    return Row(
      children: [
        const Icon(Icons.calendar_today),
        const Gap(10),
        Expanded(
          child: TextFormField(
            readOnly: true, // Make the field read-only
            initialValue: selectedDate?.year.toString(),
            decoration: InputDecoration(
              labelText: l10n.fieldYear + (isRequired ? ' *' : ''),
              hintText: l10n.fieldSelectDateHint,
            ),
            onTap: () {
              selectDate(context);
            },
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return l10n.validationInvalidYear;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final newDate =
        await showYearPicker(context: context, selectedDate: selectedDate);
    if (newDate != null) {
      onChanged(newDate);
    }
  }
}
