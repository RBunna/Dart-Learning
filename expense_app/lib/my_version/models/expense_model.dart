import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final ExpenseType type;
  final DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    String? id,
  }) : id = id ?? uuid.v4();
}

enum ExpenseType { food, travel, leisure, work }
