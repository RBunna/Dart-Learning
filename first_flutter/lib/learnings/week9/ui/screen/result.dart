import 'package:first_flutter/learnings/week9/model/quiz_model.dart';
import 'package:first_flutter/learnings/week9/ui/components/quiz_component.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final QuizAttempt attempt;
  final void Function() onFinish, onHistory;
  const ResultScreen({super.key, required this.attempt, required this.onFinish, required this.onHistory});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        QuizTitle(
          'You answered ${attempt.getScore()}/${attempt.quiz.questions.length} correctly!',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < attempt.answers.length; i++)
                  ResultTile(index: i, answer: attempt.answers[i]),
              ],
            ),
          ),
        ),
        QuizButton('Finish', onPress: onFinish),
        QuizButton('History', onPress: onHistory),
        SizedBox(height: 16),
      ],
    );
  }
}

class ResultTile extends StatelessWidget {
  const ResultTile({super.key, required this.index, required this.answer});

  final int index;
  final Answer answer;

  Color get correctColor => answer.isGood() ? Colors.lightGreen : Colors.red;
  Icon get iconCheck => Icon(Icons.check);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: correctColor,
            borderRadius: BorderRadius.circular(360),
          ),
          child: Text('${index + 1}'),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(answer.question.title),
              for (String choice in answer.question.choices)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (choice == answer.question.goodChoice)
                      SizedBox(width: 36, child: Icon(Icons.check))
                    else
                      SizedBox(width: 36),
                    if (answer.answerChoice == choice)
                      Text(choice, style: TextStyle(color: correctColor))
                    else
                      Text(choice),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
