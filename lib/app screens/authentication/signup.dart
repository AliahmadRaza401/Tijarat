import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_color.dart';
import '../../utils/dynamic_sizes.dart';
import '../../widgets/buttons.dart';
import '../../widgets/form_fields.dart';
import '../../widgets/text_widget.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final fName = TextEditingController();
  final number = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 1),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.darkGreen,
                AppColors.lightGreen,
              ],
            ),
          ),
          padding: EdgeInsets.all(
            CustomSizes().dynamicHeight(context, .014),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 500.w,
                height: 180.h,
                decoration: BoxDecoration(
                  color: AppColors.customWhite,
                  borderRadius: BorderRadius.circular(
                    39.r,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/logo.png",
                    height: 115.h,
                  ),
                ),
              ),
              Container(
                width: 500.w,
                height: 900.h,
                decoration: BoxDecoration(
                  color: AppColors.customWhite,
                  borderRadius: BorderRadius.circular(
                    39.r,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: CustomSizes().dynamicHeight(context, .03),
                  horizontal: CustomSizes().dynamicWidth(context, .06),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    text(
                      context,
                      "Signup",
                      36.sp,
                      AppColors.customBlack,
                      bold: true,
                    ),
                    richTextWidget(
                      context,
                      "By signing in you are agreeing\nour",
                      "Term and privacy policy",
                      20.sp,
                      20.sp,
                      "",
                      AppColors.customBlack,
                      AppColors.buttonGreen,
                      "",
                    ),
                    text(
                      context,
                      "By signing in you are agreeing our Term and privacy policy",
                      20.sp,
                      AppColors.customBlack,
                    ),
                    inputTextField(
                      context,
                      "Full Name",
                      fName,
                      icon: "assets/formField/user.png",
                      keyboardType: TextInputType.name,
                      function: (value) {
                        if (value!.isEmpty) {
                          return "Name can't be empty";
                        }
                        return null;
                      },
                    ),
                    // inputTextField(
                    //   context,
                    //   "Number",
                    //   number,
                    //   icon: "assets/formField/home.png",
                    //   keyboardType: TextInputType.number,
                    //   function: (value) {
                    //     if (value!.isEmpty || value.toString().length < ) {
                    //       return "Number is not valid";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    inputTextField(
                      context,
                      "Email Address",
                      email,
                      icon: "assets/formField/mail.png",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    inputTextField(
                      context,
                      "Address",
                      address,
                      icon: "assets/formField/home.png",
                      keyboardType: TextInputType.text,
                      function: (value) {
                        if (value!.isEmpty) {
                          return "Address can't be empty";
                        }
                        return null;
                      },
                    ),
                    inputTextField(
                      context,
                      "Password",
                      password,
                      icon: "assets/formField/lock.png",
                      keyboardType: TextInputType.visiblePassword,
                      function: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'Password must have 8 characters';
                        }
                        return null;
                      },
                    ),
                    inputTextField(
                      context,
                      "Confirm Password",
                      cPassword,
                      icon: "assets/formField/lock.png",
                      keyboardType: TextInputType.visiblePassword,
                      function: (value) {
                        if (password.text.toString() == value.toString()) {
                          return 'Password must be same';
                        }
                        return null;
                      },
                    ),
                    coloredButton(
                      context,
                      "Signup",
                      AppColors.lightGreen,
                      width: CustomSizes().dynamicWidth(context, .6),
                      function: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
