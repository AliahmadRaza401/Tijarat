import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/navbar/onr_navbar.dart';
import 'package:tijarat/widgets/text_widget.dart';
import 'package:tijarat/widgets/underconstruction.dart';

import '../../navbar/far_navbar.dart';
import '../../services/sp_services.dart';
import '../../utils/app_color.dart';
import '../../utils/app_routes.dart';

bool isSwitched = false;

consumerModeButton(BuildContext context) {
  return StatefulBuilder(builder: (context, StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text(
          "Owner",
          20.sp,
          AppColors.customWhite,
          bold: true,
        ),
        SizedBox(
          width: 10.w,
        ),
        Switch(
          value: isSwitched,
          onChanged: (value) async {
            setState(() {
              isSwitched = value;
            });

            AppRoutes.push(context, const FarmerNavBar());
          },
          activeTrackColor: AppColors.lightGreen1,
          activeColor: AppColors.customYellow,
          inactiveTrackColor: AppColors.lightGreen,
          inactiveThumbColor: AppColors.customGrey,
        ),
        SizedBox(
          width: 10.w,
        ),
        text(
          "Farmer",
          20.sp,
          AppColors.customWhite,
          bold: true,
        ),
      ],
    );
  });
}

drawer(
  context,
) {
  return showDialog(
    barrierDismissible: true,
    barrierColor: Colors.white54,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 110.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  color: AppColors.noColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      23.r,
                    ),
                  ),
                  child: Container(
                    height: 700.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.r),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.darkGreen,
                          AppColors.lightGreen,
                        ],
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 40.h,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppRoutes.pop(context);
                          },
                          child: drawerRow(context,
                              "assets/png/drawerItem1.png", "Dashboard"),
                        ),
                        SizedBox(height: 30.h),
                        GestureDetector(
                          onTap: () {
                            AppRoutes.push(context, UnderConstruction());
                          },
                          child: drawerRow(
                              context, "assets/png/drawerItem2.png", "Posts"),
                        ),
                        SizedBox(height: 30.h),
                        GestureDetector(
                          onTap: () {
                            AppRoutes.push(context, UnderConstruction());
                          },
                          child: drawerRow(context,
                              "assets/png/drawerItem3.png", "Today's Rate"),
                        ),
                        SizedBox(height: 30.h),
                        GestureDetector(
                          onTap: () {
                            AppRoutes.push(context, UnderConstruction());
                          },
                          child: drawerRow(
                              context,
                              "assets/png/drawerItem4.png",
                              "Previous requests"),
                        ),
                        // SizedBox(height: 20.h),
                        // drawerRow(
                        //     context, "assets/png/drawerItem5.png", "Logout"),
                        SizedBox(height: 140.h),
                        consumerModeButton(context),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            SpServices.saveOwnerLoggedIn(false);
                            SpServices.saveUserLoggedIn(false);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const FarmerNavBar(),
                              ),
                            );
                          },
                          child: drawerRow(
                              context, "assets/png/drawerItem5.png", "Logout"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
    },
  );
}

Widget drawerRow(context, icon, title) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 36.w,
        height: 36.h,
      ),
      SizedBox(
        width: 20.w,
      ),
      text(
        title,
        26.sp,
        AppColors.customWhite,
        bold: true,
      ),
    ],
  );
}
