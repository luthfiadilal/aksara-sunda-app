import 'package:aksara_sunda/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aksara_sunda/utils/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizWidget extends StatefulWidget {
  final Question question;
  final String? selectedOption;
  final ValueChanged<String?> onAnswerSelected;

  QuizWidget({
    required this.question,
    required this.selectedOption,
    required this.onAnswerSelected,
  });

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  bool _isAnswered = false; // Menandakan apakah sudah dijawab
  String? _userSelectedOption; // Menyimpan jawaban pengguna

  bool _isValidImageUrl(String? url) {
    return url != null &&
        url.isNotEmpty &&
        (url.startsWith('http://') || url.startsWith('https://'));
  }

  @override
  void initState() {
    super.initState();
    _userSelectedOption = widget.selectedOption;
    _isAnswered = _userSelectedOption != null; // Set status sudah dijawab
  }

  @override
  void didUpdateWidget(QuizWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update jika selectedOption berubah
    if (oldWidget.selectedOption != widget.selectedOption) {
      setState(() {
        _userSelectedOption = widget.selectedOption;
        // _isAnswered =
        //     _userSelectedOption != null; // Update status sudah dijawab
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan gambar pertanyaan jika ada dan valid
            _isValidImageUrl(widget.question.images['question'])
                ? Image.network(
                    widget.question.images['question']!,
                    height: 100,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Gambar berhasil dimuat
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(); // Menampilkan SizedBox jika gambar tidak valid
                    },
                  )
                : SizedBox(), // Menampilkan SizedBox jika URL tidak valid
            SizedBox(height: 10),
            // Menampilkan teks pertanyaan
            Text(widget.question.questionText,
                style: GoogleFonts.poppins(fontSize: 15.sp)),
            SizedBox(height: 10),
            // Menampilkan opsi jawaban
            ...widget.question.options.entries.map((entry) {
              String optionKey = entry.key;
              String optionText = entry.value;
              String? optionImage = widget.question.images['option_$optionKey'];

              return Container(
                width: MediaQuery.of(context).size.width,
                height: 70.h,
                // child: Opacity(
                //   opacity: _userSelectedOption != null &&
                //           _userSelectedOption != optionKey
                //       ? 0.5
                //       : 1.0, // Mengatur opacity untuk opsi yang tidak dipilih
                //   // opacity: _isAnswered && widget.selectedOption != optionKey
                //   //     ? 0.5
                //   //     : 1.0, // Mengatur opacity untuk opsi yang tidak dipilih
                //   child:
                child: RadioListTile<String>(
                  value: optionKey,
                  groupValue: _userSelectedOption ?? widget.selectedOption,
                  title: Row(
                    children: [
                      Text(
                        optionText,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                        ),
                      ), // Teks opsi
                      SizedBox(width: 8),
                      // Menampilkan gambar opsi jika ada dan valid
                      _isValidImageUrl(optionImage)
                          ? SizedBox(
                              width: 100,
                              height: 50,
                              child: Image.network(
                                optionImage!,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return SizedBox(); // Menampilkan SizedBox jika gambar tidak valid
                                },
                              ),
                            )
                          : SizedBox(), // Menampilkan SizedBox jika URL tidak valid
                    ],
                  ),
                  onChanged: (value) {
                    setState(() {
                      _userSelectedOption = value; // Simpan jawaban pengguna
                    });
                    widget.onAnswerSelected(
                        value); // Panggil callback untuk menyimpan jawaban
                    // if (!_isAnswered) {
                    //   setState(() {
                    //     _isAnswered = true; // Tandai sebagai sudah dijawab
                    //     _userSelectedOption = value; // Simpan jawaban pengguna
                    //   });
                    //   widget.onAnswerSelected(
                    //       value); // Panggil callback untuk menyimpan jawaban
                    // }
                  },
                  // Mengatur warna latar belakang berdasarkan jawaban
                  // tileColor: _isAnswered
                  //     ? (optionKey == widget.question.correctAnswer &&
                  //                 _userSelectedOption == optionKey
                  //             ? Colors.green
                  //                 .withOpacity(0.3) // Benar dan dipilih
                  //             : (optionKey == _userSelectedOption
                  //                 ? Colors.red
                  //                     .withOpacity(0.3) // Salah dan dipilih
                  //                 : null) // Opsi tidak dipilih
                  //         )
                  //     : null,
                  activeColor:
                      AppColor.primaryColor, // Warna aktif untuk radio button
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
