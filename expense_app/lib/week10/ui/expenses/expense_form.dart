import 'package:expense_app/week10/models/expense.dart';
import 'package:expense_app/week10/ui/expenses/date_picker.dart';
import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _amountEditingController =
      TextEditingController();

  void onCancel() {
    Navigator.pop(context);
  }

  void onCreate() {
    //  1 Build an expense
    String title = _titleEditingController.text;
    double amount = 0; // for now..
    Category category = Category.food; // for now..
    DateTime date = DateTime.now();

    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      category: category,
    );

    // YOUR CODE

    // 2 Close the modal
    Navigator.pop(context, newExpense);
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    _amountEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleEditingController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          TextField(
            enabled: false,
            controller: _amountEditingController,
            decoration: InputDecoration(label: Text("Price")),
            maxLength: 50,
          ),
          DatePicker(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
              SizedBox(width: 16),
              ElevatedButton(onPressed: onCreate, child: Text("Create")),
            ],
          ),
        ],
      ),
    );
  }
}
