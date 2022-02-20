import 'package:flutter/material.dart';

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
      child: underConstruction(context),
    );
  }
}
