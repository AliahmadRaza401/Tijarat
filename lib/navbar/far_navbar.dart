// ignore_for_file: prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:tijarat/app%20screens/farmer/far_home.dart';
import 'package:tijarat/app%20screens/farmer/far_notification.dart';
import 'package:tijarat/app%20screens/farmer/far_orders.dart';
import 'package:tijarat/app%20screens/farmer/far_profile.dart';
import 'package:tijarat/app%20screens/farmer/login_check.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/app_color.dart';

// class FarmerNavBar extends StatefulWidget {
//   @override
//   _FarmerNavBarState createState() => _FarmerNavBarState();
// }

// class _FarmerNavBarState extends State<FarmerNavBar> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

//   bool isUserLoggedIn = false;

//   @override
//   void initState() {
//     super.initState();
//     checkUSer();
//   }

//   checkUSer() async {
//     var a = await SpServices.getUserLoggedIn();
//     setState(() {
//       isUserLoggedIn = a;
//     });
//     print('isUserLoggedIn: $isUserLoggedIn');
//   }

//   final PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);

// //  const page (){
// //         isUserLoggedIn ? const FarmerProfile() : const LoginCheck(),

// // }

// var  _widgetOptions = [
//         const FarmerHome(),
//       const FarmerOrders(),
//       const FarmerNotification(),
//    isUserLoggedIn ? const FarmerProfile() : const LoginCheck(),

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 20,
//         title: const Text('GoogleNavBar'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 20,
//               color: Colors.black.withOpacity(.1),
//             )
//           ],
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//             child: GNav(
//               rippleColor: Colors.green[300]!,
//               hoverColor: Colors.green[100]!,
//               gap: 8,
//               activeColor: AppColors.darkGreen,
//               iconSize: 24,
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               duration: Duration(milliseconds: 400),
//               tabBackgroundColor: Colors.green[100]!,
//               color: Colors.grey,
//               tabs: [
//                 GButton(
//                   icon: CupertinoIcons.home,
//                   text: 'Home',
//                 ),
//                 GButton(
//                   icon: CupertinoIcons.cart,
//                   text: 'Orders',
//                 ),
//                 GButton(
//                   icon: CupertinoIcons.bell,
//                   text: 'Notifications',
//                 ),
//                 GButton(
//                   icon: CupertinoIcons.person_crop_circle,
//                   text: 'Profile',
//                 ),
//               ],
//               selectedIndex: _selectedIndex,
//               onTabChange: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class FarmerNavBar extends StatefulWidget {
  const FarmerNavBar({Key? key}) : super(key: key);

  @override
  _FarmerNavBarState createState() => _FarmerNavBarState();
}

class _FarmerNavBarState extends State<FarmerNavBar>
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
      const FarmerHome(),
      const FarmerOrders(),
      const FarmerNotification(),
      isUserLoggedIn ? const FarmerProfile() : const LoginCheck(),
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
