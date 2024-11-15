import 'package:aksara_sunda/bloc/image_bloc.dart';
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

void main() async {
  // WidgetsFlutterBinding.ensureInitialized(); // Pastikan ini tidak dikomentari
  // FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  // // Simulasi waktu loading (jika perlu)
  // await Future.delayed(Duration(seconds: 2));

  // // Menghapus splash screen
  // FlutterNativeSplash.remove();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ImageBloc(DrawingRepository())),
        ChangeNotifierProvider(
          create: (_) => QuizViewModel(QuizRepository()),
        )
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
        home: SplashScreen(),
      ),
    );
  }
}
