import 'dart:math';
import 'package:aksara_sunda/components/card_kamus.dart';
import 'package:aksara_sunda/components/kamus_box.dart';
import 'package:aksara_sunda/components/list_kamus_box.dart';
import 'package:aksara_sunda/models/materi_view_model.dart';
import 'package:aksara_sunda/page/angka_page.dart';
import 'package:aksara_sunda/page/drawing_page.dart';
import 'package:aksara_sunda/page/ngalagena.dart';
import 'package:aksara_sunda/page/rarangken.dart';
import 'package:aksara_sunda/page/showall_materi.dart';
import 'package:aksara_sunda/page/swara_page.dart';
import 'package:aksara_sunda/repository/kamus_repository.dart';
import 'package:aksara_sunda/styles/container_kamus_styles.dart';
import 'package:aksara_sunda/utils/aksara.dart';
import 'package:aksara_sunda/utils/second_tooltip_manager.dart';
import 'package:aksara_sunda/utils/tooltip_manager.dart';
import 'package:coachmaker/coachmaker.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aksara_sunda/styles/container_banner_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _checkFirstLaunch();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // Future<void> _checkFirstLaunch() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? isFirstLaunch = prefs.getBool('isFirstLaunch');

  //   if (isFirstLaunch == null || isFirstLaunch) {
  //     // Tampilkan tooltip
  //     TooltipManager.showTooltip(context);

  //     // Set isFirstLaunch menjadi false
  //     await prefs.setBool('isFirstLaunch', false);
  //   }
  // }

  Future<void> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLaunch = prefs.getBool('isFirstLaunch');
    bool? isSecondTooltipShown = prefs.getBool('isSecondTooltipShown');

    if (isFirstLaunch == null || isFirstLaunch) {
      print("TOOLTIP PERTAMA");
      // Tampilkan tooltip pertama
      TooltipManager.showTooltip(context);
      await prefs.setBool('isFirstLaunch', false);
    }

    if (isSecondTooltipShown == null || isSecondTooltipShown) {
      print("TOOLTIP KEDUA");
      // Tampilkan tooltip kedua
      SecondTooltipManager.showTooltip(context);
      await prefs.setBool('isSecondTooltipShown', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final KamusRepository kamusRepository = KamusRepository();
    final List<Map<String, String>> daftarKamus =
        kamusRepository.getKamusData();
    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DrawingPage();
              }));
            },
            child: CoachPoint(
              initial: "1",
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
                          style: mainTextStyle
                            ..clone()
                            ..textColor(Colors.white),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Kamus",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Flexible(
            child: CoachPoint(
              initial: '2',
              child: ListView.builder(
                padding: EdgeInsets.only(left: 12, right: 10),
                scrollDirection: Axis.horizontal,
                itemCount: daftarKamus.length,
                itemBuilder: (context, index) {
                  // Debugging: Print semua title
                  print('Title in daftarKamus: ${daftarKamus[index]['title']}');

                  return CardKamus(
                    title: daftarKamus[index]["title"]!,
                    image: daftarKamus[index]["image"]!,
                    onTap: () {
                      // Debugging: Print current title
                      print('Card tapped: ${daftarKamus[index]['title']}');

                      if (daftarKamus[index]['title'] == "Aksara\nSwara") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SwaraPage();
                        }));
                      } else if (daftarKamus[index]['title'] ==
                          "Aksara\nNgalagena") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Ngalagena();
                        }));
                      } else if (daftarKamus[index]['title'] ==
                          "Aksara\nRarangken") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Rarangken();
                        }));
                      } else if (daftarKamus[index]['title'] ==
                          "Aksara\nAngka") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AngkaPage();
                        }));
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Materi",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.normal),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ShowallMateri();
                  }));
                },
                child: CoachPoint(
                  initial: '4',
                  child: Txt(
                    "show all",
                    style: mainTextStyle.clone()
                      ..textColor(Color.fromARGB(255, 197, 164, 124))
                      ..fontSize(14.sp) // Menggunakan ScreenUtil
                      ..margin(right: 20.w) // Menggunakan ScreenUtil
                      ..fontWeight(FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            flex: 2, // Anda bisa menyesuaikan flex ini sesuai kebutuhan
            child: CoachPoint(
              initial: '3',
              child: Container(
                padding: EdgeInsets.only(bottom: 26),
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
          ),
        ],
      ),
    );
  }
}
