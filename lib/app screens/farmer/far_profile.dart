import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/widgets/appbar/far_app_bar.dart';
import 'package:tijarat/widgets/text_widget.dart';

class FarmerProfile extends StatefulWidget {
  const FarmerProfile({Key? key}) : super(key: key);

  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: farmerAppBar(context, "Profile"),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}

Widget profileText(context, icon, title, data) {
  return Container(
    width: 510.w,
    height: 65.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      color: AppColors.customWhite,
    ),
    child: Row(
      children: [
        Image.asset(
          icon,
          width: 34.w,
          height: 34.h,
        ),
        text(
          context,
          title,
          22.sp,
          AppColors.customBlack,
        ),
        text(
          context,
          data,
          18.sp,
          AppColors.customBlack,
        ),
      ],
    ),
  );
}
