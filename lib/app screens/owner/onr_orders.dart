import 'package:flutter/material.dart';

import '../../widgets/underconstruction.dart';

class OwnerOrders extends StatefulWidget {
  const OwnerOrders({Key? key}) : super(key: key);

  @override
  _OwnerOrdersState createState() => _OwnerOrdersState();
}

class _OwnerOrdersState extends State<OwnerOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: underConstruction(context),
    );
  }
}
