import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';

import '../../utils/app_routes.dart';
import '../../widgets/text_widget.dart';

class FarmerFactoryList extends StatefulWidget {
  final String title, image;

  const FarmerFactoryList({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  _FarmerFactoryListState createState() => _FarmerFactoryListState();
}

class _FarmerFactoryListState extends State<FarmerFactoryList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.customWhite,
        body: SafeArea(
          child: SizedBox(
            width: CustomSizes().dynamicWidth(context, 1),
            height: CustomSizes().dynamicHeight(context, 1),
            child: Stack(
              children: [
                Positioned(
                  top: 0.0,
                  child: SizedBox(
                    width: 540.w,
                    height: 360.h,
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10.h,
                  child: GestureDetector(
                    onTap: () {
                      AppRoutes.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 42.w,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: text(
                      widget.title,
                      36.sp,
                      Colors.white,
                      bold: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: CustomSizes().dynamicWidth(context, 1),
                    height: 880.h,
                    decoration: BoxDecoration(
                      gradient: AppColors.greenGradient,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60.r),
                        topRight: Radius.circular(60.r),
                      ),
                      border: Border.all(
                        color: AppColors.lightGreen,
                        width: 3.0,
                      ),
                    ),
                    padding: EdgeInsets.all(14.r),
                    child: Column(
                      children: [
                        text(
                          "Rs. 90 - 100",
                          26.sp,
                          AppColors.customWhite,
                          bold: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 26.h,
                            bottom: 40.h,
                          ),
                          child: SizedBox(
                            height: 38.h,
                            child: TabBar(
                              indicator: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: AppColors.customWhite,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              labelColor: AppColors.customWhite,
                              labelStyle: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              tabs: const [
                                Tab(
                                  text: "Today’s Rates",
                                ),
                                Tab(
                                  text: "Past Rates",
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: CustomSizes().dynamicWidth(context, 1),
                          height: 700.h,
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    factoryTRateCard(
                                      "Factory 1",
                                      "100/Kg",
                                      "Free Pickup",
                                      "assets/png/fac.png",
                                    ),
                                    factoryTRateCard(
                                      "Factory 2",
                                      "90/Kg",
                                      "Pickup Charges",
                                      "assets/png/fac.png",
                                    ),
                                    factoryTRateCard(
                                      "Factory 3",
                                      "120/Kg",
                                      "Free Pickup",
                                      "assets/png/fac.png",
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    factoryTRateCard(
                                      "Factory 1",
                                      "105/Kg",
                                      "Free Pickup",
                                      "assets/png/fac.png",
                                    ),
                                    factoryTRateCard(
                                      "Factory 2",
                                      "85/Kg",
                                      "Pickup Charges",
                                      "assets/png/fac.png",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

Widget factoryTRateCard(factoryName, rate, pickup, image) {
  return Container(
    width: 512.w,
    height: 140.h,
    decoration: BoxDecoration(
      color: AppColors.customWhite,
      borderRadius: BorderRadius.circular(23.r),
    ),
    padding: EdgeInsets.all(10.r),
    margin: EdgeInsets.symmetric(
      vertical: 13.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(
              factoryName,
              36.sp,
              AppColors.darkGreen,
            ),
            text(
              rate,
              22.sp,
              AppColors.darkGreen,
            ),
            SizedBox(
              width: 220.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text(
                    pickup,
                    22.sp,
                    AppColors.darkGreen,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 30.r,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: 236.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(7.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: AppColors.customYellow,
                size: 20.r,
              ),
              Icon(
                Icons.star,
                color: AppColors.customYellow,
                size: 20.r,
              ),
              Icon(
                Icons.star,
                color: AppColors.customYellow,
                size: 20.r,
              ),
              Icon(
                Icons.star,
                color: AppColors.customYellow,
                size: 20.r,
              ),
              Icon(
                Icons.star_border_rounded,
                color: AppColors.customYellow,
                size: 20.r,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
