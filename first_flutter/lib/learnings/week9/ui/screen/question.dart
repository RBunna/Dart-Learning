import 'package:first_flutter/learnings/week9/data/repositories/quiz_json_repository.dart';
import 'package:first_flutter/learnings/week9/model/quiz_model.dart';
import 'package:first_flutter/learnings/week9/ui/components/quiz_component.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final Player player;
  final Quiz quiz;
  final void Function(QuizAttempt attempt) endQuestion;
  const QuestionScreen({
    super.key,
    required this.player,
    required this.quiz,
    required this.endQuestion,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late QuizAttempt attempt;
  int index = 0;

  void selectAnswer(Answer answer) async {
    attempt.addAnswer(answer);
    setState(() => index++);

    if (index >= widget.quiz.questions.length) {
      attempt.submit();
      await writeQuizAttemptHistoryToJson([attempt]);
      widget.endQuestion(attempt);
    }
  }

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
    return Column(
      children: [
        QuizTitle(questions[index].title),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (String choice in questions[index].choices)
                  QuizButton(
                    choice,
                    onPress: () => selectAnswer(
                      Answer(answerChoice: choice, question: questions[index]),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
