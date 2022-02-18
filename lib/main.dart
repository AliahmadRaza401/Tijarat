import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tijarat/app%20screens/authentication/login.dart';
import 'package:tijarat/utils/app_color.dart';

import 'app screens/farmer/far_home.dart';
import 'providers/multiProviders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(540, 1179),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MultiProvider(
      providers: multiProvider,
      child:
         MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Tijarat',
              builder: (context, widget) {
                //add this line
                ScreenUtil.setContext(context);
                return MediaQuery(
                  //Setting font does not change with system font size
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
              home: const Login(),
     ) ));
  }
}
