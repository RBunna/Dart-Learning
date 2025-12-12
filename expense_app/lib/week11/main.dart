import 'package:flutter/material.dart';

import 'ui/expenses/expenses_screen.dart';

class Week11 {
  void main() {
    runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ExpensesScreen(),
      ),
    );
  }
}
