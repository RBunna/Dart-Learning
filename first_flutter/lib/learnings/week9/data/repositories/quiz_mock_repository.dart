import 'package:first_flutter/learnings/week9/model/quiz_model.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

// --- SETUP BASE ENTITIES ---

// 1. Player
final mockPlayer = Player(
  id: 'p-405a-test',
  name: 'Mocky McMockface',
);

// 2. Questions
final mockQ1 = Question(
  id: 'q-a01b-flutter',
  title: 'What widget is used for drawing pixels?',
  goodChoice: 'CustomPaint',
  choices: ['Container', 'SizedBox', 'CustomPaint', 'RawImage'],
);

final mockQ2 = Question(
  id: 'q-b02c-dart',
  title: 'Which keyword in Dart is used for immutable variables?',
  goodChoice: 'final',
  choices: ['var', 'dynamic', 'const', 'final'],
);

final mockQ3 = Question(
  id: 'q-c03d-oop',
  title: 'What is the concept of bundling data and methods that work on that data?',
  goodChoice: 'Encapsulation',
  choices: ['Inheritance', 'Polymorphism', 'Encapsulation', 'Abstraction'],
);

final mockQ4 = Question(
  id: 'q-c04d-oop',
  title: 'Who is the best?',
  goodChoice: 'Ronan',
  choices: ['Ronan', 'Ronan', 'Ronan', 'Ronan'],
);

final List<Question> mockQuestions = [mockQ1, mockQ2, mockQ3, mockQ4];

// 3. Quiz
final mockQuiz = Quiz(
  id: 'qz-dev-quiz-101',
  questions: mockQuestions,
);

// --- CREATE THE ATTEMPT & ANSWERS ---

// 4. Answers (Player's Submissions)
// Q1: Correct
final mockAnswer1 = Answer(
  answerChoice: 'CustomPaint',
  question: mockQ1,
); 

// Q2: Incorrect
final mockAnswer2 = Answer(
  answerChoice: 'const',
  question: mockQ2,
); 

// Q3: Correct
final mockAnswer3 = Answer(
  answerChoice: 'Encapsulation',
  question: mockQ3,
);

// Q4: Correct
final mockAnswer4 = Answer(
  answerChoice: 'Ronan',
  question: mockQ4,
);

// 5. QuizAttempt
final mockAttempt = QuizAttempt(
  id: 'a-session-8888',
  player: mockPlayer,
  quiz: mockQuiz,
  startTime: DateTime.utc(2025, 12, 4, 12, 0, 0),
  endTime: DateTime.utc(2025, 12, 4, 12, 1, 30), // 90 seconds later
  answers: [mockAnswer1, mockAnswer2, mockAnswer3, mockAnswer4],
);

// Expected Score: 3 out of 4
// print(mockAttempt.getScore());