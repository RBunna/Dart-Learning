import 'package:first_flutter/learnings/week9/model/quiz_model.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final Player player;
  final Quiz quiz;
  const QuestionScreen({super.key, required this.player, required this.quiz});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late QuizAttempt attempt;

  @override
  void initState() {
    super.initState();
    attempt = QuizAttempt(
      player: widget.player,
      quiz: widget.quiz,
      startTime: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Question> questions = widget.quiz.questions;
    return ListView(
      children: [for (int i = 0; i < questions.length;) NewWidget(i: i)],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    print(i.toString());
    return Text('data $i');
  }
}
