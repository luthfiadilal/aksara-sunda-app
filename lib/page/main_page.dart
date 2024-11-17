import 'dart:ui';

import 'package:aksara_sunda/main.dart';
import 'package:aksara_sunda/page/home_page.dart';
import 'package:aksara_sunda/page/image_processing_page.dart';
import 'package:aksara_sunda/page/kuis_page.dart';
import 'package:aksara_sunda/utils/second_tooltip_manager.dart';
import 'package:aksara_sunda/utils/tooltip_manager.dart';
import 'package:coachmaker/coachmaker.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPageApp extends StatelessWidget {
  const MainPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  Widget _getContent() {
    switch (currentPageIndex) {
      case 0:
        return HomePage();
      case 1:
        return KuisPage();
      default:
        return HomePage();
    }
  }

  @override
  void initState() {
    super.initState();

    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLaunch = prefs.getBool('isFirstLaunch');
    bool? isSecondTooltipShown = prefs.getBool('isSecondTooltipShown');

    if (isFirstLaunch == null || isFirstLaunch) {
      // Tampilkan tooltip pertama
      TooltipManager.showTooltip(context);
      await prefs.setBool('isFirstLaunch', false);
    }

    if (isSecondTooltipShown == null || isSecondTooltipShown) {
      // Tampilkan tooltip kedua
      SecondTooltipManager.showTooltip(context);
      await prefs.setBool('isSecondTooltipShown', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70.w, // Atur lebar FAB
        height: 70.h, // Atur tinggi FAB
        child: CoachPoint(
          initial: '5',
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 197, 164, 124),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageProcessingPage()),
              );
            },
            shape: const CircleBorder(),
            elevation: 0,
            child: SvgPicture.asset(
              "images/camera.svg",
              color: Colors.white,
              width: 34.w,
              height: 34.h,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Aksara Sunda"),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow, // Warna bayangan
              spreadRadius: 5,
              blurRadius: 30,
              offset: Offset(0, 15), // Bayangan muncul di atas
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: BottomAppBar(
            height: 60.h,
            notchMargin: 7.0,
            color: Theme.of(context).colorScheme.surface,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPageIndex = 0;
                    });
                  },
                  child: AnimatedScale(
                    scale: currentPageIndex == 0 ? 1.5 : 1.3,
                    duration: const Duration(milliseconds: 200),
                    child: CoachPoint(
                      initial: '6',
                      child: SvgPicture.asset(
                        "images/home_line.svg",
                        color: currentPageIndex == 0
                            ? Color.fromARGB(255, 197, 164, 124)
                            : Color.fromARGB(255, 163, 163, 163),
                      ),
                    ),
                  ),
                ),
                Container(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPageIndex = 1;
                    });
                  },
                  child: AnimatedScale(
                    scale: currentPageIndex == 1 ? 1.5 : 1.3,
                    duration: const Duration(milliseconds: 200),
                    child: CoachPoint(
                      initial: '7',
                      child: SvgPicture.asset(
                        "images/task.svg",
                        color: currentPageIndex == 1
                            ? Color.fromARGB(255, 197, 164, 124)
                            : Color.fromARGB(255, 163, 163, 163),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _getContent(),
    );
  }
}
