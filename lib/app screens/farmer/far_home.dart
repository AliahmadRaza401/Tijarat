// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tijarat/app%20screens/farmer/far_post.dart';
import 'package:tijarat/navbar/onr_navbar.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';
import 'package:tijarat/widgets/appbar/far_app_bar.dart';
import 'package:tijarat/widgets/form_fields.dart';
import 'package:tijarat/widgets/text_widget.dart';
import 'package:http/http.dart' as http;

import '../../api/api.dart';
import '../../model/allpostList.dart';
import '../../widgets/appbar/onr_app_bar.dart';

class FarmerHome extends StatefulWidget {
  const FarmerHome({Key? key}) : super(key: key);

  @override
  _FarmerHomeState createState() => _FarmerHomeState();
}

class _FarmerHomeState extends State<FarmerHome> {
  final searchQuery = TextEditingController();
  var userName = 'farmer';
  var isOwner = false;
  bool isSwitched = false;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
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

  var token = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var name = await SpServices.getUserName();
    var owner = await SpServices.getownerLoggedIn();
    token = await SpServices.getUserToken();
    await getRequest();

    setState(() {
      userName = name;
      isOwner = owner;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: ownerAppBar(context, false),
          appBar: farmerAppBar(context, "Home"),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  loading
                      ? SizedBox()
                      : CarouselSlider(
                          options: CarouselOptions(
                            height: 236.h,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.98,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 4),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: [
                            sliderContainr(
                              "assets/vagetable.png",
                              allpost[0].createdAt.toString(),
                              34,
                              "KG",
                              "F NAme",
                            ),
                          ],
                          //  imgList
                          //     .map(
                          //       (item) => Center(
                          //         child: Image.network(item,
                          //             fit: BoxFit.cover, width: 1000),
                          //       ),
                          //     )
                          //     .toList(),
                        ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: text(
                      context,
                      "Hi, $userName",
                      28.sp,
                      AppColors.darkGreen,
                      bold: true,
                    ),
                  ),
                  text(
                    context,
                    "You can sell your fields by selecting the factory which gives you the best price",
                    20.sp,
                    AppColors.darkGreen,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      isOwner ? farmerModeChange(context) : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 0.h,
                  ),
                  inputTextField1(
                    context,
                    "Search products and factories",
                    searchQuery,
                    icon: "assets/formField/search.png",
                  ),
                  SizedBox(
                    height: 0.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      AppRoutes.push(
                        context,
                        FarmerPost(
                          title: "Agri Commodities",
                          desc: "Lorem ipsum lorem",
                          img: "assets/grains.png",
                        ),
                      );
                    },
                    child: Container(
                      width: 510.w,
                      height: 180.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.darkGreen,
                            AppColors.lightGreen,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                context,
                                "Agri Commodities",
                                28.sp,
                                AppColors.customWhite,
                                bold: true,
                              ),
                              text(
                                context,
                                "Lorem ipsum lorem",
                                22.sp,
                                AppColors.customWhite,
                              ),
                              Container(
                                width: 160.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: AppColors.customWhite,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    text(
                                      context,
                                      "Select",
                                      20.sp,
                                      AppColors.darkGreen,
                                      bold: true,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: AppColors.darkGreen,
                                      size: 26.r,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Image.asset(
                            "assets/grains.png",
                            width: 190.w,
                            height: 140.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 500.w,
                    height: 330.r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppRoutes.push(
                              context,
                              FarmerPost(
                                title: "Fine Products",
                                desc: "Lorem ipsum lorem",
                                img: "assets/vagetable.png",
                              ),
                            );
                          },
                          child: Container(
                            width: 245.w,
                            height: 330.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.darkGreen,
                                  AppColors.lightGreen,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            padding: EdgeInsets.all(12.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/vagetable.png",
                                      width: 200.w,
                                      height: 160.h,
                                    ),
                                  ],
                                ),
                                text(
                                  context,
                                  "Fine Products",
                                  28.sp,
                                  AppColors.customWhite,
                                  bold: true,
                                ),
                                text(
                                  context,
                                  "Lorem ipsum lorem",
                                  22.sp,
                                  AppColors.customWhite,
                                ),
                                Container(
                                  width: 160.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.customWhite,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      text(
                                        context,
                                        "Select",
                                        20.sp,
                                        AppColors.darkGreen,
                                        bold: true,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        color: AppColors.darkGreen,
                                        size: 26.r,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                AppRoutes.push(
                                  context,
                                  FarmerPost(
                                    title: "Fruits",
                                    desc: "Lorem ipsum lorem",
                                    img: "assets/fruits.png",
                                  ),
                                );
                              },
                              child: Container(
                                width: 245.w,
                                height: 170.h,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.darkGreen,
                                      AppColors.lightGreen,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        text(
                                          context,
                                          "Fruits",
                                          28.sp,
                                          AppColors.customWhite,
                                          bold: true,
                                        ),
                                        Image.asset(
                                          "assets/fruits.png",
                                          width: 120.w,
                                          height: 100.h,
                                        ),
                                      ],
                                    ),
                                    text(
                                      context,
                                      "Lorem ipsum lorem",
                                      22.sp,
                                      AppColors.customWhite,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AppRoutes.push(
                                  context,
                                  FarmerPost(
                                    title: "Spices & Pulses",
                                    desc: "Lorem ipsum lorem",
                                    img: "assets/spices.png",
                                  ),
                                );
                              },
                              child: Container(
                                width: 245.w,
                                height: 140.h,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.darkGreen,
                                      AppColors.lightGreen,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        text(
                                          context,
                                          "Spices\n& Pulses",
                                          28.sp,
                                          AppColors.customWhite,
                                          bold: true,
                                        ),
                                        Image.asset(
                                          "assets/spices.png",
                                          width: 100.w,
                                          height: 70.h,
                                        ),
                                      ],
                                    ),
                                    text(
                                      context,
                                      "Lorem ipsum lorem",
                                      22.sp,
                                      AppColors.customWhite,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  farmerModeChange(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Farmer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          SizedBox(
            width: 10,
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OwnerNavBar()));
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: AppColors.darkGreen,
            activeColor: Colors.blue,
            inactiveTrackColor: AppColors.lightGreen,
            inactiveThumbColor: AppColors.customGrey,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Owner',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ],
      ),
    );
  }

  Widget sliderContainr(img, item, rate, unit, fName) {
    return Container(
      height: 236.h,
      width: 515.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.red,
                width: 180.w,
                height: 157.h,
                padding: EdgeInsets.only(
                  left: 20.sp,
                ),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                      context,
                      item ?? "",
                      28.sp,
                      AppColors.darkGreen,
                      bold: true,
                      maxLines: 1,
                    ),
                    text(
                      context,
                      "${rate} / ${unit} ",
                      28.sp,
                      AppColors.darkGreen,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                width: 300.w,
                height: 180.h,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(".") /* add child content here */,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 11.w,
            ),
            width: 516.w,
            height: 51.h,
            decoration: BoxDecoration(
              gradient: AppColors.greenGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11.r),
                bottomRight: Radius.circular(11.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text(
                  context,
                  fName ?? "",
                  28.sp,
                  Colors.white,
                  bold: true,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 36.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
