import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';
import 'package:tijarat/widgets/text_widget.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkGreen,
      ),
      body: SizedBox(
        height: CustomSizes().dynamicHeight(context, 0.8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                // "assets/json/NoDataFound.json",
                'assets/json/manWorking.json',
                width: 500.w,
                height: 500.h,
              ),
              const SizedBox(
                height: 20,
              ),
              text(
                context,
                'This page is under construction',
                26.sp,
                Colors.black,
                bold: true,
              ),
              text(
                context,
                'We are working on it!',
                22.sp,
                Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UnderConstructionNoTabBar extends StatelessWidget {
  const UnderConstructionNoTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: CustomSizes().dynamicHeight(context, 0.8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                // "assets/json/NoDataFound.json",
                'assets/json/manWorking.json',
                width: 500.w,
                height: 500.h,
              ),
              const SizedBox(
                height: 20,
              ),
              text(
                context,
                'This page is under construction',
                26.sp,
                Colors.black,
                bold: true,
              ),
              text(
                context,
                'We are working on it!',
                22.sp,
                Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
