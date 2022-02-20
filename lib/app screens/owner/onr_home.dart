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
                height: 600.h,
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
