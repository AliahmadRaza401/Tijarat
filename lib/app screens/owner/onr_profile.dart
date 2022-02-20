// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/navbar/onr_navbar.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/app_routes.dart';
import 'package:tijarat/widgets/appbar/onr_app_bar.dart';

import '../../utils/app_color.dart';
import '../../widgets/text_widget.dart';
import '../farmer/far_profile.dart';

class OwnerProfile extends StatefulWidget {
  const OwnerProfile({Key? key}) : super(key: key);

  @override
  _OwnerProfileState createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.customWhite,
        appBar: ownerAppBar(),
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
                  context,
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
                    context,
                    "Personal Information",
                    22.sp,
                    AppColors.customBlack,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                profileText(context, "assets/formField/user.png", "Name", ""),
                profileText(
                    context, "assets/formField/user.png", "Address", ""),
                profileText(context, "assets/formField/mail.png", "Email", ""),
                profileText(
                    context, "assets/formField/user.png", "Phone Number", ""),
                profileText(
                    context, "assets/formField/user.png", "User name", ""),
                profileText(
                    context, "assets/formField/user.png", "Created On", ""),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    context,
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
                  context,
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
                    context,
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
                      AppRoutes.pushAndRemoveUntil(context, OwnerNavBar());
                    },
                    child: profileText(
                        context, "assets/formField/user.png", "Logout", "")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
