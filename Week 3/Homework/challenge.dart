import 'dart:io';
import 'dart:math';

class Quiz {
  List<Question> questions;
  List<Answer> answers;

  Quiz(this.questions) : answers = <Answer>[];

  void addAnswer(Answer answer) => answers.add(answer);

  int get score =>
      (((answers.fold(
                    0,
                    (previousValue, answer) => previousValue +=
                        answer.isGoodAnswer(
                          questions.elementAt(answers.indexOf(answer)),
                        )
                        ? 1
                        : 0,
                  )) /
                  questions.length) *
              100)
          .round();
}

class Question {
  String title;
  List<String> choices;
  String goodChoice;

  Question({
    required this.title,
    required this.goodChoice,
    required this.choices,
  });
}

class Answer {
  String choice;

  Answer(this.choice);

  bool isGoodAnswer(Question question) {
    return question.goodChoice.toLowerCase() == choice.toLowerCase();
  }
}

void main(List<String> args) {
  Quiz q = Quiz(<Question>[
    Question(
      title: "Number of Cambodia provinces",
      goodChoice: "26",
      choices: ["24", "25"],
    ),
    Question(
      title: "Land area of Cambodia in km^2",
      goodChoice: "181,035",
      choices: ["203,109", "192,763"],
    ),
    Question(title: "Ronan is the ____", goodChoice: "best", choices: ["best"]),
  ]);

  for (Question question in q.questions) {
    bool isChoicePrinted = false;

    // ========== Question =========

    print(question.title);
    for (int i = 0; i <= question.choices.length; i++) {
      if ((Random().nextInt(8) > Random(i).nextInt(10) ||
              i == question.choices.length) &&
          !isChoicePrinted) {
        print("${i + 1}. ${question.goodChoice}");
        isChoicePrinted = true;
      } else
        print(
          "${i + 1}. ${question.choices[i != question.choices.length ? i : i - 1]}",
        );
    }

    // =========== Answer ==========

    stdout.write("Answer: ");
    q.addAnswer(Answer(stdin.readLineSync().toString()));
  }

  print("Your score: ${q.score}/100");
}
