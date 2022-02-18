import 'package:flutter/material.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/widgets/text_widget.dart';

//   Note Please  **********************

// har file ko create karta waqat sath reference lazmi lagana han

// farmer ka lea *far*        eg: far_profile.dart / FarProfile
// Factory Owner ka lea *onr*  eg: onr_profile.dart / OnrProfile

class OnrHome extends StatefulWidget {
  const OnrHome({Key? key}) : super(key: key);

  @override
  _OnrHomeState createState() => _OnrHomeState();
}

class _OnrHomeState extends State<OnrHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: text(context, "OnrHome", .04, AppColors.customBlack),
      ),
    );
  }
}
