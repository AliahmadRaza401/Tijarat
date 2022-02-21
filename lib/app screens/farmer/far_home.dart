// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/navbar/onr_navbar.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';
import 'package:tijarat/widgets/appbar/far_app_bar.dart';
import 'package:tijarat/widgets/form_fields.dart';
import 'package:tijarat/widgets/text_widget.dart';

import '../../navbar/far_navbar.dart';

class FarmerHome extends StatefulWidget {
  const FarmerHome({Key? key}) : super(key: key);

  @override
  _FarmerHomeState createState() => _FarmerHomeState();
}

class _FarmerHomeState extends State<FarmerHome> {
  final searchQuery = TextEditingController();
  var userName = 'farmer';
  var isOwner = false;
  bool isSwitched = false;

  var AppRoutes;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var name = await SpServices.getUserName();
    var owner = await SpServices.getownerLoggedIn();

    setState(() {
      userName = name;
      isOwner = owner;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: farmerAppBar(context, "Home"),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  isOwner ? farmerModeChange(context) : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/fruits.png',
                        width: 345.w,
                        height: 170.h,
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: text(
                      context,
                      "Hi, $userName",
                      28.sp,
                      AppColors.darkGreen,
                      bold: true,
                    ),
                  ),
                  text(
                    context,
                    "You can sell your fields by selecting the factory which gives you the best price",
                    20.sp,
                    AppColors.darkGreen,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  inputTextField1(
                    context,
                    "Search products and factories",
                    searchQuery,
                    icon: "assets/formField/search.png",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 510.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.darkGreen,
                          AppColors.lightGreen,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              context,
                              "Agri Commodities",
                              28.sp,
                              AppColors.customWhite,
                              bold: true,
                            ),
                            text(
                              context,
                              "Lorem ipsum lorem",
                              22.sp,
                              AppColors.customWhite,
                            ),
                            Container(
                              width: 160.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: AppColors.customWhite,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  text(
                                    context,
                                    "Select",
                                    20.sp,
                                    AppColors.darkGreen,
                                    bold: true,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: AppColors.darkGreen,
                                    size: 26.r,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          "assets/grains.png",
                          width: 190.w,
                          height: 140.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 500.w,
                    height: 330.r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 245.w,
                          height: 330.h,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.darkGreen,
                                AppColors.lightGreen,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          padding: EdgeInsets.all(12.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/vagetable.png",
                                    width: 200.w,
                                    height: 160.h,
                                  ),
                                ],
                              ),
                              text(
                                context,
                                "Fine Products",
                                28.sp,
                                AppColors.customWhite,
                                bold: true,
                              ),
                              text(
                                context,
                                "Lorem ipsum lorem",
                                22.sp,
                                AppColors.customWhite,
                              ),
                              Container(
                                width: 160.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: AppColors.customWhite,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    text(
                                      context,
                                      "Select",
                                      20.sp,
                                      AppColors.darkGreen,
                                      bold: true,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: AppColors.darkGreen,
                                      size: 26.r,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 245.w,
                              height: 170.h,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.darkGreen,
                                    AppColors.lightGreen,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      text(
                                        context,
                                        "Fruits",
                                        28.sp,
                                        AppColors.customWhite,
                                        bold: true,
                                      ),
                                      Image.asset(
                                        "assets/fruits.png",
                                        width: 120.w,
                                        height: 100.h,
                                      ),
                                    ],
                                  ),
                                  text(
                                    context,
                                    "Lorem ipsum lorem",
                                    22.sp,
                                    AppColors.customWhite,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 245.w,
                              height: 140.h,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.darkGreen,
                                    AppColors.lightGreen,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      text(
                                        context,
                                        "Spices\n& Pulses",
                                        28.sp,
                                        AppColors.customWhite,
                                        bold: true,
                                      ),
                                      Image.asset(
                                        "assets/spices.png",
                                        width: 100.w,
                                        height: 70.h,
                                      ),
                                    ],
                                  ),
                                  text(
                                    context,
                                    "Lorem ipsum lorem",
                                    22.sp,
                                    AppColors.customWhite,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  farmerModeChange(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Farmer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          SizedBox(
            width: 10,
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OwnerNavBar()));
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: AppColors.darkGreen,
            activeColor: Colors.blue,
            inactiveTrackColor: AppColors.lightGreen,
            inactiveThumbColor: AppColors.customGrey,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Owner',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ],
      ),
    );
  }
}
