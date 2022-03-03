import 'dart:convert';
import 'dart:io';

import 'package:cool_stepper/cool_stepper.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:tijarat/api/api.dart';
import 'package:tijarat/navbar/onr_navbar.dart';
import 'package:tijarat/services/post_services.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/app_color.dart';
import 'package:tijarat/utils/app_routes.dart';
import 'package:tijarat/utils/constants.dart';
import 'package:tijarat/widgets/appbar/onr_app_bar.dart';

import '../../../utils/image_piker.dart';
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
  late File image;
  String category = "", product = "";
  bool loading = true;
  String productLoading = "";
  var userId = '';
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
  List categories = [
        {
          "id": 1,
          "name": "Agri Commodities",
          "image": "default.jpg",
          "description": null,
          "created_at": "2022-02-21T18:06:18.000000Z",
          "updated_at": "2022-02-21T18:06:18.000000Z"
        },
        {
          "id": 2,
          "name": "Fine Products",
          "image": "default.jpg",
          "description": null,
          "created_at": "2022-02-21T18:06:18.000000Z",
          "updated_at": "2022-02-21T18:06:18.000000Z"
        },
        {
          "id": 3,
          "name": "Fruities",
          "image": "default.jpg",
          "description": null,
          "created_at": "2022-02-21T18:06:18.000000Z",
          "updated_at": "2022-02-21T18:06:18.000000Z"
        },
        {
          "id": 4,
          "name": "Spices & pulses",
          "image": "default.jpg",
          "description": null,
          "created_at": "2022-02-21T18:06:18.000000Z",
          "updated_at": "2022-02-21T18:06:18.000000Z"
        },
      ],
      products = [];

  getData() async {
    var mytoken = await SpServices.getUserToken();

    var myId = await SpServices.getUserId();

    setState(() {
      token = mytoken == null ? authToken : mytoken;
      userId = myId;
    });
    await getCategory();
  }

  List<bool> _selectedCategorey = List.generate(20, (i) => false);
  List<bool> _selectedProduct = List.generate(20, (i) => false);

  String? selectedUnit;
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
    // categories.clear();
    print("fetching Post");
    final response =
        await http.get(Uri.parse(API.getCategory), headers: headers);

    var responseData = json.decode(response.body);
    print('responseData: $responseData');
    for (var data in responseData['data']['data']) {
      setState(() {
        categories.add(data);
        loading = false;
      });
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
      setState(() {
        products.add(data);
        productLoading = "false";
      });
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
                      child:
                          //  loading == true
                          //     ? SizedBox(
                          //         height: 140.h,
                          //         child: Center(
                          //             child: Lottie.asset(
                          //                 'assets/json/Loading 2.json')),
                          //       )
                          //     :
                          GridView.builder(
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
                                productLoading = "true";
                                catId = categories[index]["id"].toString();
                                category = categories[index]["id"].toString();
                                _selectedCategorey[index] =
                                    !_selectedCategorey[index];
                              });
                              getProducts(catId);
                            },
                            child: customChoiceChip(
                              context,
                              categories[index]["name"],
                              index,
                            ),
                          );
                        },
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
                    SizedBox(
                      height: 140.h,
                      child: productLoading == ""
                          ? Container(
                              // color: Colors.amber,
                              child: Center(
                                  child: Text(
                                "Select Category",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              )),
                            )
                          : productLoading == "true"
                              ? SizedBox(
                                  height: 140.h,
                                  child: Center(
                                      child: Lottie.asset(
                                          'assets/json/Loading 2.json')),
                                )
                              : GridView.builder(
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
                                    if (products.isEmpty) {
                                      return Text("Empty");
                                    } else {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedProduct[index] =
                                                !_selectedProduct[index];

                                            product = products[index]["id"]
                                                .toString();
                                          });
                                        },
                                        child: customProductChoiceChip(
                                          context,
                                          products[index]["name"].toString(),
                                          index,
                                        ),
                                      );
                                    }
                                  },
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
              // height: 220.h,
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
                  GestureDetector(
                    onTap: () async {
                      await openFilePicker();
                    },
                    child: Container(
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
                            // onTap: () async {
                            //   image = (await _picker.pickImage(
                            //     source: ImageSource.camera,
                            //   )) as File;
                            // },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 24.r,
                                    color: const Color(0xffc4c4c4),
                                  ),
                                  text(
                                    "Open Camera",
                                    18.sp,
                                    const Color(0xffc4c4c4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            // onTap: () async {
                            //   image = (await _pickerpickImage(
                            //     source: ImageSource.gallery,
                            //   )) as File;
                            // },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 24.r,
                                    color: const Color(0xffc4c4c4),
                                  ),
                                  text(
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _image != null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            height: 300.h,
                            width: 470.w,
                          ),
                        )
                      : SizedBox(),
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
                        "Special Offers",
                        30.sp,
                        AppColors.buttonGreen,
                        bold: true,
                      ),
                    ],
                  ),
                  text(
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
                        value: selectedUnit,
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
                            selectedUnit = value;
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
        appBar: ownerAppBar(context, true, back: true),
        body: stepper,
      ),
    );
  }

  stepComplete() {
    print('Steps completed!');
    AppRoutes.pushAndRemoveUntil(context, OwnerNavBar());

    // print("CAte : $category");
    // print("PRoduct $product");
    // print("Desc ${description.text}");
    // print("Img ${_image!.path}");
    // print("offer : ${offer.text}");
    // print("Price: ${price.text}");
    // print("Unit $selectedUnit");
    // PostServices().createPost(
    //   context: context,
    //   category_id: category,
    //   product_id: product,
    //   user_id: userId,
    //   price: price.text,
    //   unit: selectedUnit,
    //   image:
    //       // 'data:image/jpeg;base64,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',
    //       _image!.path,
    //   description: description.text,
    //   address: "Lat Long",
    //   special_offer: offer.text,
    // );
  }

  Widget customChoiceChip(context, title, index) {
    return Container(
      width: 220.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: _selectedCategorey[index] ? AppColors.darkGreen : null,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: _selectedCategorey[index]
              ? AppColors.darkGreen
              : AppColors.customGrey,
          width: 1.0,
        ),
      ),
      child: Center(
        child: text(
          title,
          20.sp,
          _selectedCategorey[index]
              ? AppColors.customWhite
              : AppColors.customBlack,
        ),
      ),
    );
  }

  Widget customProductChoiceChip(context, title, int index) {
    return Container(
      width: 220.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: _selectedProduct[index] ? AppColors.darkGreen : null,
        border: Border.all(
          color: _selectedProduct[index]
              ? AppColors.darkGreen
              : AppColors.customGrey,
          width: 1.0,
        ),
      ),
      child: Center(
        child: text(
          title,
          20.sp,
          _selectedProduct[index]
              ? AppColors.customWhite
              : AppColors.customBlack,
        ),
      ),
    );
  }

  File? _image;

  Future<void> openFilePicker() async {
    var image = await pickImageFromGalleryOrCamera(context);
    if (image == null) return;

    print(image.path);

    setState(() => _image = image);
  }
}
