import 'package:flutter/material.dart';

class DatePickerHelper {

  static Future<String?> showDateTimePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );

    if (date != null && context.mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null && context.mounted) {
        return "${date.day}/${date.month}/${date.year}, ${time.format(context)}";
      }
    }
    return null;
  }
}
