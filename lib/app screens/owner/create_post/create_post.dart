import 'dart:convert';

import 'package:cool_stepper/cool_stepper.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:tijarat/api/api.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/widgets/appbar/onr_app_bar.dart';

import '../../../widgets/text_widget.dart';

class CreatePostStepper extends StatefulWidget {
  const CreatePostStepper({Key? key}) : super(key: key);

  @override
  _CreatePostStepperState createState() => _CreatePostStepperState();
}

class _CreatePostStepperState extends State<CreatePostStepper> {
  final _formKey = GlobalKey<FormState>();
  final _addressKey = GlobalKey<FormState>();
  final _contactKey = GlobalKey<FormState>();
  final _descKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String category = "", product = "";

  TextEditingController description = TextEditingController();
  TextEditingController offer = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  void initState() {
    super.initState();
    category = "";
    product = "";
    getData();
  }

  var token = '', catId = "";
  List categories = [], products = [];

  getData() async {
    token = await SpServices.getUserToken();
    await getCategory();
  }

  String? selectedValue;
  List<String> items = [
    'Per Kg',
    'Per Grams',
    'Per Mann',
  ];

  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };

  getCategory() async {
    categories.clear();
    print("fetching Post");
    final response =
        await http.get(Uri.parse(API.getCategory), headers: headers);

    var responseData = json.decode(response.body);
    print('responseData: $responseData');
    for (var data in responseData['data']['data']) {
      categories.add(data);
    }
    return categories;
  }

  getProducts(id) async {
    products.clear();
    print("fetching Post");
    final response =
        await http.get(Uri.parse(API.getProduct(id)), headers: headers);

    var responseData = json.decode(response.body);
    print('responseData: $responseData');
    for (var data in responseData['data']['data']) {
      products.add(data);
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'Product',
        subtitle: '',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: 510.w,
                height: 300.h,
                decoration: BoxDecoration(
                  color: AppColors.lightGreen1,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.all(14.r),
                child: Column(
                  children: [
                    Row(
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
                          "Select Category",
                          30.sp,
                          AppColors.buttonGreen,
                          bold: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    SizedBox(
                      height: 140.h,
                      child: FutureBuilder(
                        future: getCategory(),
                        builder: ((context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return GridView.builder(
                              itemCount: categories.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 4.2 / 1.0,
                                mainAxisSpacing: 20.0,
                                crossAxisSpacing: 10.0,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      catId =
                                          categories[index]["id"].toString();
                                      category =
                                          categories[index]["name"].toString();
                                    });
                                  },
                                  child: customChoiceChip(
                                    context,
                                    categories[index]["name"],
                                  ),
                                );
                              },
                            );
                          }
                          return LottieBuilder.asset(
                            "assets/json/Loading 2.json",
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: 510.w,
                height: 300.h,
                decoration: BoxDecoration(
                  color: AppColors.lightGreen1,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.all(14.r),
                child: Column(
                  children: [
                    Row(
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
                          "Select Product",
                          30.sp,
                          AppColors.buttonGreen,
                          bold: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    category == ""
                        ? SizedBox(
                            height: 140.h,
                            child: Center(
                              child: text(
                                context,
                                "Select category",
                                .04,
                                AppColors.darkGreen,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 140.h,
                            child: FutureBuilder(
                              future: getProducts(catId),
                              builder: ((context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return GridView.builder(
                                    itemCount: products.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 4.2 / 1.0,
                                      mainAxisSpacing: 20.0,
                                      crossAxisSpacing: 10.0,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            category = categories[index]["name"]
                                                .toString();
                                          });
                                        },
                                        child: customChoiceChip(
                                          context,
                                          products[index]["name"],
                                        ),
                                      );
                                    },
                                  );
                                }
                                return LottieBuilder.asset(
                                  "assets/json/Loading 2.json",
                                );
                              }),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
        validation: () {
          if (category == "" && product == "") {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Details',
        subtitle: '',
        content: Column(
          children: [
            Container(
              width: 510.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: AppColors.lightGreen1,
                borderRadius: BorderRadius.circular(30.r),
              ),
              padding: EdgeInsets.all(14.r),
              child: Column(
                children: [
                  Row(
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
                        "Add Description",
                        30.sp,
                        AppColors.buttonGreen,
                        bold: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: 470.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: AppColors.customGrey,
                        width: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.all(8.r),
                    child: TextField(
                      controller: description,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter detailed description of your product',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: 510.w,
              height: 220.h,
              decoration: BoxDecoration(
                color: AppColors.lightGreen1,
                borderRadius: BorderRadius.circular(30.r),
              ),
              padding: EdgeInsets.all(14.r),
              child: Column(
                children: [
                  Row(
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
                        "Add Image",
                        30.sp,
                        AppColors.buttonGreen,
                        bold: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    width: 470.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: AppColors.customGrey,
                        width: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.all(8.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            image = await _picker.pickImage(
                              source: ImageSource.camera,
                            );
                          },
                          child: Container(
                            width: 180.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                color: const Color(0xffc4c4c4),
                                width: 1.0,
                              ),
                            ),
                            padding: EdgeInsets.all(2.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  size: 24.r,
                                  color: const Color(0xffc4c4c4),
                                ),
                                text(
                                  context,
                                  "Open Camera",
                                  18.sp,
                                  const Color(0xffc4c4c4),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            image = await _picker.pickImage(
                              source: ImageSource.gallery,
                            );
                          },
                          child: Container(
                            width: 180.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                color: const Color(0xffc4c4c4),
                                width: 1.0,
                              ),
                            ),
                            padding: EdgeInsets.all(2.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 24.r,
                                  color: const Color(0xffc4c4c4),
                                ),
                                text(
                                  context,
                                  "Browse",
                                  18.sp,
                                  const Color(0xffc4c4c4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        validation: () {
          // if (selectedCategorey.isEmpty) {
          //   return alertDialog(context, "Required!",
          //       'Please Click PREV select atleast one Categorey');
          // }
          // return null;
        },
      ),
      CoolStep(
        title: 'Price',
        subtitle: '',
        content: Column(
          children: [
            Container(
              width: 510.w,
              height: 230.h,
              decoration: BoxDecoration(
                color: AppColors.lightGreen1,
                borderRadius: BorderRadius.circular(30.r),
              ),
              padding: EdgeInsets.all(14.r),
              child: Column(
                children: [
                  Row(
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
                        "Special Offers",
                        30.sp,
                        AppColors.buttonGreen,
                        bold: true,
                      ),
                    ],
                  ),
                  text(
                    context,
                    "Select any offer you want to give",
                    22.sp,
                    AppColors.buttonGreen,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: 480.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: AppColors.customWhite,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.all(8.r),
                    child: TextField(
                      controller: offer,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter any special offers(optional)',
                        hintStyle: TextStyle(
                          fontSize: 22.sp,
                          color: AppColors.lightGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: 510.w,
              height: 220.h,
              decoration: BoxDecoration(
                color: AppColors.lightGreen1,
                borderRadius: BorderRadius.circular(30.r),
              ),
              padding: EdgeInsets.all(14.r),
              child: Column(
                children: [
                  Row(
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
                        "Price",
                        30.sp,
                        AppColors.buttonGreen,
                        bold: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 220.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: AppColors.customBlack,
                            width: 1.0,
                          ),
                        ),
                        padding: EdgeInsets.all(8.r),
                        child: TextField(
                          controller: price,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter price in rupees',
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.customGrey,
                            ),
                          ),
                        ),
                      ),
                      CustomDropdownButton2(
                        hint: 'Per Kg',
                        value: selectedValue,
                        dropdownItems: items,
                        buttonWidth: 220.w,
                        buttonHeight: 50.h,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30.r,
                        ),
                        buttonDecoration: BoxDecoration(
                          color: AppColors.noColor,
                          borderRadius: BorderRadius.circular(
                            5.r,
                          ),
                          border: Border.all(
                            color: AppColors.customBlack,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        validation: () {
          // if (selectedCategorey.isEmpty) {
          //   return alertDialog(context, "Required!",
          //       'Please Click PREV select atleast one Categorey');
          // }
          // return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: stepComplete,
      steps: steps,
      config: const CoolStepperConfig(
        backText: 'BACK',
        finalText: "ADD",
        headerColor: AppColors.lightGreen1,
        titleTextStyle: TextStyle(
          color: AppColors.buttonGreen,
          fontWeight: FontWeight.bold,
        ),
        subtitleTextStyle: TextStyle(
          color: AppColors.buttonGreen,
        ),
        iconColor: AppColors.lightGreen1,
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: ownerAppBar(context, back: true),
        body: stepper,
      ),
    );
  }

  stepComplete() {
    print('Steps completed!');
  }
}

Widget customChoiceChip(context, title) {
  return Container(
    width: 220.w,
    height: 50.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.r),
      border: Border.all(
        color: AppColors.customGrey,
        width: 1.0,
      ),
    ),
    child: Center(
      child: text(
        context,
        title,
        20.sp,
        AppColors.customBlack,
      ),
    ),
  );
}
