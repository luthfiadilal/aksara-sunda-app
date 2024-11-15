import 'dart:convert';
import 'package:aksara_sunda/utils/question.dart';
import 'package:http/http.dart' as http;

class QuizRepository {
  final String apiUrl =
      'https://optimal-composed-ape.ngrok-free.app/api/quiz/random-questions';

  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("DATA RESPONSE: $data");
      final List<Question> questions = (data['data']['questions'] as List)
          .map((question) => Question.fromJson(question))
          .toList();
      return questions;
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
