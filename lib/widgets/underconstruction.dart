// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';
import 'package:tijarat/widgets/text_widget.dart';

Widget underConstruction(BuildContext context) {
  return Container(
      height: 100,
      color: AppColors.lightGreen1,
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Monthly Covid-19 Infections'),
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
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]));

  // Container(
  //   height: CustomSizes().dynamicHeight(context, 0.8),
  //   child: Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Image.asset(
  //           'assets/image 5415.png',
  //           width: 500.w,
  //           height: 500.h,
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         text(
  //           context,
  //           'This page is under construction',
  //           26.sp,
  //           Colors.black,
  //           bold: FontWeight.bold,
  //         ),
  //         text(
  //           context,
  //           'We are working on it!',
  //           22.sp,
  //           Colors.black,
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}

class _Infections {
  _Infections(this.year, this.victims);

  final String year;
  final double victims;
}
