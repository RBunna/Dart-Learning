import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  Quiz quiz = Quiz(questions: <Question>[
    Question(
        title: "Number of Cambodia provinces",
        goodChoice: "26",
        choices: ["24", "25"],
        POINT: 10),
    Question(
        title: "Land area of Cambodia in km^2",
        goodChoice: "181,035",
        choices: ["203,109", "192,763"],
        POINT: 50),
    Question(
        title: "Ronan is the ____",
        goodChoice: "best",
        choices: ["best"],
        POINT: 100),
  ], playerName: 'Demo');
  setUp(() {});

  test('My first test', () {
    // Do something
    
    List<Answer> answers = <Answer>[];
    answers.add(Answer(questionId: quiz.questions[0].id, answerChoice: '26'));
    answers.add(
        Answer(questionId: quiz.questions[1].id, answerChoice: '181,035'));
    answers.add(Answer(questionId: quiz.questions[2].id, answerChoice: 'best'));

    // ✅ Expect: 100, Actual: 100
    expect(quiz.getScoreInPercentage(answers), equals(100));
    expect(quiz.getScoreInPoint(answers), equals(160));
  });

  test('Test 2', () {
    // Do something
    List<Answer> answers = <Answer>[];
    answers.add(Answer(questionId: quiz.questions[0].id, answerChoice: '25'));
    answers.add(
        Answer(questionId: quiz.questions[1].id, answerChoice: '181,035'));
    answers.add(Answer(questionId: quiz.questions[2].id, answerChoice: 'best'));

    // ❌ Expect: 100, Actual: 66
    expect(quiz.getScoreInPercentage(answers), equals(100));
    expect(quiz.getScoreInPoint(answers), equals(150));
  });
}
