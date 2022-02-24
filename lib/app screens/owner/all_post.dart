// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:tijarat/api/api.dart';
import 'package:tijarat/model/allpostList.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';
import '../../utils/app_color.dart';
import '../../widgets/appbar/onr_app_bar.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/underconstruction.dart';

class AllPostsScreen extends StatefulWidget {
  const AllPostsScreen({Key? key}) : super(key: key);

  @override
  _AllPostsScreenState createState() => _AllPostsScreenState();
}

class _AllPostsScreenState extends State<AllPostsScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: ownerAppBar(context),
        body: Container(
            // color: Colors.blue,
            height: CustomSizes().dynamicHeight(context, 1),
            child: loading
                ? Center(
                    child: Lottie.asset(
                    'assets/json/Loading 2.json',
                    width: CustomSizes().dynamicWidth(context, 0.5),
                  ))
                : Container(
                    // color: Colors.amber,
                    width: CustomSizes().dynamicWidth(context, 1),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                width: 24.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: AppColors.darkGreen,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              SizedBox(
                                width: 12.h,
                              ),
                              text(
                                context,
                                "All Post",
                                30.sp,
                                AppColors.darkGreen,
                                bold: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: CustomSizes().dynamicHeight(context, .73),
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
                                          DateFormat('dd-MM-yyyy hh:mm a')
                                              .format(p);
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
                    ))),
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
