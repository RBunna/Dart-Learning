import 'package:first_flutter/learnings/week9/data/repositories/quiz_mock_repository.dart';
import 'package:first_flutter/learnings/week9/model/quiz_model.dart';
import 'package:first_flutter/learnings/week9/ui/screen/question.dart';
import 'package:first_flutter/learnings/week9/ui/screen/start.dart';
import 'package:flutter/material.dart';

enum Screen { start, question, result, history }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Screen displayScreen = Screen.start;
  late Player player;
  final Quiz quiz = mockQuiz;

  Widget get display => switch (displayScreen) {
    Screen.start => StartScreen(onStartPress: onStart),
    Screen.question => QuestionScreen(player: player, quiz: quiz),
    Screen.result => throw UnimplementedError(),
    Screen.history => throw UnimplementedError(),
  };

  void onStart(String name) {
    player = Player(name: name);
    setState(() => displayScreen = Screen.question);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: display),
        ),
      ),
    );
  }
}
