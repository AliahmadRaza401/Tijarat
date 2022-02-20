import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:tijarat/app%20screens/authentication/signup.dart';
import 'package:tijarat/providers/auth_provider.dart';
import 'package:tijarat/services/auth_services.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';
import 'package:tijarat/widgets/buttons.dart';
import 'package:tijarat/widgets/form_fields.dart';
import 'package:tijarat/widgets/text_widget.dart';

import '../../utils/app_routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AuthServices _authServices;
  late AuthProvider _authProvider;
  bool remember = false;

  @override
  void initState() {
    super.initState();
    _authServices = AuthServices();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    bool _loading = Provider.of<AuthProvider>(context).loading;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const SizedBox(),
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
            CustomSizes().dynamicHeight(context, .01),
          ),
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/bg-1.png",
                    height: 750.h,
                    width: 500.w,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: CustomSizes().dynamicHeight(context, .02),
                    ),
                    child: SizedBox(
                      height: 520.h,
                      width: 480.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "assets/logo.png",
                              height: 157.h,
                              width: 423.w,
                            ),
                          ),
                          text(
                            context,
                            "Welcome",
                            36.sp,
                            AppColors.customBlack,
                            bold: true,
                          ),
                          richTextWidget(
                            context,
                            "By logging in you are agreeing\nour",
                            " Term and privacy policy",
                            20.sp,
                            20.sp,
                            "",
                            AppColors.customBlack,
                            AppColors.buttonGreen,
                            "",
                          ),
                          inputTextField(
                            context,
                            "Email Address",
                            email,
                            icon: "assets/formField/mail.png",
                            keyboardType: TextInputType.emailAddress,
                            function: (value) {
                              if (EmailValidator.validate(value)) {
                              } else {
                                return "Enter Valid Email";
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
                              if (value!.isEmpty) {
                                return "Password can't be empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            width: 430.w,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Coming Soon..."),
                                  ));
                                  // MotionToast.info(
                                  //   description: const Text("Coming Soon..."),
                                  // ).show(context);
                                },
                                child: text(
                                  context,
                                  "Forgot Password",
                                  18.sp,
                                  AppColors.buttonGreen,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/bg-2.png",
                    height: 570.h,
                    width: 500.w,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: CustomSizes().dynamicHeight(context, .04),
                    ),
                    child: SizedBox(
                      width: 470.w,
                      height: 320.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          coloredButton(
                            context,
                            "Login",
                            AppColors.lightGreen,
                            function: () async {
                              if (!_formKey.currentState!.validate()) {
                                MotionToast.error(
                                  description: const Text("Fill all Fields!!!"),
                                ).show(context);
                                return;
                              }
                              _authProvider.setLoading(true);
                              var loginCheck = await _authServices.signIn(
                                email: email.text,
                                password: password.text,
                                context: context,
                              );
                            },
                          ),
                          coloredButton(
                            context,
                            "Sign up",
                            AppColors.noColor,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: text(
                                              context,
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
                          text(
                            context,
                            "or connect with",
                            20.sp,
                            AppColors.customBlack.withOpacity(.8),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              socialAvatar(
                                  context, "assets/fb.png", 0xff3B5998),
                              CustomSizes().widthBox(context, .04),
                              socialAvatar(
                                  context, "assets/google.png", 0xfff0f0f0),
                            ],
                          ),
                        ],
                      ),
                    ),
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

Widget socialAvatar(context, icon, color) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Coming Soon..."),
      ));
      // EasyLoading.showInfo("Coming Soon...");
      // MotionToast.info(
      //   description: const Text("Coming Soon..."),
      //   onClose: (){
      //     AppRoutes.pop(context);
      //   },
      // ).show(context);
    },
    child: CircleAvatar(
      radius: 30.r,
      backgroundColor: Color(color),
      child: Center(
        child: Image.asset(
          icon,
          width: 40.w,
          height: 40.h,
        ),
      ),
    ),
  );
}

Widget signUpChoice(context, title) {
  return InkWell(
    onTap: () {
      AppRoutes.push(
        context,
        Signup(
          userType: title,
        ),
      );
      // AppRoutes().pop(context);
    },
    child: Container(
      width: 210.w,
      height: 280.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.customWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 210.w,
            height: 210.h,
            child: Center(
              child: title == "owner"
                  ? Image.asset("assets/gif/Signup as Owner.gif")
                  : Image.asset("assets/gif/Signup as farmer.gif"),
            ),
          ),
          Container(
            width: 210.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.darkGreen,
                  AppColors.lightGreen,
                ],
              ),
            ),
            child: title == "owner"
                ? Center(
                    child: text(
                      context,
                      "As Factory\nOwner",
                      24.sp,
                      AppColors.customWhite,
                      bold: true,
                      alignText: TextAlign.center,
                    ),
                  )
                : Center(
                    child: text(
                      context,
                      "As Farmer",
                      24.sp,
                      AppColors.customWhite,
                      bold: true,
                    ),
                  ),
          ),
        ],
      ),
    ),
  );
}
