import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Week7Ex4 {
  void main() => runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ScoreCard(title: 'My score in Flutter'),
                ScoreCard(title: 'My score in Dart'),
                ScoreCard(title: 'My score in React'),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class ScoreCard extends StatefulWidget {
  final String title;

  const ScoreCard({super.key, required this.title});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int progress = 0;

  Color? get progressColor =>
      Color.lerp(Colors.green[50], Colors.green[900], progress.toDouble() / 10);

  void updateProgress(int delta) => setState(() {
    progress += delta;
    progress = progress.clamp(0, 10);
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 38,
              children: [
                TextButton(
                  onPressed: () => {updateProgress(-1)},
                  child: const ProgressionUpdateButton('-'),
                ),
                TextButton(
                  onPressed: () => {updateProgress(1)},
                  child: const ProgressionUpdateButton('+'),
                ),
              ],
            ),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(16),
              color: progressColor,
              minHeight: 60,
              value: progress.toDouble() / 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressionUpdateButton extends StatelessWidget {
  final String label;

  const ProgressionUpdateButton(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(label, style: TextStyle(fontSize: 42));
  }
}
