// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tijarat/common/onBoarding_screen.dart';
import 'package:tijarat/navbar/far_navbar.dart';
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
    if (isUserFirstTime) {
      AppRoutes.push(context, OnBoardingPage());
    } else {
      AppRoutes.push(context, FarmerNavBar());
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 47, 240, 40),
                            ),
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10.0,
                              color: Color.fromARGB(255, 61, 58, 58),
                            ),
                          ],
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
