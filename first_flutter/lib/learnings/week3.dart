import 'package:flutter/material.dart';

class Week3 {
  static MaterialApp challenge1() {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("HELLO")),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: const Center(
                  child: Text(
                    'HI',
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 52, 7, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static MaterialApp challenge2() {
    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: Colors.white,
    );
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(colors: [Color(0xFF4D3EF5), Color(0xFF0335B6)]),
    );
    return MaterialApp(
      home: Center(
        child: Column(
          spacing: 30,
          children: [
            Container(
              padding: EdgeInsets.all(40),
              decoration: boxDecoration,
              child: Text('Hello 1', style: textStyle),
            ),
            Container(
              padding: EdgeInsets.all(40),
              decoration: boxDecoration,
              child: Text('Hello 2', style: textStyle),
            ),
            GradientButton().build(),
          ],
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({super.key});

  @override
  Widget build([BuildContext? context]) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Color(0xFF4D3EF5), Color(0xFF0335B6)],
        ),
      ),
      child: const Text(
        'Hello 3',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
