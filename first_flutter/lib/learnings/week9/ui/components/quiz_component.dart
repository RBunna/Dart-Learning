import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  final String label;
  final void Function() onPress;

  const QuizButton(this.label, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 12,
      ),
      child: Text(label, style: TextStyle(fontSize: 24)),
    );
  }
}

class QuizTitle extends StatelessWidget {
  final String title;
  const QuizTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 38)),
    );
  }
}
