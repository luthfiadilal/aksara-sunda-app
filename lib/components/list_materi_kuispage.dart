import 'package:aksara_sunda/page/detail_materi.dart';
import 'package:aksara_sunda/styles/container_kamus_styles.dart';
import 'package:aksara_sunda/utils/materi.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMateriKuispage extends StatelessWidget {
  final Materi materi;
  const ListMateriKuispage({Key? key, required this.materi}) : super(key: key);

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
        width: 300.w,
        height: 110.h,
        margin: EdgeInsets.only(bottom: 5.h, top: 10.w, right: 25.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  spreadRadius: -5,
                  blurRadius: 10,
                  offset: Offset(2, 4))
            ]),
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
              height: 100.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(materi.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
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
                          maxLines: 3,
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
