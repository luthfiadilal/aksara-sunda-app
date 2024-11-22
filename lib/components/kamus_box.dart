import 'package:aksara_sunda/page/detail_materi.dart';
import 'package:aksara_sunda/styles/container_kamus_styles.dart';
import 'package:aksara_sunda/utils/materi.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: Container(
        child: Container(
          width: 350.w * scale,
          height: 240.h * scale,
          margin: EdgeInsets.only(top: 10, right: 16, left: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(16),
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
                width: MediaQuery.of(context).size.width.w * scale,
                height: 130.h * scale,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(materi.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          materi.judul,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp * scale,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(materi.deskripsi1,
                            maxLines: 2,
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp * scale,
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
      ),
    );
  }
}
