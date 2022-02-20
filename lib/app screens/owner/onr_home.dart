import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/widgets/appbar/onr_app_bar.dart';
import 'package:tijarat/widgets/text_widget.dart';

class OwnerHome extends StatefulWidget {
  const OwnerHome({Key? key}) : super(key: key);

  @override
  _OwnerHomeState createState() => _OwnerHomeState();
}

class _OwnerHomeState extends State<OwnerHome> {
  String? selectedValue;
  List<String> items = [
    'Last Week',
    'Last 2 Weeks',
    'Last Month',
    'All',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.customWhite,
        appBar: ownerAppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 510.w,
                height: 620.h,
                decoration: BoxDecoration(
                  color: AppColors.lightGreen1,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 24.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: AppColors.darkGreen,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              SizedBox(
                                width: 12.h,
                              ),
                              text(
                                context,
                                "Overview",
                                30.sp,
                                AppColors.buttonGreen,
                                bold: true,
                              ),
                            ],
                          ),
                          CustomDropdownButton2(
                            hint: 'Last Week',
                            value: selectedValue,
                            dropdownItems: items,
                            buttonWidth: 150.w,
                            buttonHeight: 44.h,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 30.r,
                            ),
                            buttonDecoration: BoxDecoration(
                              color: AppColors.noColor,
                              borderRadius: BorderRadius.circular(
                                8.r,
                              ),
                              border: Border.all(
                                color: AppColors.customBlack,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 490.w,
                      height: 240.h,
                      decoration: BoxDecoration(
                        color: AppColors.customWhite,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ownerChoiceCard(
                            context,
                            "orders",
                            "assets/ownerorder.png",
                            "999",
                            "33.2%",
                            Icons.arrow_downward,
                            AppColors.customRed,
                          ),
                          ownerChoiceCard(
                            context,
                            "Income",
                            "assets/ownerincome.png",
                            "350K",
                            "33.2%",
                            Icons.arrow_upward,
                            AppColors.buttonGreen,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 16.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              color: AppColors.darkGreen,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                          ),
                          SizedBox(
                            width: 12.h,
                          ),
                          text(
                            context,
                            "Orders",
                            30.sp,
                            AppColors.buttonGreen,
                            bold: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ownerOrderCard(context, "assets/formField/grains.png",
                              "Wheat (Factory 1)"),
                          ownerOrderCard(context, "assets/formField/grains.png",
                              "Wheat (Factory 1)"),
                          ownerOrderCard(context, "assets/formField/grains.png",
                              "Wheat (Factory 1)"),
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
    );
  }
}

Widget ownerChoiceCard(context, title, image, value, value2, icon, cColor) {
  return Container(
    width: 210.w,
    height: 210.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.r),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.darkGreen,
          AppColors.lightGreen,
        ],
      ),
    ),
    padding: EdgeInsets.all(6.r),
    child: Column(
      children: [
        text(
          context,
          title,
          22.sp,
          AppColors.customWhite,
        ),
        Image.asset(
          image,
          width: 54.w,
          height: 54.h,
        ),
        text(
          context,
          value,
          40.sp,
          AppColors.customWhite,
          bold: true,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 70.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.customWhite,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  size: 20.w,
                  color: cColor,
                ),
                text(
                  context,
                  value2,
                  14.sp,
                  cColor,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget ownerOrderCard(context, image, title) {
  return Container(
    width: 200.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(23.r),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.darkGreen,
          AppColors.lightGreen,
        ],
      ),
    ),
    margin: EdgeInsets.only(right: 16.w),
    child: Column(
      children: [
        Container(
          width: 200.w,
          height: 140.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.r),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 12.h,
          ),
          child: text(
            context,
            title,
            20.sp,
            AppColors.customWhite,
            bold: true,
          ),
        ),
      ],
    ),
  );
}
