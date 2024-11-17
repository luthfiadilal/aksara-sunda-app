import 'package:aksara_sunda/bloc/image_bloc.dart';
import 'package:aksara_sunda/models/aksara_view_model.dart';
import 'package:aksara_sunda/models/kuis_view_model.dart';
import 'package:aksara_sunda/page/main_page.dart';
import 'package:aksara_sunda/repository/drawing_repository.dart';
import 'package:aksara_sunda/repository/kuis_repository.dart';
import 'package:aksara_sunda/splash_screen.dart';
import 'package:aksara_sunda/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// icon app

import 'package:flutter_launcher_icons/abs/icon_generator.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/config/config.dart';
import 'package:flutter_launcher_icons/config/macos_config.dart';
import 'package:flutter_launcher_icons/config/web_config.dart';
import 'package:flutter_launcher_icons/config/windows_config.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/logger.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_generator.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_template.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/pubspec_parser.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/web/web_icon_generator.dart';
import 'package:flutter_launcher_icons/web/web_template.dart';
import 'package:flutter_launcher_icons/windows/windows_icon_generator.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ImageBloc(DrawingRepository())),
        ChangeNotifierProvider(
          create: (_) => QuizViewModel(QuizRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => AksaraViewModel(),
        ),
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
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              primary: AppColor.primaryColor,
              surface: AppColor.backgroundColor,
              background: AppColor.backgroundColor,
              surfaceContainerLow: AppColor.backgroundColor,
              secondaryContainer: AppColor.backgroundColor,
              surfaceContainer: AppColor.backgroundColor,
              shadow: const Color.fromARGB(73, 39, 39, 39),
              seedColor: AppColor.primaryColor),
        ),
        darkTheme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              primary: AppColor.primaryColor,
              surface: AppColor.darkBackgroundColor,
              onSurface: AppColor.darkTextColor,
              background: AppColor.darkBackgroundColor,
              surfaceContainerLow: AppColor.darkBackgroundColor,
              secondaryContainer: const Color.fromARGB(255, 223, 200, 169),
              surfaceContainer: AppColor.darkBackgroundColor,
              shadow: const Color.fromARGB(73, 194, 194, 194),
              seedColor: AppColor.primaryColor),
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
