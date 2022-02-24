import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';
import 'package:tijarat/widgets/text_widget.dart';

Widget underConstruction(BuildContext context) {
  return SizedBox(
    height: CustomSizes().dynamicHeight(context, 0.8),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/json/Underconstruction girl.json',
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
            bold: FontWeight.bold,
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
  );
}
