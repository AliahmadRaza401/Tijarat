import 'package:faded/faded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tijarat/common/splash_screen.dart';
import 'package:tijarat/utils/app_color.dart';

import 'providers/multiProviders.dart';

void main() {
  runApp(
    const Faded(
      dueDate: '2022-06-30',
      daysDeadline: 07,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(540, 1179),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MultiProvider(
        providers: multiProvider,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tijarat',
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          theme: ThemeData(
            primarySwatch: AppColors.primaryColor,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
