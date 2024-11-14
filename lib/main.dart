import 'package:aksara_sunda/bloc/image_bloc.dart';
import 'package:aksara_sunda/page/main_page.dart';
import 'package:aksara_sunda/repository/drawing_repository.dart';
import 'package:aksara_sunda/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ImageBloc(DrawingRepository())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: AppColor.primaryColor,
            scaffoldBackgroundColor: AppColor.backgroundColor),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColor.darkPrimaryColor,
          scaffoldBackgroundColor: AppColor.darkBackgroundColor,
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
