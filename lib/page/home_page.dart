import 'dart:math';
import 'package:aksara_sunda/components/kamus_box.dart';
import 'package:aksara_sunda/components/list_kamus_box.dart';
import 'package:aksara_sunda/models/materi_view_model.dart';
import 'package:aksara_sunda/page/drawing_page.dart';
import 'package:aksara_sunda/styles/container_kamus_styles.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aksara_sunda/styles/container_banner_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double currentPage = 2;
  PageController pageController =
      PageController(initialPage: 2, viewportFraction: 0.6);
  final MateriViewModel materiViewModel = MateriViewModel();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DrawingPage();
              }));
            },
            child: Parent(
              style: mainContainerStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 20.w), // Menggunakan ScreenUtil
                      child: Txt(
                        "Ayo Belajar Menulis Aksara Sunda",
                        style: mainTextStyle,
                      ),
                    ),
                  ),
                  Parent(
                    style: iconContainerStyle,
                    child: SvgPicture.asset(
                      "images/pen.svg",
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Txt(
                "Kamus",
                style: mainTextStyle.clone()
                  ..fontSize(18.sp) // Menggunakan ScreenUtil
                  ..margin(left: 20.w) // Menggunakan ScreenUtil
                  ..fontWeight(FontWeight.normal),
              ),
            ],
          ),
          Flexible(
            child: ListKamusBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Txt(
                "Materi",
                style: mainTextStyle.clone()
                  ..fontSize(18.sp) // Menggunakan ScreenUtil
                  ..margin(left: 20.w) // Menggunakan ScreenUtil
                  ..fontWeight(FontWeight.normal),
              ),
              Txt(
                "show all",
                style: mainTextStyle.clone()
                  ..textColor(Color.fromARGB(255, 197, 164, 124))
                  ..fontSize(14.sp) // Menggunakan ScreenUtil
                  ..margin(right: 20.w) // Menggunakan ScreenUtil
                  ..fontWeight(FontWeight.normal),
              ),
            ],
          ),
          Flexible(
            flex: 2, // Anda bisa menyesuaikan flex ini sesuai kebutuhan
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: PageView.builder(
                controller: pageController,
                itemCount: materiViewModel.materiList.length,
                itemBuilder: (context, index) {
                  double difference = index - currentPage;
                  if (difference < 0) {
                    difference *= -1;
                  }
                  difference = min(1, difference);
                  return Center(
                    child: MateriBox(
                      materiViewModel.materiList[index],
                      scale: 1 - (difference * 0.3),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
