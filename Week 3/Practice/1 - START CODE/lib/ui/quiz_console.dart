import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---');

    while (true) {
      String? name;
      stdout.write("\nYour name: ");
      name = stdin.readLineSync();

      if (!VALIDATE.USER_INPUT(name!)) break;
      Player player = Player(name);

      for (var question in quiz.questions) {
        print('Question: ${question.title} - ( ${question.POINT} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (VALIDATE.USER_INPUT(userInput!)) {
          player.addAnswer(
              Answer(questionId: question.id, answerChoice: userInput));
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }
      quiz.addPlayer(player);

      print(
          '${name}, your score in percentage: ${player.getScoreInPercentage(quiz.questions)} %');
      print(
          '${name}, your score in points: ${player.getScoreInPoint(quiz.questions)}');
    }

    // ============= Code extracted from Stack overflow ===============
    // url: https://stackoverflow.com/a/21275519

    print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
    // print("xxx"); // just to show where the cursor is
    // http://en.wikipedia.org/wiki/ANSI_escape_code#CSI_codes

    // ================================================================

    print('--- Quiz Finished ---');
    for (Player player in quiz.players) {
      print(
          '→  ${player.name}, your score in percentage: ${player.getScoreInPercentage(quiz.questions)} %');
      print(
          '   ${player.name}, your score in points: ${player.getScoreInPoint(quiz.questions)}');
    }
  }
}
