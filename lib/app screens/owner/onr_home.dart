import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tijarat/app%20screens/owner/create_post/create_post.dart';
import 'package:tijarat/navbar/far_navbar.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';
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
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.customWhite,
        appBar: ownerAppBar(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppRoutes.push(context, CreatePostStepper());
          },
          backgroundColor: AppColors.buttonGreen,
          child: Icon(
            Icons.add,
            color: AppColors.customWhite,
            size: 70.r,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              consumerModeButton(context),
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
                            ownerOrderCard(context, "assets/wheat.png",
                                "Wheat (Factory 1)"),
                            ownerOrderCard(context, "assets/wheat.png",
                                "Wheat (Factory 1)"),
                            ownerOrderCard(context, "assets/wheat.png",
                                "Wheat (Factory 1)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 40.h,
                  horizontal: 30.w,
                ),
                child: Row(
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
                      "Graph",
                      30.sp,
                      AppColors.buttonGreen,
                      bold: true,
                    ),
                  ],
                ),
              ),
              Container(
                height: 400.h,
                width: 510.w,
                decoration: BoxDecoration(
                  color: AppColors.lightGreen1,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Last 7 Days'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_Infections, String>>[
                    LineSeries<_Infections, String>(
                      dataSource: <_Infections>[
                        _Infections('Jan', 35000),
                        _Infections('Feb', 28000),
                        _Infections('Mar', 34000),
                        _Infections('Apr', 32000),
                        _Infections('May', 40000),
                        _Infections('Jun', 60000)
                      ],
                      xValueMapper: (_Infections victims, _) => victims.year,
                      yValueMapper: (_Infections victims, _) => victims.victims,
                      // Enable data label
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  consumerModeButton(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Owner',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          SizedBox(
            width: 10,
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) async {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
              AppRoutes.push(context, FarmerNavBar());
            },
            activeTrackColor: AppColors.darkGreen,
            activeColor: Colors.blue,
            inactiveTrackColor: AppColors.lightGreen,
            inactiveThumbColor: AppColors.customGrey,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Famer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ],
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
    padding: EdgeInsets.all(12.r),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class _Infections {
  _Infections(this.year, this.victims);

  final String year;
  final double victims;
}
