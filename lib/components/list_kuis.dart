import 'package:aksara_sunda/utils/question.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final Question question;

  QuizWidget({required this.question});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  String? _selectedOption;

  // URL dasar untuk gambar
  final String baseUrl = "https://optimal-composed-ape.ngrok-free.app";

  @override
  Widget build(BuildContext context) {
    print("Question: ${widget.question.questionText}");
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan gambar pertanyaan jika ada
            if (widget.question.images['question'] != null)
              Image.network(
                baseUrl + widget.question.images['question']!,
                height: 100,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Gambar berhasil dimuat
                  } else {
                    return Center(
                        child:
                            CircularProgressIndicator()); // Gambar sedang dimuat
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                      child: Icon(
                          Icons.error)); // Menampilkan icon error jika gagal
                },
              ),
            SizedBox(height: 10),
            // Menampilkan teks pertanyaan
            Text(widget.question.questionText, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            // Menampilkan opsi jawaban
            ...widget.question.options.entries.map((entry) {
              String optionKey = entry.key;
              String optionText = entry.value;
              String? optionImage = widget.question.images['option_$optionKey'];

              return RadioListTile<String>(
                value: optionKey,
                groupValue: _selectedOption,
                title: Text(optionText),
                // Menampilkan gambar opsi jika ada
                secondary: optionImage != null
                    ? Image.network(
                        baseUrl + optionImage,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Icon(Icons.error));
                        },
                      )
                    : null,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
