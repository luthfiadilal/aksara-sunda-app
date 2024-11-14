import 'package:aksara_sunda/page/detail_materi.dart';
import 'package:aksara_sunda/styles/container_kamus_styles.dart';
import 'package:aksara_sunda/utils/materi.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MateriBox extends StatelessWidget {
  final Materi materi;
  late final double scale;

  MateriBox(this.materi, {this.scale = 1});

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
        style: kamusStyle.clone()
          ..width(350.w * scale)
          ..height(240.h * scale)
          ..border(all: 0.5, color: Color.fromARGB(255, 197, 164, 124)),
        child: Column(
          children: <Widget>[
            // Parent(
            //   style: containerImageStyle.clone()
            //     ..background.image(path: materi.image, fit: BoxFit.cover)
            //     ..width(MediaQuery.of(context).size.width * scale)
            //     ..height(130 * scale),
            // ),
            Container(
              width: MediaQuery.of(context).size.width.w * scale,
              height: 130.h * scale,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(materi.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Txt(
                      materi.judul,
                      style: titleStyle.clone()
                        ..fontSize(14.sp * scale)
                        ..maxLines(1)
                        ..textOverflow(TextOverflow.ellipsis)
                        ..textColor(Colors.black)
                        ..margin(bottom: 8),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Txt(
                      materi.deskripsi1,
                      style: subtitleStyle.clone()
                        ..fontSize(12.sp * scale)
                        ..maxLines(2)
                        ..textOverflow(TextOverflow.ellipsis)
                        ..textColor(Colors.black),
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
