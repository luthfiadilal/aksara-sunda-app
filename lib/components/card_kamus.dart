import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardKamus extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const CardKamus(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 130.h,
        // color: Colors.yellow,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width.w,
                height: 70.h,
                margin: EdgeInsets.only(top: 10, right: 16, left: 16),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.shadow,
                          spreadRadius: -5,
                          blurRadius: 10,
                          offset: Offset(2, 4))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Text(title,
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              textDirection: TextDirection.rtl,
                              maxLines: 2),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, top: 12),
                child: SvgPicture.asset(
                  image,
                  width: 54.w,
                  height: 54.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
