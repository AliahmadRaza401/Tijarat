import 'package:flutter/material.dart';
import 'package:tijarat/utils/config.dart';
import 'package:tijarat/widgets/text_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: text(context, "Home", .04, CustomColors.customBlack),
      ),
    );
  }
}
