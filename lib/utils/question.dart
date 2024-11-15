class Question {
  final int id;
  final String questionText;
  final Map<String, String> options;
  final Map<String, String> images;
  final String correctAnswer;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.images,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      questionText: json['question_text'],
      options: Map<String, String>.from(json['options']),
      images: Map<String, String>.from(json['images']),
      correctAnswer: json['correct_answer'],
    );
  }
}
