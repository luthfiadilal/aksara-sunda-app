import 'package:aksara_sunda/components/list_kuis.dart';
import 'package:aksara_sunda/models/kuis_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartKuisPage extends StatefulWidget {
  @override
  _StartKuisPageState createState() => _StartKuisPageState();
}

class _StartKuisPageState extends State<StartKuisPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<QuizViewModel>(context, listen: false).fetchQuestions();
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
                return QuizWidget(question: question);
              },
            ),
    );
  }
}
