import 'package:flutter/material.dart';
import 'package:tijarat/utils/constants.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';

import '../utils/app_color.dart';

Widget inputTextField(context, label, myController,
    {function, function2, password = false, icon}) {
  return ClipRRect(
    borderRadius:
        BorderRadius.circular(CustomSizes().dynamicWidth(context, 0.04)),
    child: Container(
      color: AppColors.customGrey.withOpacity(0.1),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (function == "")
            ? () {
                return null;
              }
            : function,
        controller: myController,
        textInputAction: TextInputAction.next,
        keyboardType: password == true
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        obscureText: password == true ? obscureText : false,
        cursorColor: AppColors.customBlack,
        cursorWidth: 2.0,
        cursorHeight: CustomSizes().dynamicHeight(context, .03),
        style: TextStyle(
          color: AppColors.customBlack,
          fontSize: CustomSizes().dynamicWidth(context, .04),
        ),
        decoration: InputDecoration(
          hintText: "Type Something",
          suffixIcon: Icon(
            icon,
            color: AppColors.customGrey.withOpacity(0.4),
          ),
          hintStyle: const TextStyle(color: AppColors.customWhite),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.noColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.noColor),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.customBlack),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: CustomSizes().dynamicWidth(context, .05),
          ),
        ),
      ),
    ),
  );
}
