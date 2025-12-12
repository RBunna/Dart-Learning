import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_form.dart';
import 'expense_item.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
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

    // TODO YOUR CODE HERE
    if (expense != null) {
      setState(() {
        _expenses.add(expense);
      });
    }
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExpensesStatistic(expenses: _expenses),
          if (_expenses.isEmpty)
            Center(child: Text('No expenses found. Start adding some!')),
          if (_expenses.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _expenses.length,
                itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(index),
                  child: ExpenseItem(expense: _expenses[index]),
                  onDismissed: (DismissDirection dd) {
                    Expense removedExpense = _expenses[index];
                    setState(() {
                      removedExpense = _expenses.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Expense deleted.'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () => setState(() {
                            _expenses.add(removedExpense);
                          }),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ExpensesStatistic extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesStatistic({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    Map<Category, double> totalAmounts = <Category, double>{};

    for (Expense expense in expenses) {
      totalAmounts.update(
        expense.category,
        (amount) => amount + expense.amount,
        ifAbsent: () => expense.amount,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...totalAmounts.entries.map(
              (entry) => CategoryCard(entry.key, entry.value),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final double amount;

  const CategoryCard(this.category, this.amount, {super.key});

  IconData get expenseIcon {
    switch (category) {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        spacing: 8,
        children: [
          Text(
            '${amount.toStringAsPrecision(2)} \$',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Icon(expenseIcon),
        ],
      ),
    );
  }
}
