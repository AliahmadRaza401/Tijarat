import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';
import 'package:tijarat/widgets/text_widget.dart';
import 'package:tijarat/widgets/underconstruction.dart';

Widget catCard(context, name, image, {page = ""}) {
  return Container(
    width: 246.w,
    height: 255.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(
        color: const Color(0xff076733),
        width: 4.w,
      ),
      image: DecorationImage(
        image: AssetImage(
          image,
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: GestureDetector(
      onTap: () {
        AppRoutes.push(context, const UnderConstruction());
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              width: 250.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: AppColors.customBlack.withOpacity(.4),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40.w,
                    ),
                    text(
                      name,
                      26.sp,
                      AppColors.customWhite,
                      bold: true,
                    ),
                    Icon(
                      Icons.navigate_next_rounded,
                      size: 40.r,
                      color: AppColors.customWhite,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
