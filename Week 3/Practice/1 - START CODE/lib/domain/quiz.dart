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
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({required this.questionId, required this.answerChoice})
      : id = uuid.v1();
  Answer.load(this.id, this.questionId, this.answerChoice);

  int getPoint(Question question) =>
      (this.answerChoice == question.goodChoice) ? question.POINT : 0;
}

class Quiz {
  final String id;
  final List<Question> questions;
  List<Player> players;

  Quiz({required this.questions})
      : id = uuid.v1(),
        players = <Player>[];
  Quiz.load(this.id, this.questions, this.players);

  void addPlayer(Player player) {
    this.players.add(player);
  }
}

class Player {
  String id;
  String name;
  List<Answer> answers;

  Player(this.name)
      : id = uuid.v1(),
        answers = <Answer>[];
  Player.load(this.id, this.name, this.answers);

  void addAnswer(Answer answer) {
    this.answers.add(answer);
  }

  int getScoreInPercentage(List<Question> questions) => ((this
                  .getScoreInPoint(questions) /
              questions.fold(0, (total, question) => total + question.POINT)) *
          100)
      .toInt();

  int getScoreInPoint(List<Question> questions) {
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
