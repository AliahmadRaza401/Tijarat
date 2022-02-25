import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/app%20screens/owner/drawer.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';

PreferredSizeWidget ownerAppBar(context, bool isOwner, {back = false}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(100.h),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(13.r),
          bottomLeft: Radius.circular(13.r),
        ),
        color: AppColors.customWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          back == false
              ? GestureDetector(
                  onTap: () {
                    drawer(
                      context,
                    );
                  },
                  child: Icon(
                    Icons.menu_rounded,
                    color: AppColors.darkGreen,
                    size: 60.r,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    AppRoutes.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.darkGreen,
                    size: 60.r,
                  ),
                ),
          Image.asset(
            "assets/logo.png",
            height: 55.h,
          ),
        ],
      ),
    ),
  );
}
