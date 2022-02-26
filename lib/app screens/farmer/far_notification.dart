import 'package:flutter/material.dart';

import '../../widgets/underconstruction.dart';

class FarmerNotification extends StatefulWidget {
  const FarmerNotification({Key? key}) : super(key: key);

  @override
  _FarmerNotificationState createState() => _FarmerNotificationState();
}

class _FarmerNotificationState extends State<FarmerNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(child: UnderConstructionNoTabBar());
  }
}
