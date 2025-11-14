import 'package:flutter/material.dart';

class Quiz {
  void main() {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
          backgroundColor: Colors.grey[300],

          body: Column(
            // YOUR CODE
            children: [
              Row(
                children: [
                  Container(width: 50, height: 100, color: Colors.blue),
                  Container(width: 100, height: 100, color: Colors.yellow),
                  Expanded(child: Container(height: 100, color: Colors.blue)),
                  Container(width: 100, height: 100, color: Colors.yellow),
                  Container(width: 50, height: 100, color: Colors.blue),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              color: Colors.white,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              color: Colors.white,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(width: 10, color: Colors.grey),
                    Expanded(flex: 3, child: Container(color: Colors.orange)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
