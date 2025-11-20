import 'dart:math';

import 'package:flutter/material.dart';

const List<String> diceImages = [
  'week6/dices/dice-1.png',
  'week6/dices/dice-2.png',
  'week6/dices/dice-3.png',
  'week6/dices/dice-4.png',
  'week6/dices/dice-5.png',
  'week6/dices/dice-6.png',
];

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = diceImages.first;
  final List<int> results = <int>[];

  void rollDice() async {
    //  Display the dice 4 !
    int result = 0;
    for (int i = 6; i <= 20; i++) {
      await Future.delayed(Duration(milliseconds: i * i));
      setState(() {
        result = Random().nextInt(diceImages.length);
        activeDiceImage = diceImages.elementAt(result);
      });
    }
    results.add(result + 1);
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: rollDice,
          child: Image.asset(activeDiceImage, width: 200),
        ),
        // Image.asset(activeDiceImage, width: 200),
        const SizedBox(height: 20),
        const Text(
          'Roll Dice',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        const SizedBox(height: 20),
        Text(results.toString())
      ],
    );
  }
}

class Dice {
  void main() => runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ),
  );
}
