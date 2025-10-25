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
  ]);
  setUp(() {});

  test('My first test', () {
    // Do something
    
    Player player = Player('First player');
    player.addAnswer(Answer(questionId: quiz.questions[0].id, answerChoice: '26'));
    player.addAnswer(
        Answer(questionId: quiz.questions[1].id, answerChoice: '181,035'));
    player.addAnswer(Answer(questionId: quiz.questions[2].id, answerChoice: 'best'));

    // ✅ Expect: 100, Actual: 100
    expect(player.getScoreInPercentage(quiz.questions), equals(100));
    expect(player.getScoreInPoint(quiz.questions), equals(160));
  });

  test('Test 2', () {
    // Do something
    Player player = Player('Test 2');
    player.addAnswer(Answer(questionId: quiz.questions[0].id, answerChoice: '25'));
    player.addAnswer(
        Answer(questionId: quiz.questions[1].id, answerChoice: '181,035'));
    player.addAnswer(Answer(questionId: quiz.questions[2].id, answerChoice: 'best'));

    // ❌ Expect: 100, Actual: 93
    expect(player.getScoreInPercentage(quiz.questions), equals(100));
    expect(player.getScoreInPoint(quiz.questions), equals(150));
  });
}
