import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  Future _selectDate(BuildContext context) async => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2050),
  ).then((DateTime? selected) {
    if (selected != null && selected != _selectedDate) {
      setState(() => _selectedDate = selected);
    }
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select Date'),
          ),
          const SizedBox(height: 20),
          Text(
            'Selected Date: ${_selectedDate != null ? _selectedDate.toString() : 'No date selected'}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}