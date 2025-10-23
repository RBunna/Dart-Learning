import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Question {
  final String id = uuid.v1();
  final int POINT;
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question(
      {required this.title,
      required this.choices,
      required this.goodChoice,
      this.POINT = 1});
}

class Answer {
  final String id = uuid.v1();
  final String questionId;
  final String answerChoice;

  Answer({required this.questionId, required this.answerChoice});

  int getPoint(Question question) =>
      (this.answerChoice == question.goodChoice) ? question.POINT : 0;
}

class Quiz {
  final String id;
  String? playerName;
  final List<Question> questions;
  final List<Answer> submitAnswers;

  Quiz({required this.questions, this.playerName}) : id = uuid.v1(), submitAnswers = [];
  Quiz.id({required this.questions, this.playerName, required this.id, required this.submitAnswers});

  // void addAnswer(Answer answer) {
  //   this.answers.add(answer);
  // }

  int getScoreInPercentage(List<Answer> answers) => ((this
                  .getScoreInPoint(answers) /
              questions.fold(0, (total, question) => total + question.POINT)) *
          100)
      .toInt();

  int getScoreInPoint(List<Answer> answers) {
    Map<String, Question> questionsMap = {
      for (Question q in questions) q.id: q
    };
    return answers.fold(0, (total, answer) {
      final question = questionsMap[answer.questionId];
      if (question != null) {
        return total + answer.getPoint(question);
      } else {
        return total;
      }
    });
  }
}

final class VALIDATE {
  static bool USER_INPUT(String? userInput) {
    return userInput != null && userInput.isNotEmpty;
  }
}
