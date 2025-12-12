import 'package:expense_app/my_version/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpenseViewState();
  }
}

List<String> filterList = <String>['Ascending', 'Descending'];

class _ExpenseViewState extends State<ExpenseView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (context, constraints) {
          PanelController addNewPanelController = PanelController();

          return SlidingUpPanel(
            panel: Text('Hello'),
            backdropEnabled: true,
            controller: addNewPanelController,
            maxHeight: constraints.maxHeight * 0.9,
            minHeight: 0,
            margin: EdgeInsets.only(left: 16, right: 16),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            body: Scaffold(
              backgroundColor: Colors.blue[100],
              appBar: AppBar(
                backgroundColor: Colors.blue[800],
                title: const Text(
                  'Ronan-The-Best Expenses App',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                actions: [
                  TextButton(
                    onPressed: () => {addNewPanelController.open()},
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 42, color: Colors.black),
                    ),
                  ),
                ],
              ),
              body: ExpenseList(),
            ),
          );
        },
      ),
    );
  }
}

class ExpenseList extends StatelessWidget {
  final List<Expense>? expenses;
  const ExpenseList({super.key, this.expenses});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(28),
      child: Column(
        spacing: 16,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: Container(),
              borderRadius: BorderRadius.circular(20),
              icon: const Icon(Icons.filter_alt),
              // dropdownColor: Colors.white,
              padding: EdgeInsets.only(left: 16, right: 16),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
              value: filterList.first,
              items: filterList
                  .map(
                    (String element) => DropdownMenuItem<String>(
                      value: element,
                      child: Text(element),
                    ),
                  )
                  .toList(),
              onChanged: (txt) => {},
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: expenses?.length,
              itemBuilder: (context, index) {
                // ================= Copy from internet ======================
                // url: https://docs.flutter.dev/cookbook/gestures/dismissible#2-wrap-each-item-in-a-dismissible-widget
                final item = expenses?[index];
                return Dismissible(
                  // Each Dismissible must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  key: Key(item as String),
                  // Provide a function that tells the app
                  // what to do after an item has been swiped away.
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    // setState(() {
                    //   expenses?.removeAt(index);
                    // });

                    // Then show a snackbar.
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('$item dismissed')));
                  },
                  child: ListTile(title: Text(item as String)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[50],
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          spacing: 8,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flutter Course',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text('\$15.99'),
                ],
              ),
            ),
            Icon(Icons.work),
            Text('12/12/2012'),
          ],
        ),
      ),
    );
  }
}
