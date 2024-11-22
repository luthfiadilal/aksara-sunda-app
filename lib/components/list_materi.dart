import 'package:aksara_sunda/page/detail_materi.dart';
import 'package:aksara_sunda/styles/container_kamus_styles.dart';
import 'package:aksara_sunda/utils/materi.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMateri extends StatelessWidget {
  final Materi materi;
  const ListMateri({Key? key, required this.materi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailMateriPage(materi: materi)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5.h),
        width: MediaQuery.of(context).size.width.w,
        height: 250.w,
        child: Column(
          children: <Widget>[
            // Parent(
            //   style: containerImageStyle.clone()
            //     ..background.image(path: materi.image, fit: BoxFit.cover)
            //     ..width(MediaQuery.of(context).size.width * scale)
            //     ..height(130 * scale),
            // ),
            Container(
              width: MediaQuery.of(context).size.width.w,
              height: 140.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(materi.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(materi.judul,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(materi.deskripsi1,
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                          ),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
