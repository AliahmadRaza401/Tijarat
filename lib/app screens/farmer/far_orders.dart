import 'package:flutter/material.dart';

import '../../widgets/underconstruction.dart';

class FarmerOrders extends StatefulWidget {
  const FarmerOrders({Key? key}) : super(key: key);

  @override
  _FarmerOrdersState createState() => _FarmerOrdersState();
}

class _FarmerOrdersState extends State<FarmerOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: underConstruction(context),
    );
  }
}
