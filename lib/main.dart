import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tijarat/app%20screens/login.dart';
import 'package:tijarat/utils/config.dart';

import 'app screens/home.dart';

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
      builder: () =>
    
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tijarat',
      theme: ThemeData(
        primarySwatch: CustomColors.primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const Login(),
     )
    );
  }
}
