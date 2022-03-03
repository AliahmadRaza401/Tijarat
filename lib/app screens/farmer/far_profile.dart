import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/navbar/far_navbar.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/widgets/appbar/far_app_bar.dart';
import 'package:tijarat/widgets/text_widget.dart';

import '../../services/sp_services.dart';

class FarmerProfile extends StatefulWidget {
  const FarmerProfile({Key? key}) : super(key: key);

  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.customWhite,
        appBar: farmerAppBar(context, "Profile"),
        body: Padding(
          padding: EdgeInsets.all(15.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 80.r,
                    backgroundColor: AppColors.customGrey2,
                    child: Image.asset("assets/formField/user.png"),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                text(
                  "Username",
                  28.sp,
                  AppColors.customBlack,
                  bold: true,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    "Personal Information",
                    22.sp,
                    AppColors.customBlack,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                profileText("assets/formField/user.png", "Name", ""),
                profileText("assets/formField/user.png", "Address", ""),
                profileText("assets/formField/mail.png", "Email", ""),
                profileText("assets/formField/user.png", "Phone Number", ""),
                profileText("assets/formField/user.png", "User name", ""),
                profileText("assets/formField/user.png", "Created On", ""),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    "Password",
                    22.sp,
                    AppColors.customBlack,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                profileText(
                  "assets/formField/lock.png",
                  "Change Password",
                  "",
                  nextIcon: true,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    "Other",
                    22.sp,
                    AppColors.customBlack,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    SpServices.saveUserLoggedIn(false);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FarmerNavBar(),
                      ),
                    );
                  },
                  child: profileText(
                    "assets/formField/user.png",
                    "Logout",
                    "",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget profileText(icon, title, data, {nextIcon = false}) {
  return Container(
    width: 510.w,
    height: 65.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(
        color: const Color(0xffB7B7B7),
      ),
      color: AppColors.customWhite,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Image.asset(
                icon,
                width: 34.w,
                height: 34.h,
                color: AppColors.buttonGreen,
              ),
            ),
            text(
              title,
              22.sp,
              AppColors.customBlack,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: nextIcon == false
              ? text(
                  data,
                  18.sp,
                  AppColors.customBlack,
                )
              : Icon(
                  CupertinoIcons.right_chevron,
                  color: AppColors.buttonGreen,
                  size: 36.r,
                ),
        ),
      ],
    ),
  );
}
