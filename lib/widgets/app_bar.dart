import 'package:flutter/material.dart';
import 'package:tijarat/utils/config.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';
import 'package:tijarat/widgets/text_widget.dart';

appBar(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(
        Icons.notes_outlined,
        size: CustomSizes().dynamicWidth(context, 0.1),
      ),
      text(
        context,
        "BuildYourCake",
        0.06,
        CustomColors.customBlack,
        font: true,
      ),
    ],
  );
}
