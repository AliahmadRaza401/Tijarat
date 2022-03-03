import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/app%20screens/authentication/login.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';
import 'package:tijarat/widgets/appbar/far_app_bar.dart';
import 'package:tijarat/widgets/buttons.dart';
import 'package:tijarat/widgets/text_widget.dart';

import '../../utils/dynamic_sizes.dart';

class LoginCheck extends StatefulWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  _LoginCheckState createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: farmerAppBar(context, "TIJARAT"),
        body: Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: text(
                  "You’re not signed in",
                  36.sp,
                  AppColors.customBlack,
                  bold: true,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: text(
                  "It seems like you’re not signed in!\nSign in/Login now to continue",
                  20.sp,
                  AppColors.customBlack,
                  alignText: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/not_signin.png",
                  width: 500.w,
                  height: 300.h,
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: coloredButton(
                  context,
                  "Login",
                  AppColors.customWhite,
                  width: 480.w,
                  height: 70.h,
                  function: () {
                    AppRoutes.push(context, const Login());
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: coloredButton(
                  context,
                  "Create new account",
                  AppColors.noColor,
                  width: 480.w,
                  height: 70.h,
                  function: () {
                    showDialog(
                      barrierDismissible: true,
                      useSafeArea: true,
                      context: context,
                      barrierColor: Colors.white60,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              39.r,
                            ),
                          ),
                          backgroundColor: AppColors.customWhite,
                          insetPadding: EdgeInsets.all(
                            CustomSizes().dynamicWidth(context, 0.04),
                          ),
                          child: Container(
                            width: 500.w,
                            height: 480.h,
                            color: AppColors.noColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: text(
                                    "Sign Up",
                                    36.sp,
                                    AppColors.customBlack,
                                    bold: true,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    signUpChoice(context, "farmer"),
                                    signUpChoice(context, "owner"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
