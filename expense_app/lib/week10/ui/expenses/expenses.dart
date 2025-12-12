import 'package:expense_app/week10/ui/expenses/expense_form.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() {
    return _ExpensesViewState();
  }
}

class _ExpensesViewState extends State<ExpensesView> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void onAddClicked() async {
    Expense? expense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm()),
    );

    setState(() {
      _expenses.add(expense!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [IconButton(onPressed: onAddClicked, icon: Icon(Icons.add))],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: ListView.builder(
        itemCount: _expenses.length,
        itemBuilder: (context, index) => ExpenseItem(expense: _expenses[index]),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  IconData get expenseIcon {
    switch (expense.category) {
      case Category.food:
        return Icons.free_breakfast;
      case Category.travel:
        return Icons.travel_explore;
      case Category.leisure:
        return Icons.holiday_village;
      case Category.work:
        return Icons.work;
    }
  }

  String get expenseDate {
    return "11/54/25";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${expense.amount.toStringAsPrecision(2)} \$"),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(expenseIcon),
                  ),
                  Text(expenseDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
