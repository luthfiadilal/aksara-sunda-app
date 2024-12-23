import 'dart:ui';

import 'package:aksara_sunda/main.dart';
import 'package:aksara_sunda/page/home_page.dart';
import 'package:aksara_sunda/page/image_processing_page.dart';
import 'package:aksara_sunda/page/kuis_page.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70.w, // Atur lebar FAB
        height: 70.h, // Atur tinggi FAB
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Aksara Sunda",
          style: GoogleFonts.getFont('Poppins'),
        ),
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
                    duration: const Duration(milliseconds: 600),
                    child: SvgPicture.asset(
                      "images/home_line.svg",
                      color: currentPageIndex == 0
                          ? Color.fromARGB(255, 197, 164, 124)
                          : Color.fromARGB(255, 163, 163, 163),
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
                    duration: const Duration(milliseconds: 600),
                    child: SvgPicture.asset(
                      "images/task.svg",
                      color: currentPageIndex == 1
                          ? Color.fromARGB(255, 197, 164, 124)
                          : Color.fromARGB(255, 163, 163, 163),
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
