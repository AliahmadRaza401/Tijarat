import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';
import 'package:tijarat/widgets/text_widget.dart';
import 'package:http/http.dart' as http;

import '../../api/api.dart';
import '../../model/allpostList.dart';
import '../../services/sp_services.dart';
import '../../utils/dynamic_sizes.dart';

class FarmerPost extends StatefulWidget {
  var title;
  var desc;
  var img;
  FarmerPost({
    required this.title,
    required this.desc,
    required this.img,
  });

  @override
  State<FarmerPost> createState() => _FarmerPostState();
}

class _FarmerPostState extends State<FarmerPost> {
  List<GetAllPostModel> allpost = [];
  bool loading = true;

  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };

  Future<List<GetAllPostModel>> getRequest() async {
    print("fetching Post");
    final response =
        await http.get(Uri.parse(API.getPostList), headers: headers);

    var responseData = json.decode(response.body);
    print('responseData: $responseData');
    for (var data in responseData['data']['data']) {
      GetAllPostModel item = GetAllPostModel(
        id: data['id'],
        categoryId: data['category_id'],
        productId: data['product_id'],
        userId: data['user_id'],
        price: data['price'],
        unit: data['unit'],
        image: data['image'],
        description: data['description'],
        address: data['address'],
        specialOffer: data['special_offer'],
        createdAt: DateTime.parse(data['created_at']),
        updatedAt: DateTime.parse(data['updated_at']),
      );

      //Adding user to the list.
      setState(() {
        allpost.add(item);
        loading = false;
      });
    }
    return allpost;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  var token = '';
  getData() async {
    token = await SpServices.getUserToken();
    await getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 312.h,
              decoration: BoxDecoration(
                gradient: AppColors.greenGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100.r),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppRoutes.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 42.w,
                          ),
                        ),
                        text(
                          context,
                          widget.title,
                          36.sp,
                          Colors.white,
                          bold: true,
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 164.w,
                            child:
                                text(context, widget.desc, 22.sp, Colors.white),
                          ),
                          Container(
                            width: 332.w,
                            height: 195.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.img),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(".") /* add child content here */,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: text(
                context,
                "What kind of Grains are you looking to sell?",
                22.sp,
                AppColors.darkGreen,
                bold: true,
              ),
            ),
            loading
                ? Center(child: Lottie.asset('assets/json/Loading 2.json'))
                : Container(
                    height: CustomSizes().dynamicHeight(context, .65),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: allpost.length,
                              itemBuilder: (ctx, index) {
                                DateTime p = DateTime.parse(
                                    allpost[index].createdAt.toString());
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy hh:mm a').format(p);
                                return PostCard(
                                  allpost[index].image,
                                  formattedDate,
                                  allpost[index].description,
                                  allpost[index].productId,
                                  allpost[index].price,
                                  allpost[index].unit,
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget PostCard(img, date, desc, item, rate, unit) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
          width: 518.w,
          height: 527.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 497.w,
                height: 310.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.r),
                    image: img == null
                        ? DecorationImage(
                            image: AssetImage("assets/dami.png"),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: NetworkImage('$img'),
                            fit: BoxFit.cover,
                          )),
                child: Text(".") /* add child content here */,
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                            context,
                            item.toString(),
                            24.sp,
                            AppColors.darkGreen,
                            bold: true,
                          ),
                          text(
                            context,
                            date.toString(),
                            18.sp,
                            AppColors.darkGreen,
                          ),
                        ],
                      ),
                      text(
                        context,
                        desc.toString(),
                        20.sp,
                        AppColors.darkGreen,
                        maxLines: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 10.w,
                            ),
                            width: 320.w,
                            height: 61.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: text(context, item.toString(), 22.sp,
                                AppColors.darkGreen,
                                bold: true),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                              horizontal: 10.w,
                            ),
                            width: 66.w,
                            height: 49.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: text(
                              context,
                              rate.toString(),
                              24.sp,
                              AppColors.darkGreen,
                            ),
                          ),
                          Container(
                            width: 66.w,
                            height: 49.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: text(
                              context,
                              unit.toString(),
                              24.sp,
                              AppColors.darkGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
