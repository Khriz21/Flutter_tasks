import 'package:flutter/material.dart';


class DatePicker extends StatefulWidget {
  const DatePicker({super.key});
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  // ignore: prefer_typing_uninitialized_variables
  late DateTime? _currentSelectedDate = DateTime.now();
  // 1. Llamar nuestro Picker
  void callDatePicker() async {
    var selectDate = await getDatePickerWidget();
    setState(() {
      _currentSelectedDate = selectDate;
      print(_currentSelectedDate);
    });
  }

  // 2. Crear el widget
  @override
  Widget build(BuildContext context) {
    // Lanzar nuestro dialogo datePicker
    return Center(
      child: Column(
        children: [
          MaterialButton(
            onPressed: callDatePicker,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }

  Future<DateTime?> getDatePickerWidget() async {
    return showDatePicker(
      context: context,
      initialDate: _currentSelectedDate!,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('es'),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child ?? const Center(),
        );
      },
    );
  }
}
