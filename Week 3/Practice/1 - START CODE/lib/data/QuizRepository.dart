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
    var answersJson = data['answers'] as List;
    var answers = answersJson.map((a) {
      return Answer(
          questionId: a['questionId'], answerChoice: a['answerChoice']);
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
    if (answers == null)
    return Quiz(questions: questions);
    else
    return Quiz.id(questions: questions, id: quiz.id, playerName: quiz.playerName, submitAnswers: answers);
  }

  void writeQuiz(Quiz quiz, {List<Answer>? answers}) {
    try {
      final file = File(filePath);

      final data = {
        'quiz': {
          'playerName': quiz.playerName,
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
        'answers': (answers == null)
            ? quiz.submitAnswers.map((a) {
                return {
                  'questionId': a.questionId,
                  'answerChoice': a.answerChoice,
                };
              }).toList()
            : answers.map((answer) {
                return {
                  'questionId': answer.questionId,
                  'answerChoice': answer.answerChoice
                };
              }).toList(),
      };

      file.writeAsStringSync(jsonEncode(data));
    } catch (e) {
      throw Exception("Failed to write quiz data to file: $e");
    }
  }
}
