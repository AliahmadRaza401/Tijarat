import 'package:flutter/material.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';

import '../utils/app_color.dart';

Widget coloredButton(context, text, color,
    {function = "", width = "", fontSize = 0.04}) {
  return GestureDetector(
    onTap: function == "" ? () {} : function,
    child: Container(
      width: width == "" ? CustomSizes().dynamicWidth(context, 1) : width,
      height: CustomSizes().dynamicWidth(context, .12),
      decoration: color == AppColors.noColor
          ? BoxDecoration(
              color: color,
              border: Border.all(width: 1, color: AppColors.customWhite),
            )
          : BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                CustomSizes().dynamicWidth(
                  context,
                  0.03,
                ),
              ),
            ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.customWhite,
            fontWeight: FontWeight.bold,
            fontSize: CustomSizes().dynamicWidth(context, fontSize),
          ),
        ),
      ),
    ),
  );
}
