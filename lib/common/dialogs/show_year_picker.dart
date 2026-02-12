import 'package:flutter/material.dart';

Future<DateTime?> showYearPicker({
  required BuildContext context,
  required DateTime? selectedDate,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Seleziona l'anno"),
        content: SizedBox(
          width: 300,
          height: 300,
          child: YearPicker(
            firstDate: DateTime(DateTime.now().year - 300),
            lastDate: DateTime(DateTime.now().year + 1),
            selectedDate: selectedDate ?? DateTime.now(),
            onChanged: (DateTime dateTime) {
              return Navigator.pop(context, dateTime);
            },
          ),
        ),
      );
    },
  );
}
