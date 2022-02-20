// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tijarat/app%20screens/farmer/login_check.dart';
import 'package:tijarat/app%20screens/owner/onr_home.dart';
import 'package:tijarat/app%20screens/owner/onr_notification.dart';
import 'package:tijarat/app%20screens/owner/onr_orders.dart';
import 'package:tijarat/services/sp_services.dart';

import '../../utils/app_color.dart';

class OwnerProfile extends StatefulWidget {
  const OwnerProfile({Key? key}) : super(key: key);

  @override
  _OwnerProfileState createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {
  int currentPage = 0;
  bool isUserLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkUSer();
  }

  checkUSer() async {
    var a = await SpServices.getUserLoggedIn();
    setState(() {
      isUserLoggedIn = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customWhite,
      body: Center(
        child: _getPage(currentPage),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentPage,
        onTap: (i) => setState(() => currentPage = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.home),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            selectedColor: AppColors.buttonGreen,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              CupertinoIcons.cart,
            ),
            title: Text(
              "Orders",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            selectedColor: AppColors.buttonGreen,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              CupertinoIcons.bell,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            selectedColor: AppColors.buttonGreen,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              CupertinoIcons.person_crop_circle,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            selectedColor: AppColors.buttonGreen,
          ),
        ],
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return const OwnerHome();
      case 1:
        return const OwnerOrders();
      case 2:
        return const OwnerNotification();
      case 3:
        return isUserLoggedIn ? const OwnerProfile() : const LoginCheck();
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              ('TabBar Index Error'),
            ),
          ],
        );
    }
  }
}
