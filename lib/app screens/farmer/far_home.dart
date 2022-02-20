import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/widgets/appbar/far_app_bar.dart';
import 'package:tijarat/widgets/form_fields.dart';
import 'package:tijarat/widgets/text_widget.dart';

class FarmerHome extends StatefulWidget {
  const FarmerHome({Key? key}) : super(key: key);

  @override
  _FarmerHomeState createState() => _FarmerHomeState();
}

class _FarmerHomeState extends State<FarmerHome> {
  final searchQuery = TextEditingController();

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
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: text(
                    context,
                    "Hi, farmer",
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
                inputTextField(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        "assets/formField/grains.png",
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
                                  "assets/formField/grains.png",
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            width: 240.w,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      "assets/formField/grains.png",
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      "assets/formField/grains.png",
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
          )),
    );
  }
}
