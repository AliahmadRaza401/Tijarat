import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/underconstruction.dart';

class OwnerNotification extends StatefulWidget {
  const OwnerNotification({Key? key}) : super(key: key);

  @override
  _OwnerNotificationState createState() => _OwnerNotificationState();
}

class _OwnerNotificationState extends State<OwnerNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
          
            underConstruction(context),
          ],
        ),
      ),
    );
  }
}
