import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category category = Category.food;
  DateTime? selectedDate;

  // @override
  // void initState() {
  //   super.initState();

  //   _amountController.addListener(() {
  //     final String text = _amountController.text.contains('\$')
  //         ? _amountController.text
  //         : '\$${_amountController.text}';
  //     _amountController.value = _amountController.value.copyWith(
  //       text: text,
  //       selection: TextSelection(
  //         baseOffset: text.length,
  //         extentOffset: text.length,
  //       ),
  //       composing: TextRange.empty,
  //     );
  //   });
  // }

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _amountController.dispose();
  }

  void onCreate() {
    //  1 Build an expense
    String title = _titleController.text;
    double? amount = double.tryParse(_amountController.text); // for now..
    DateTime? date = selectedDate;

    List<String> invalidInputMessages = validateExpenseInput(
      title,
      amount,
      date,
    );

    if (invalidInputMessages.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Invalid input'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...invalidInputMessages.map((message) => Text(message)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      final double finalAmount = amount ?? 0;
      final DateTime finalDate = date ?? DateTime.now();

      Expense newExpense = Expense(
        title: title,
        amount: finalAmount,
        date: finalDate,
        category: category,
      );

      // TODO YOUR CODE HERE
      Navigator.pop(context, newExpense);
    }
  }

  List<String> validateExpenseInput(
    String title,
    double? amount,
    DateTime? date,
  ) {
    List<String> invalidInputMessages = [];

    if (title.isEmpty) invalidInputMessages.add('Title cannot be empty.');
    if (amount == null) {
      invalidInputMessages.add('Input amount is invalid.');
    } else if (amount < 0) {
      invalidInputMessages.add('Amount must be positive.');
    }
    if (date == null) invalidInputMessages.add('Date must be chosen.');
    return invalidInputMessages;
  }

  void onCancel() {
    // Close the modal
    Navigator.pop(context);
  }

  void onCategoryChange(Category? newCategory) {
    if (newCategory != null) {
      setState(() {
        category = newCategory;
      });
    }
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          Row(
            children: [
              // Input Formatter searched from the internet
              // url: https://medium.com/@iseryu33333/how-to-enable-decimal-input-in-flutter-textfield-alongside-numbers-only-bb168bc4e81b
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(label: Text("Amount")),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    // This website has a very good explanation of regular expression: https://regex101.com/
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?')),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    selectedDate == null
                        ? "No date selected"
                        : DateFormat.yMd().format(selectedDate!),
                  ),
                  IconButton(
                    onPressed: _selectDate,
                    icon: Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          Row(
            spacing: 16,
            children: [
              DropdownButton<Category>(
                value: category,
                onChanged: onCategoryChange,
                items: Category.values.map((Category category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  );
                }).toList(),
              ),
              Spacer(),
              TextButton(onPressed: onCancel, child: Text("Cancel")),
              ElevatedButton(
                onPressed: onCreate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[50],
                ),
                child: Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
