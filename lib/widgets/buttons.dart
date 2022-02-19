import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';

import '../utils/app_color.dart';

Widget coloredButton(context, text, color,
    {function = "", width = "", dynamic fontSize = ""}) {
  return GestureDetector(
    onTap: function == "" ? () {} : function,
    child: Container(
      width: width == "" ? 391.w : width,
      height: 53.h,
      decoration: color == AppColors.noColor
          ? BoxDecoration(
              color: color,
              border: Border.all(width: 1, color: AppColors.customWhite),
            )
          : BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.darkGreen,
                  AppColors.lightGreen,
                ],
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.customWhite,
            fontWeight: FontWeight.bold,
            fontSize: fontSize == "" ? 24.sp : fontSize.sp,
          ),
        ),
      ),
    ),
  );
}
