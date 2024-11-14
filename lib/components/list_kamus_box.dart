import 'package:aksara_sunda/styles/container_banner_styles.dart';
import 'package:aksara_sunda/styles/container_kamus_styles.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListKamusBox extends StatelessWidget {
  const ListKamusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10, right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              width: 100.w,
              height: 130.h,
              // color: Colors.yellow,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Parent(
                      style: kamusCardStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Txt(
                                "Aksara\nSwara",
                                style: mainTextStyle.clone()
                                  ..textColor(Colors.black)
                                  ..fontSize(16.sp)
                                  ..margin(right: 15),
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
                      padding: const EdgeInsets.only(left: 8),
                      child: SvgPicture.asset(
                        "images/aksara2.svg",
                        width: 60.w,
                        height: 60.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Container(
              width: 100.w,
              height: 130.h,
              // color: Colors.yellow,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Parent(
                      style: kamusCardStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Txt(
                                "Aksara\nngalagena",
                                style: mainTextStyle.clone()
                                  ..textColor(Colors.black)
                                  ..fontSize(16.sp)
                                  ..margin(right: 10),
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
                      padding: const EdgeInsets.only(left: 8),
                      child: SvgPicture.asset(
                        "images/aksara1.svg",
                        width: 60.w,
                        height: 60.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
