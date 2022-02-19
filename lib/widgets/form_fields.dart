import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/utils/constants.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';

import '../utils/app_color.dart';

Widget inputTextField(context, label, myController,
    {function, function2, password = false, icon, keyboardType = ""}) {
  return Container(
    width: 424.w,
    height: 57.h,
    color: AppColors.noColor,
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (function == "")
          ? () {
              return null;
            }
          : function,
      controller: myController,
      textInputAction: TextInputAction.next,
      keyboardType:
          keyboardType == "" ? TextInputType.emailAddress : keyboardType,
      obscureText: password == true ? obscureText : false,
      cursorColor: AppColors.customBlack,
      cursorWidth: 1.0,
      style: TextStyle(
        color: AppColors.customBlack,
        fontSize: 18.sp,
      ),
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        focusColor: AppColors.customGrey2,
        hoverColor: AppColors.customGrey2,
        fillColor: AppColors.customGrey2,
        filled: true,
        isDense: true,
        hintText: label,
        suffixIcon: Image.asset(
          "$icon",
          width: 24.w,
          height: 24.h,
          color: const Color(0xffC4C4C4),
        ),
        hintStyle: TextStyle(
          fontSize: 18.sp,
          color: const Color(0xffC4C4C4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: const BorderSide(color: Color(0xffCCC9C9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: const BorderSide(color: AppColors.customBlack),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: const BorderSide(color: AppColors.customBlack),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: const BorderSide(color: AppColors.customBlack),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.r),
          borderSide: const BorderSide(color: AppColors.customBlack),
        ),
        contentPadding: EdgeInsets.only(
          left: CustomSizes().dynamicWidth(context, .05),
          bottom: CustomSizes().dynamicHeight(context, .014),
        ),
      ),
    ),
  );
}
