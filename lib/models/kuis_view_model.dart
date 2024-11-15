import 'package:aksara_sunda/repository/kuis_repository.dart';
import 'package:aksara_sunda/utils/question.dart';
import 'package:flutter/material.dart';

class QuizViewModel extends ChangeNotifier {
  final QuizRepository _quizRepository;
  List<Question> _questions = [];
  bool _isLoading = true;

  QuizViewModel(this._quizRepository);

  List<Question> get questions => _questions;
  bool get isLoading => _isLoading;

  Future<void> fetchQuestions() async {
    _isLoading = true;
    notifyListeners();

    try {
      print("Fetching questions...");
      _questions = await _quizRepository.fetchQuestions();
      print(
          "Questions fetched: ${_questions.map((q) => q.questionText).toList()}");
    } catch (e) {
      print("Error fetching questions: $e");
      _questions = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
