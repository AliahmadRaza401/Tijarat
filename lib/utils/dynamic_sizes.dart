import 'package:flutter/material.dart';

class CustomSizes {
  dynamicWidth(BuildContext context, dynamic dynamicSize) {
    return MediaQuery.of(context).size.width * dynamicSize;
  }

  dynamicHeight(BuildContext context, dynamic dynamicSize) {
    return MediaQuery.of(context).size.height * dynamicSize;
  }

  widthBox(BuildContext context, dynamic dynamicSize) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * dynamicSize,
    );
  }

  heightBox(BuildContext context, dynamic dynamicSize) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * dynamicSize,
    );
  }
}
