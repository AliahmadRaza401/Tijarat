import 'package:flutter/material.dart';
import 'package:tijarat/utils/constants.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';

import '../utils/config.dart';

Widget inputTextField(context, label, myController,
    {function, function2, password = false}) {
  return ClipRRect(
    borderRadius:
        BorderRadius.circular(CustomSizes().dynamicWidth(context, 0.04)),
    child: Container(
      color: CustomColors.customGrey.withOpacity(0.7),
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
        cursorColor: CustomColors.customBlack,
        cursorWidth: 2.0,
        cursorHeight: CustomSizes().dynamicHeight(context, .03),
        style: TextStyle(
          color: CustomColors.customBlack,
          fontSize: CustomSizes().dynamicWidth(context, .04),
        ),
        decoration: InputDecoration(
          hintText: "Type Something",
          hintStyle: const TextStyle(color: CustomColors.customWhite),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.noColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.noColor),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.customBlack),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: CustomSizes().dynamicWidth(context, .05),
          ),
        ),
      ),
    ),
  );
}
