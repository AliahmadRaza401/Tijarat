import 'package:flutter/material.dart';
import 'package:tijarat/utils/app_color.dart';

class FarmerPost extends StatefulWidget {
  FarmerPost({Key? key}) : super(key: key);

  @override
  State<FarmerPost> createState() => _FarmerPostState();
}

class _FarmerPostState extends State<FarmerPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.greenGradient,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
