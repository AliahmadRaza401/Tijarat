// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:tijarat/app%20screens/farmer/far_post.dart';
import 'package:tijarat/model/topRatePostModel.dart';
import 'package:tijarat/navbar/onr_navbar.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';
import 'package:tijarat/widgets/appbar/far_app_bar.dart';
import 'package:tijarat/widgets/form_fields.dart';
import 'package:tijarat/widgets/text_widget.dart';
import 'package:tijarat/widgets/underconstruction.dart';

import '../../api/api.dart';
import '../../utils/constants.dart';

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

  List<TopRatePostModel> allpost = [
    // TopRatePostModel(
    //   id: "id",
    //   productName: "Corn",
    //   price: "750",
    //   unit: "KG",
    //   image:
    //       'https://askthefoodgeek.com/wp-content/uploads/2017/02/corn-in-season.jpg',
    //   createdAt: DateTime.now(),
    //   categoryName: "categoryName",
    //   factoryName: "Akhtar Factory",
    //   userName: "ad",
    // ),
    // TopRatePostModel(
    //   id: "id",
    //   productName: "Rice",
    //   price: "1800",
    //   unit: "KG",
    //   image:
    //       'https://www.mounthopewholesale.com/wp-content/uploads/2015/04/RLG.jpg',
    //   createdAt: DateTime.now(),
    //   categoryName: "categoryName",
    //   factoryName: "Raza Mils",
    //   userName: "ad",
    // ),
    // TopRatePostModel(
    //   id: "id",
    //   productName: "Vegetables",
    //   price: "500",
    //   unit: "KG",
    //   image:
    //       'https://www.kindpng.com/picc/m/46-464276_vegetable-basket-fruit-clip-art-transparent-background-fruits.png',
    //   createdAt: DateTime.now(),
    //   categoryName: "categoryName",
    //   factoryName: "Alharm Factory",
    //   userName: "ad",
    // ),
  ];
  bool loading = true;

  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };

  Future<List<TopRatePostModel>> getRequest() async {
    print("fetching Post");
    final response =
        await http.get(Uri.parse(API.getTopRatePost), headers: headers);

    var responseData = json.decode(response.body);
    print('responseData: $responseData');
    for (var data in responseData['data']['posts']) {
      TopRatePostModel item = TopRatePostModel(
        id: data['id'],
        productName: data['product_name'],
        price: data['price'],
        unit: data['unit'],
        image: data['image'],
        createdAt: DateTime.parse(data['created_at']),
        categoryName: data['category_name'],
        factoryName: data['factory_name'],
        userName: data['name'],
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
    print('name: $name');
    var owner = await SpServices.getownerLoggedIn();
    print('owner: $owner');
    var mytoken = await SpServices.getUserToken();
    print('mytoken: $mytoken');
    setState(() {
      token = mytoken ?? authToken;
      userName = name ?? "Farmer";
      isOwner = owner ?? false;
    });
    await getRequest();
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
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 236.h,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.98,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items:
                        //  [
                        //   sliderContainr(
                        //     "assets/vagetable.png",
                        //     allpost[0].productName.toString(),
                        //     allpost[0].price.toString(),
                        //     allpost[0].unit.toString(),
                        //     allpost[0].factoryName.toString(),
                        //   ),
                        // ],
                        allpost
                            .map((item) => sliderContainer(
                                  item.image.toString(),
                                  item.productName.toString(),
                                  item.price.toString(),
                                  item.unit.toString(),
                                  item.factoryName.toString(),
                                ))
                            .toList(),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: text(
                      "Hi, $userName",
                      28.sp,
                      AppColors.darkGreen,
                      bold: true,
                    ),
                  ),
                  text(
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
                    height: 20.h,
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
                                "Agri Commodities",
                                28.sp,
                                AppColors.customWhite,
                                bold: true,
                              ),
                              text(
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
                            "assets/png/grain.png",
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
                                img: "assets/png/fineProd.png",
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
                                  "Fine Products",
                                  28.sp,
                                  AppColors.customWhite,
                                  bold: true,
                                ),
                                text(
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
                                showDialog(
                                  barrierDismissible: true,
                                  useSafeArea: true,
                                  context: context,
                                  barrierColor: Colors.white60,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          39.r,
                                        ),
                                      ),
                                      backgroundColor: AppColors.customWhite,
                                      insetPadding: EdgeInsets.all(
                                        CustomSizes()
                                            .dynamicWidth(context, 0.04),
                                      ),
                                      child: Container(
                                        width: 500.w,
                                        height: 480.h,
                                        color: AppColors.noColor,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: text(
                                                "Fruits",
                                                36.sp,
                                                AppColors.customBlack,
                                                bold: true,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                catChoiceChip(
                                                    context, "Seasonal"),
                                                catChoiceChip(
                                                    context, "Regular"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
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
    return Row(
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
          inactiveThumbColor: AppColors.darkGreen,
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
    );
  }

  Widget sliderContainer(img, item, rate, unit, fName) {
    return GestureDetector(
      onTap: () {
        AppRoutes.push(context, UnderConstruction());
      },
      child: Container(
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
                        item ?? "",
                        28.sp,
                        AppColors.darkGreen,
                        bold: true,
                        maxLines: 1,
                      ),
                      text(
                        "$rate / $unit ",
                        28.sp,
                        AppColors.darkGreen,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: 300.w,
                //   height: 160.h,
                //   alignment: Alignment.centerRight,
                //   decoration: BoxDecoration(
                //     // color: Colors.amber,
                //     image: DecorationImage(
                //       image: NetworkImage(img),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                //   child: Text(".") /* add child content here */,
                // ),
                Container(
                  width: 300.w,
                  height: 160.h,
                  alignment: Alignment.centerRight,
                  child: CachedNetworkImage(
                      imageUrl: img,
                      imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      placeholder: (context, url) =>
                          Image.asset('assets/vagetable.png'),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/vagetable.png')),
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
      ),
    );
  }
}

Widget catChoiceChip(context, title) {
  return InkWell(
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
      width: 210.w,
      height: 280.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.customWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 210.w,
            height: 210.h,
            child: Center(
              child: title == "Regular"
                  ? Image.asset("assets/gif/Signup as Owner.gif")
                  : LottieBuilder.asset("assets/json/Seasonal.json"),
            ),
          ),
          Container(
            width: 210.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.darkGreen,
                  AppColors.lightGreen,
                ],
              ),
            ),
            child: Center(
              child: text(
                title,
                24.sp,
                AppColors.customWhite,
                bold: true,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
