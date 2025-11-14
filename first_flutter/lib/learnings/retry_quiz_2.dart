import 'package:flutter/material.dart';

class RetryQuiz {
  void main() {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
          backgroundColor: Colors.grey[300],

          body: Column(
            // YOUR CODE
            children: [
              // =============== Top part ===============
              Container(
                height: 50,
                color: Colors.blue,
                child: Row(
                  children: [
                    Container(width: 50, color: Colors.blue),
                    Container(width: 100, color: Colors.yellow),
                    Expanded(child: Container(color: Colors.blue)),
                    Container(width: 100, color: Colors.yellow),
                    Container(width: 50, color: Colors.blue),
                  ],
                ),
              ),

              // =============== Bottom part  ===========
              Expanded(
                child: Row(
                  spacing: 10,
                  children: [
                    // =========== Left part ==============
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

                    // =========== Right part =============
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
