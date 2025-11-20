import 'package:flutter/material.dart';

class Week7Theory {
  void main() {
    runApp(MaterialApp(home: MyApp()));
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: Colors.green, height: 200),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: Colors.blue, height: 500,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: Colors.red, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}