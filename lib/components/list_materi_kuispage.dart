import 'package:aksara_sunda/page/detail_materi.dart';
import 'package:aksara_sunda/styles/container_kamus_styles.dart';
import 'package:aksara_sunda/utils/materi.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: Parent(
        style: kamusStyle
          ..clone()
          ..width(300.w)
          ..height(110.h),
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
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
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
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(materi.deskripsi1,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis)),
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
