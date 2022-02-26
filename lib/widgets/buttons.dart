import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tijarat/providers/auth_provider.dart';

import '../utils/app_color.dart';

Widget coloredButton(context, text, color,
    {function = "",
    width = "",
    height = "",
    dynamic fontSize = "",
    bool loading = true}) {
  return GestureDetector(
    onTap: function == "" ? () {} : function,
    child: Container(
      width: width == "" ? 391.w : width,
      height: height == "" ? 53.h : height,
      decoration: color == AppColors.noColor
          ? BoxDecoration(
              color: color,
              border: Border.all(width: 1, color: AppColors.buttonGreen),
              borderRadius: BorderRadius.circular(15.r),
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
      child: loading
          ? Center(
              child: Provider.of<AuthProvider>(context).loading == true
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        color: color == AppColors.noColor
                            ? AppColors.buttonGreen
                            : AppColors.customWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize == "" ? 24.sp : fontSize,
                      ),
                    ),
            )
          : Center(
              child: Text(
                text,
                style: TextStyle(
                  color: color == AppColors.noColor
                      ? AppColors.buttonGreen
                      : AppColors.customWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize == "" ? 24.sp : fontSize,
                ),
              ),
            ),
    ),
  );
}
