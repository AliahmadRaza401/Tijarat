import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget text(data, size, color,
    {bold = false, alignText = TextAlign.start, maxLines = 2, font = false}) {
  return Text(
    data,
    textAlign: alignText,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
    ),
  );
}

Widget richTextWidget(
    context, text1, text2, size1, size2, page, color1, color2, push) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: [
        TextSpan(
          text: text1,
          style: TextStyle(
            fontSize: size1,
            color: color1,
          ),
        ),
        page == ""
            ? TextSpan(
          text: text2,
          style: TextStyle(
            fontSize: size2,
            color: color2,
            fontWeight: FontWeight.bold,
          ),
        )
            : TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () => push == true
                ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            )
                : Navigator.pop(context),
          text: text2,
          style: TextStyle(
            fontSize: size2,
            decoration: TextDecoration.underline,
            color: color2,
          ),
        ),
      ],
    ),
  );
}
