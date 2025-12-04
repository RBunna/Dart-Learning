import 'package:uuid/uuid.dart';

const uuid = Uuid();

// --- Quiz Class ---
class Quiz {
  final String id;
  final List<Question> questions;

  Quiz({String? id, required this.questions}) : id = id ?? uuid.v4();

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] as String,
      questions: (json['questions'] as List)
          .map((i) => Question.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

// --- Question Class ---
class Question {
  final String id;
  final String title;
  final String goodChoice;
  final List<String> choices;

  Question({
    String? id,
    required this.title,
    required this.goodChoice,
    required this.choices,
  }) : id = id ?? uuid.v4();

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      title: json['title'] as String,
      goodChoice: json['goodChoice'] as String,
      choices: List<String>.from(json['choices'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'goodChoice': goodChoice,
      'choices': choices,
    };
  }
}

// --- Answer Class ---
// IMPORTANT: For JSON serialization, the 'question' object is NOT included.
// We only serialize the required 'questionId'.
class Answer {
  final String id;
  final String answerChoice;
  final Question question; // Object reference for in-app logic

  Answer({String? id, required this.answerChoice, required this.question})
    : id = id ?? uuid.v4();

  // Utility to get the Question ID needed for JSON serialization
  String get questionId => question.id;

  bool isGood() => answerChoice == question.goodChoice;

  // NOTE: This factory requires a separate Question object lookup for full reconstruction.
  // For serialization, we only store choice and ID.
  factory Answer.fromJson(Map<String, dynamic> json, Question question) {
    return Answer(
      id: json['id'] as String,
      answerChoice: json['answerChoice'] as String,
      question: question, // Must be passed in after being looked up
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'answerChoice': answerChoice,
      'questionId': questionId, // Storing ID instead of the object
    };
  }
}

// --- Player Class ---
class Player {
  final String id;
  final String name;

  Player({String? id, required this.name}) : id = id ?? uuid.v4();

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

// --- QuizAttempt Class ---
// IMPORTANT: For JSON serialization, we only store IDs for Player and Quiz.
class QuizAttempt {
  final String id;
  final Player player; // Object reference for in-app logic
  final Quiz quiz;     // Object reference for in-app logic
  final DateTime startTime;
  DateTime? endTime;
  final List<Answer> answers;

  QuizAttempt({
    String? id,
    required this.player,
    required this.quiz,
    List<Answer>? answers,
    required this.startTime,
    this.endTime,
  }) : id = id ?? uuid.v4(), answers = answers ?? [];

  String get playerId => player.id;
  String get quizId => quiz.id;

  int getScore() {
    int score = 0;
    for (final answer in answers) {
      if (answer.isGood()) score++;
    }

    return score;
  }

  void submit() => endTime = DateTime.now();

  void addAnswer(Answer answer) {
    if (endTime == null) {
      answers.add(answer);
    } else {
      print("cannot add answer: Quiz already submitted.");
    }
  }

  // NOTE: This factory requires separate Player, Quiz, and Question lookups.
  factory QuizAttempt.fromJson(Map<String, dynamic> json, Player player, Quiz quiz, Map<String, Question> questionMap) {
    return QuizAttempt(
      id: json['id'] as String,
      player: player, // Must be passed in after being looked up
      quiz: quiz,     // Must be passed in after being looked up
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime'] as String) : null,
      answers: (json['answers'] as List)
          .map((i) => Answer.fromJson(i as Map<String, dynamic>, questionMap[i['questionId']]!))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'playerId': playerId, // Storing ID
      'quizId': quizId,     // Storing ID
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }
}