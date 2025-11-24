import 'package:flutter/material.dart';

class Week8Ex1 {
  List<String> colors = ["red", "blue", "green"];

  List<Widget> widgetList(List<String> elements) => elements.map((element) => Text(element)).toList();

  void main() {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Label("Method 1: Loop in Array", bold: true),
                // TODO
                for (int i = 0; i < colors.length; i++)
                  Text(colors.elementAt(i)),

                Label("Method 2: Map", bold: true),
                // TODO
                ...colors.map((element) => Text(element)),

                Label("Method 23: Dedicated Function", bold: true),
                // TODO
                ...widgetList(colors)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
