import 'package:flutter/material.dart';

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
            CustomSizes().dynamicHeight(context, .012),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, .14),
                decoration: BoxDecoration(
                  color: AppColors.customWhite,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, .05),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/logo.png",
                    height: CustomSizes().dynamicHeight(context, .1),
                  ),
                ),
              ),
              Container(
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, .78),
                decoration: BoxDecoration(
                  color: AppColors.customWhite,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, .05),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: CustomSizes().dynamicHeight(context, .03),
                  horizontal: CustomSizes().dynamicWidth(context, .06)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    text(
                      context,
                      "Signup",
                      .05,
                      AppColors.customBlack,
                      bold: true,
                    ),
                    text(
                      context,
                      "By signing in you are agreeing our Term and privacy policy",
                      .032,
                      AppColors.customBlack,
                    ),
                    inputTextField(
                      context,
                      "Full Name",
                      email,
                      icon: Icons.email_outlined,
                    ),
                    inputTextField(
                      context,
                      "Number",
                      password,
                      icon: Icons.lock_outline_rounded,
                    ),
                    inputTextField(
                      context,
                      "Email Address",
                      email,
                      icon: Icons.email_outlined,
                    ),
                    inputTextField(
                      context,
                      "Address",
                      password,
                      icon: Icons.lock_outline_rounded,
                    ),
                    inputTextField(
                      context,
                      "Password",
                      email,
                      icon: Icons.email_outlined,
                    ),
                    inputTextField(
                      context,
                      "Confirm Password",
                      password,
                      icon: Icons.lock_outline_rounded,
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
