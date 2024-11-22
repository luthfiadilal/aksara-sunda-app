import 'package:aksara_sunda/components/list_materi_kuispage.dart';
import 'package:aksara_sunda/page/start_kuis_page.dart';
import 'package:aksara_sunda/repository/materi_repository.dart';
import 'package:aksara_sunda/utils/app_color.dart';
import 'package:aksara_sunda/utils/materi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class KuisPage extends StatelessWidget {
  const KuisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MateriRepository materiRepository = MateriRepository();
    final List<Materi> daftarMateri = materiRepository.getMateriList();

    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
          child: Text(
            "Ayo asah pengetahuanmu dengan mengerjakan kuis ini!",
            style: GoogleFonts.poppins(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
          child: Text(
            "Selamat datang di kuis! Uji wawasanmu, nikmati setiap pertanyaan, dan ingat, belajar adalah perjalanan yang penuh makna!",
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
          child: Text(
            "Klik tombol dibawah ini untuk memulai kuis",
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: AppColor.secondaryColor,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width.w,
          height: 50.w,
          margin:
              EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w, bottom: 10.h),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartKuisPage()),
              );
            },
            child: Text(
              "Mulai Kuis",
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                // fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Text(
              "Rekomendasi Materi",
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Flexible(
            child: ListView.builder(
                padding: EdgeInsets.only(left: 18, right: 10, bottom: 30),
                scrollDirection: Axis.horizontal,
                itemCount: daftarMateri.length,
                itemBuilder: (context, index) {
                  return ListMateriKuispage(materi: daftarMateri[index]);
                }))
      ],
    ));
  }
}
