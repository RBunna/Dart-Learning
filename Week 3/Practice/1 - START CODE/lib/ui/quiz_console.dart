import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  QuizConsole({required this.quiz});

  void startQuiz() {
    List<Answer> answers = <Answer>[];
    print('--- Welcome to the Quiz ---');

    String? name;
    do {
      stdout.write("\nYour name: ");
      name = stdin.readLineSync();
    } while (!VALIDATE.USER_INPUT(name));
    quiz.playerName = name;

    for (var question in quiz.questions) {
      print('Question: ${question.title} - ( ${question.POINT} points)');
      print('Choices: ${question.choices}');
      stdout.write('Your answer: ');
      String? userInput = stdin.readLineSync();

      // Check for null input
      if (VALIDATE.USER_INPUT(userInput!)) {
        answers.add(Answer(questionId: question.id, answerChoice: userInput));
      } else {
        print('No answer entered. Skipping question.');
      }

      print('');
    }

    // ============= Code extracted from Stack overflow ===============
    // url: https://stackoverflow.com/a/21275519

    print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
    // print("xxx"); // just to show where the cursor is
    // http://en.wikipedia.org/wiki/ANSI_escape_code#CSI_codes

    // ================================================================

    print('--- Quiz Finished ---');
    print(
        '${name}, your score in percentage: ${quiz.getScoreInPercentage(answers)} %');
    print('${name}, your score in points: ${quiz.getScoreInPoint(answers)}');
  }
}
