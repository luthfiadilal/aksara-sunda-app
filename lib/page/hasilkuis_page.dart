import 'package:aksara_sunda/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HasilkuisPage extends StatelessWidget {
  final int score;
  final VoidCallback onMainMenu;

  const HasilkuisPage({
    Key? key,
    required this.score,
    required this.onMainMenu,
  }) : super(key: key);

  // Fungsi untuk menentukan ikon berdasarkan skor
  // Widget _getIcon() {
  //   if (score >= 80) {
  //     return Image.asset(
  //       "images/happy.png",
  //       fit: BoxFit.cover,
  //     ); // Ikon bahagia
  //   } else if (score >= 50) {
  //     return Image.asset("images/netral.png", fit: BoxFit.cover); // Ikon netral
  //   } else {
  //     return Image.asset("images/sad.png", fit: BoxFit.cover); // Ikon sedih
  //   }
  // }

  Widget _getIcon(BuildContext context) {
    if (score >= 80) {
      return Icon(
        Icons.sentiment_very_satisfied, // Ikon bahagia
        size: 100.0,
        color: Theme.of(context).colorScheme.primary, // Ukuran ikon
      );
    } else if (score >= 50) {
      return Icon(Icons.sentiment_neutral, // Ikon netral
          size: 100.0,
          color: Theme.of(context).colorScheme.primary // Ukuran ikon
          );
    } else {
      return Icon(Icons.sentiment_dissatisfied, // Ikon sedih
          size: 100.0,
          color: Theme.of(context).colorScheme.primary // Ukuran ikon
          );
    }
  }

  // Fungsi untuk menentukan warna ikon berdasarkan skor
  Color _getIconColor() {
    if (score >= 80) {
      return Colors.green; // Hijau untuk skor tinggi
    } else if (score >= 50) {
      return Colors.orange; // Oranye untuk skor sedang
    } else {
      return Colors.red; // Merah untuk skor rendah
    }
  }

  // Fungsi untuk menentukan pesan berdasarkan skor
  String _getMessage() {
    if (score >= 80) {
      return "Luar Biasa!";
    } else if (score >= 50) {
      return "Kerja Bagus!";
    } else {
      return "Terus Berusaha!";
    }
  }

  String _getMotivationMessage() {
    if (score >= 80) {
      return "Luar biasa! Hasilmu sangat mengesankan! Terus pertahankan semangat ini!";
    } else if (score >= 50) {
      return "Bagus sekali! Kamu sudah berada di jalur yang tepat. Ayo, tingkatkan lagi untuk mencapai hasil yang lebih gemilang!";
    } else {
      return "Jangan pernah menyerah! Setiap usaha adalah langkah menuju kesuksesan. Terus berjuang, kamu pasti bisa!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onMainMenu(); // Panggil fungsi ketika tombol back ditekan
        return false; // Menghindari navigasi default
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hasil Kuis",
            style: GoogleFonts.poppins(),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 100.w, height: 100.w, child: _getIcon(context)),
                SizedBox(height: 10.h),
                Text(
                  _getMessage(),
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  _getMotivationMessage(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 17.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Skor kamu: $score",
                  style: GoogleFonts.poppins(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.only(
                        left: 40.w, right: 40.w, top: 10.h, bottom: 10.h),
                  ),
                  onPressed: onMainMenu,
                  child: Text(
                    "Kembali",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Theme.of(context).colorScheme.background),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
