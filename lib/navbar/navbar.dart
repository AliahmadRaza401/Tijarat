// import 'package:flutter/material.dart';
//
// class NavBar extends StatefulWidget {
//   const NavBar({Key? key}) : super(key: key);
//
//   @override
//   _NavBarState createState() => _NavBarState();
// }
//
// class _NavBarState extends State<NavBar> {
//   int currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:  myWhite,
//       body: Center(
//         child: _getPage(currentPage),
//       ),
//       bottomNavigationBar: SalomonBottomBar(
//         currentIndex: currentPage,
//         onTap: (i) => setState(() => currentPage = i),
//         items: [
//           SalomonBottomBarItem(
//             icon: const Icon(Icons.home),
//             title: Text(
//               "Home",
//               style: TextStyle(
//                 fontSize: dynamicWidth(context, .036),
//               ),
//             ),
//             selectedColor: myGreen,
//           ),
//           SalomonBottomBarItem(
//             icon: const Icon(Icons.supervised_user_circle_rounded),
//             title: Text(
//               "Farmers",
//               style: TextStyle(
//                 fontSize: dynamicWidth(context, .036),
//               ),
//             ),
//             selectedColor: myGreen,
//           ),
//           SalomonBottomBarItem(
//             icon: const Icon(Icons.calendar_today),
//             title: Text(
//               "Updates",
//               style: TextStyle(
//                 fontSize: dynamicWidth(context, .036),
//               ),
//             ),
//             selectedColor: myGreen,
//           ),
//           SalomonBottomBarItem(
//             icon: const Icon(Icons.notifications),
//             title: Text(
//               "Requests",
//               style: TextStyle(
//                 fontSize: dynamicWidth(context, .036),
//               ),
//             ),
//             selectedColor: myGreen,
//           ),
//           SalomonBottomBarItem(
//             icon: const Icon(Icons.person),
//             title: Text(
//               "Profile",
//               style: TextStyle(
//                 fontSize: dynamicWidth(context, .036),
//               ),
//             ),
//             selectedColor: myGreen,
//           ),
//         ],
//       ),
//     );
//   }
//
//   _getPage(int page) {
//     switch (page) {
//       case 0:
//         return const Home();
//       // case 1:
//       //   return const Farmers();
//       // case 2:
//       //   return const DailyUpdates();
//       // case 3:
//       //   return const NotificationPage();
//       // case 4:
//       //   return const Profile();
//       default:
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: const <Widget>[
//             Text(
//               ('TabBar Index Error'),
//             ),
//           ],
//         );
//     }
//   }
// }
