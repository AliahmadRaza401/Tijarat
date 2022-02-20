import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:tijarat/app%20screens/authentication/login.dart';
import 'package:tijarat/app%20screens/owner/onr_home.dart';
import 'package:tijarat/app%20screens/owner/onr_orders.dart';
import 'package:tijarat/utils/app_color.dart';

import '../app screens/owner/onr_notification.dart';
import '../app screens/owner/onr_profile.dart';
import '../services/sp_services.dart';

class OwnerNavBar extends StatefulWidget {
  const OwnerNavBar({Key? key}) : super(key: key);

  @override
  _OwnerNavBarState createState() => _OwnerNavBarState();
}

class _OwnerNavBarState extends State<OwnerNavBar>
    with TickerProviderStateMixin {
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
    print('isUserLoggedIn: $isUserLoggedIn');
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const OwnerHome(),
      const OwnerOrders(),
      const OwnerNotification(),
      isUserLoggedIn ? const OwnerProfile() : const Login(),

      // const OwnerProfile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.home,
          size: 40.r,
        ),
        title: ("Home"),
        activeColorPrimary: AppColors.buttonGreen,
        inactiveColorPrimary: AppColors.customGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.cart,
          size: 40.r,
        ),
        title: ("Orders"),
        activeColorPrimary: AppColors.buttonGreen,
        inactiveColorPrimary: AppColors.customGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.bell,
          size: 40.r,
        ),
        title: ("Notifications"),
        activeColorPrimary: AppColors.buttonGreen,
        inactiveColorPrimary: AppColors.customGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.person_crop_circle,
          size: 40.r,
        ),
        title: ("Profile"),
        activeColorPrimary: AppColors.buttonGreen,
        inactiveColorPrimary: AppColors.customGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.customWhite,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
