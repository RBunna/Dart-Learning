import 'package:my_first_project/data/QuizRepository.dart';

import 'domain/quiz.dart';
import 'ui/quiz_console.dart';

void main() {
  const PATH = './lib/data/data.json';
  Quiz quiz = loadFile(PATH);

  QuizConsole console = QuizConsole(quiz: quiz);

  console.startQuiz();

  saveToFile(quiz: quiz, path: PATH);
}

Quiz loadStatic() {
  List<Question> questions = [
    Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris"),
    Question(title: "2 + 2 = ?", choices: ["2", "4", "5"], goodChoice: "4"),
  ];

  return Quiz(questions: questions);
}

Quiz loadFile(String path) {
  return QuizRepository(path).readQuiz();
}

void saveToFile({required Quiz quiz, required String path}) {
  QuizRepository(path).writeQuiz(quiz);
}
