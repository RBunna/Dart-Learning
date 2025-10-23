import 'package:my_first_project/data/QuizRepository.dart';

import 'domain/quiz.dart';
import 'ui/quiz_console.dart';

void main() {
  List<Question> questions = [
    Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris"),
    Question(title: "2 + 2 = ?", choices: ["2", "4", "5"], goodChoice: "4"),
  ];

  Quiz quiz = Quiz(questions: questions, playerName: 'Tester');
  QuizConsole console = QuizConsole(quiz: quiz);
  List<Answer> mockAnswers = [
    Answer(questionId: questions[0].id, answerChoice: 'Paris'),
    Answer(questionId: questions[1].id, answerChoice: '4'),
  ];

  QuizRepository('./lib/data/data.json').writeQuiz(quiz, answers: mockAnswers);

  console.startQuiz();
}
