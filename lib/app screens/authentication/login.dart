import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tijarat/app%20screens/authentication/signup.dart';
import 'package:tijarat/providers/auth_provider.dart';
import 'package:tijarat/services/auth_services.dart';
import 'package:tijarat/utils/app_routes.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';
import 'package:tijarat/widgets/buttons.dart';
import 'package:tijarat/widgets/form_fields.dart';
import 'package:tijarat/widgets/text_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  late AuthServices _authServices;
  late AuthProvider _authProvider;
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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/bg-1.png",
                  height: CustomSizes().dynamicHeight(context, .63),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: CustomSizes().dynamicWidth(context, .8),
                  height: CustomSizes().dynamicHeight(context, .46),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          "assets/logo.png",
                          height: CustomSizes().dynamicWidth(context, .26),
                        ),
                      ),
                      text(
                        context,
                        "Welcome",
                        .05,
                        AppColors.customBlack,
                        bold: true,
                      ),
                      text(
                        context,
                        "By logging in you are agreeing\nour Term and privacy policy",
                        .032,
                        AppColors.customBlack,
                      ),
                      inputTextField(
                        context,
                        "Email Address",
                        email,
                        icon: "assets/formField/user.png",
                      ),
                      inputTextField(
                        context,
                        "Password",
                        password,
                        icon: "assets/formField/user.png",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                            context,
                            "Remember Password",
                            .032,
                            AppColors.customBlack,
                          ),
                          text(
                            context,
                            "Forgot Password",
                            .032,
                            AppColors.lightGreen,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/bg-2.png",
                  height: CustomSizes().dynamicHeight(context, .49),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: CustomSizes().dynamicWidth(context, .8),
                  height: CustomSizes().dynamicHeight(context, .28),
                  child: Column(
                    children: [
                      _loading == true
                          ? CircularProgressIndicator()
                          : coloredButton(
                              context,
                              "Login",
                              AppColors.lightGreen,
                              width: CustomSizes().dynamicWidth(context, .6),
                              function: () {
                                print("sdfds");
                                _authProvider.setLoading(true);
                                _authServices.signIn(
                                    email: email.text,
                                    password: password.text,
                                    context: context);
                              },
                            ),
                      coloredButton(
                        context,
                        "Sign up",
                        AppColors.lightGreen,
                        function: () {
                          CustomRoutes().push(context, Signup());
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
    );
  }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
