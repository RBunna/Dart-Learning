import 'dart:convert';
import 'dart:io';

import 'package:my_first_project/domain/quiz.dart';

class QuizRepository {
  final String filePath;
  QuizRepository(this.filePath);
  Quiz readQuiz() {
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);
    // Map JSON to domain objects
    var quiz = data['quiz'];

    var playersJson = data['players'] as List;
    var players = playersJson.map((player) {
      var answersJson = player['answers'] as List;
      var answers = answersJson.map((answer) {
        return Answer.load(
            answer['id'], answer['questionId'], answer['choice']);
      }).toList();

      return Player.load(player['id'], player['name'], answers);
    }).toList();

    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        POINT: q['POINT'],
      );
    }).toList();

    if (players.isEmpty)
      return Quiz(questions: questions);
    else
      return Quiz.load(quiz['id'], questions, players);
  }

  void writeQuiz(Quiz quiz) {
    try {
      final file = File(filePath);

      final data = {
        'quiz': {
          'id': quiz.id,
        },
        'questions': quiz.questions.map((q) {
          return {
            'title': q.title,
            'choices': q.choices,
            'goodChoice': q.goodChoice,
            'POINT': q.POINT,
          };
        }).toList(),
        'players': quiz.players.map((player) {
          return {
            'id': player.id,
            'name': player.name,
            'answers': player.answers.map((answer) {
              return {
                'id': answer.id,
                'questionId': answer.questionId,
                'choice': answer.answerChoice
              };
            }).toList()
          };
        }).toList(),
      };

      file.writeAsStringSync(jsonEncode(data));
    } catch (e) {
      throw Exception("Failed to write quiz data to file: $e");
    }
  }
}
