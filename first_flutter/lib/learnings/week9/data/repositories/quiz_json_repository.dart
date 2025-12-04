import 'dart:convert';
import 'dart:io';
import 'package:first_flutter/learnings/week9/data/repositories/quiz_mock_repository.dart';
import 'package:first_flutter/learnings/week9/model/quiz_model.dart';

// --- Placeholder Data Stores  ---
// In a real app, these would be a service or database layer.
final Map<String, Player> _playerStore = {mockPlayer.id: mockPlayer};
final Map<String, Quiz> _quizStore = {mockQuiz.id: mockQuiz};
// Map of all questions from all quizzes for easy lookup.
final Map<String, Question> _questionStore = Map.fromEntries(
  mockQuestions.map((element) => MapEntry(element.id, element)),
);

Player lookupPlayer(String id) => _playerStore[id]!;
Quiz lookupQuiz(String id) => _quizStore[id]!;
Map<String, Question> lookupAllQuestions() => _questionStore;

// --- File Path Utility ---
String _getFilePath(String filename) {
  // Replace with a proper path_provider implementation in Flutter
  return './learnings/week9/data/$filename.json';
}

// --- Write List of Attempts to JSON File ---
/// Writes a list of QuizAttempt objects to a JSON file.
Future<void> writeQuizAttemptHistoryToJson(
  List<QuizAttempt> attempts, {
  String filename = 'quiz_history',
}) async {
  final file = File(_getFilePath(filename));

  // Convert the list of objects into a list of JSON maps
  final List<Map<String, dynamic>> jsonList = attempts
      .map((a) => a.toJson())
      .toList();
  final jsonString = jsonEncode(jsonList);

  try {
    // Ensure the directory exists
    await file.parent.create(recursive: true);
    await file.writeAsString(jsonString);
    print(
      'Successfully saved ${attempts.length} QuizAttempt records to: ${file.path}',
    );
  } catch (e) {
    print('Error saving QuizAttempt history: $e');
  }
}

// --- Read List of Attempts from JSON File ---
/// Reads a list of QuizAttempt objects from a JSON file.
Future<List<QuizAttempt>> readQuizAttemptHistoryFromJson({
  String filename = 'quiz_history',
}) async {
  final file = File(_getFilePath(filename));

  if (!await file.exists()) {
    print('File not found: ${file.path}. Returning empty list.');
    return [];
  }

  try {
    final jsonString = await file.readAsString();
    final List<dynamic> jsonList = jsonDecode(jsonString);

    // Get the required lookups (assuming this data is static or pre-loaded)
    final Map<String, Question> questionMap = lookupAllQuestions();

    // Iterate through the JSON list and reconstruct each QuizAttempt
    return jsonList.map((jsonMap) {
      // 1. Look up required objects using the IDs stored in the JSON
      final String playerId = jsonMap['playerId'] as String;
      final String quizId = jsonMap['quizId'] as String;

      final Player player = lookupPlayer(playerId);
      final Quiz quiz = lookupQuiz(quizId);

      // 2. Reconstruct the object using the custom fromJson constructor
      return QuizAttempt.fromJson(
        jsonMap as Map<String, dynamic>,
        player,
        quiz,
        questionMap,
      );
    }).toList();
  } catch (e) {
    print('Error loading QuizAttempt history: $e');
    // Return an empty list on failure
    return [];
  }
}
