import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/services/auth_services.dart';
import 'package:tijarat/utils/app_routes.dart';

import '../../utils/app_color.dart';
import '../../utils/dynamic_sizes.dart';
import '../../widgets/buttons.dart';
import '../../widgets/form_fields.dart';
import '../../widgets/text_widget.dart';

class Signup extends StatefulWidget {
  final String userType;

  const Signup({Key? key, required this.userType}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final name = TextEditingController();
  final number = TextEditingController();
  final email = TextEditingController();
  final factoryName = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AuthServices _authServices;

  @override
  void initState() {
    super.initState();
    _authServices = AuthServices();
  }

  @override
  Widget build(BuildContext context) {
    // print('userType: ${widget.userType}');
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
          child: Form(
            key: _formKey,
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
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppRoutes.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.darkGreen,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        text(
                          "Signup",
                          36.sp,
                          AppColors.customBlack,
                          bold: true,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        richTextWidget(
                          context,
                          "By signing in you are agreeing\nour",
                          " Term and privacy policy",
                          20.sp,
                          20.sp,
                          "",
                          AppColors.customBlack,
                          AppColors.buttonGreen,
                          "",
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        inputTextField(
                          context,
                          "Full Name",
                          name,
                          icon: "assets/formField/user.png",
                          keyboardType: TextInputType.name,
                          function: (value) {
                            if (value!.isEmpty) {
                              return "Name can't be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.h,
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
                        SizedBox(
                          height: 30.h,
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
                        SizedBox(
                          height: 30.h,
                        ),
                        inputTextField(
                          context,
                          "Confirm Password",
                          cPassword,
                          icon: "assets/formField/lock.png",
                          keyboardType: TextInputType.visiblePassword,
                          function: (value) {
                            if (password.text.toString() != value.toString()) {
                              return 'Password must be same';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: widget.userType == "owner" ? 30.h : 0,
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
                        widget.userType == "owner"
                            ? inputTextField(
                                context,
                                "Factory name",
                                factoryName,
                                icon: "assets/formField/home.png",
                                keyboardType: TextInputType.text,
                                function: (value) {
                                  if (value!.isEmpty) {
                                    return "Factory Name can't be empty";
                                  }
                                  return null;
                                },
                              )
                            : const SizedBox(
                                height: 0.0,
                              ),
                        SizedBox(
                          height: 50.h,
                        ),
                        coloredButton(
                          context,
                          "Signup",
                          AppColors.lightGreen,
                          width: CustomSizes().dynamicWidth(context, .6),
                          function: () {
                            if (!_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Fill All Fields!!!"),
                              ));

                              return;
                            } else {
                              _authServices.signUp(
                                context: context,
                                name: name.text,
                                email: email.text,
                                password: password.text,
                                cPassword: cPassword.text,
                                factoryName: factoryName.text,
                                factoryImage: 'factoryImage',
                                userTypeFac:
                                    widget.userType == 'owner' ? true : false,
                              );
                            }
                          },
                        ),
                      ],
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
