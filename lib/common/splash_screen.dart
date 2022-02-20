// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tijarat/app%20screens/farmer/far_home.dart';
import 'package:tijarat/common/onBoarding_screen.dart';
import 'package:tijarat/navbar/far_navbar.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';

import '../services/sp_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      checkUSer();
    });
    super.initState();
  }

  checkUSer() async {
    bool isUserFirstTime = true;
    isUserFirstTime = await SpServices.getUserFirstTime();
    print('isUserFirstTime: $isUserFirstTime');
    if (isUserFirstTime == false) {
      AppRoutes.push(context, FarmerNavBar());
    } else {
      AppRoutes.push(context, OnBoardingPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('assets/logo.png'),
                      height: 100,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Row(
                  children: [
                    Text(
                      "Copyright © 2022 ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Tijarat",
                        style: TextStyle(
                          fontFamily: 'Qwigley',
                          fontSize: 22,
                          color: AppColors.darkGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
