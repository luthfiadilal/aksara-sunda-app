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
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 70.h,
                      margin: EdgeInsets.only(top: 10, right: 16, left: 16),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
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
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                child: Text("Aksara\nSwara",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
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
          // SizedBox(width: 10.w),
          Expanded(
            child: Container(
              width: 100.w,
              height: 130.h,
              // color: Colors.yellow,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 70.h,
                      margin: EdgeInsets.only(top: 10, right: 16, left: 16),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
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
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: Text("Aksara\nNgalagena",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
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
