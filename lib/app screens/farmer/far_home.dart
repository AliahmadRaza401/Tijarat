import 'package:flutter/material.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/widgets/text_widget.dart';

class FarHome extends StatefulWidget {
  const FarHome({Key? key}) : super(key: key);

  @override
  _FarHomeState createState() => _FarHomeState();
}

class _FarHomeState extends State<FarHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: text(context, "FarHome", .04, AppColors.customBlack),
      ),
    );
  }
}
