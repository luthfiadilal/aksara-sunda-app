import 'package:aksara_sunda/components/list_kuis.dart';
import 'package:aksara_sunda/models/kuis_view_model.dart';
import 'package:aksara_sunda/utils/answer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartKuisPage extends StatefulWidget {
  @override
  _StartKuisPageState createState() => _StartKuisPageState();
}

class _StartKuisPageState extends State<StartKuisPage> {
  // Untuk menyimpan jawaban yang dipilih untuk setiap pertanyaan
  Map<int, String?> selectedAnswers = {};
  List<Answer> _answers = [];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<QuizViewModel>(context, listen: false).fetchQuestions();
    });
  }

  // Fungsi untuk menangani pilihan jawaban
  void _onAnswerSelected(String questionId, String selectedOption) {
    setState(() {
      // Cek apakah jawaban sudah ada
      final existingAnswerIndex =
          _answers.indexWhere((answer) => answer.questionId == questionId);
      if (existingAnswerIndex != -1) {
        // Jika sudah ada, update jawabannya
        _answers[existingAnswerIndex] =
            Answer(questionId: questionId, selectedOption: selectedOption);
      } else {
        // Jika belum ada, tambahkan jawaban baru
        _answers.add(
            Answer(questionId: questionId, selectedOption: selectedOption));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizViewModel = Provider.of<QuizViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Kuis')),
      body: quizViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: quizViewModel.questions.length,
              itemBuilder: (context, index) {
                final question = quizViewModel.questions[index];

                // Pastikan question.id tidak null dan valid
                final questionId =
                    question.id.toString(); // Ubah ke String jika perlu
                final selectedAnswer = _answers.firstWhere(
                    (answer) => answer.questionId == questionId,
                    orElse: () =>
                        Answer(questionId: questionId, selectedOption: null));

                return QuizWidget(
                  question: question,
                  selectedOption: selectedAnswer.selectedOption,
                  onAnswerSelected: (answer) {
                    _onAnswerSelected(
                        questionId, answer!); // Pastikan answer tidak null
                  },
                );
              },
            ),
    );
  }
}
