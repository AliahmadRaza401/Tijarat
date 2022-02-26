import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:tijarat/navbar/onr_navbar.dart';
import 'package:tijarat/utils/app_routes.dart';
import '../api/api.dart';
import '../navbar/far_navbar.dart';
import '../providers/auth_provider.dart';

class PostServices {
  var result;

  Future createPost({
    required BuildContext context,
    @required category_id,
    @required product_id,
    @required user_id,
    @required price,
    @required unit,
    @required image,
    @required description,
    @required address,
    @required special_offer,
  }) async {
    try {
      var dio = Dio();
     
      var formData = FormData.fromMap({
        "category_id": category_id,
        "product_id": product_id,
        "user_id": user_id,
        "price": price,
        "unit": unit,
        "description": description,
        "address": address,
        "special_offer": special_offer,
        'image': await MultipartFile.fromFile(image, filename: 'image'),
      });
      var response = await dio.post(
        API.createPost,
        data: formData,
        options: Options(
            followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization":
                  "Bearer 45|yix6Tfu6Zrpwy6BU6TiUwzQukRiKhT7sLz9TvTsH",
            }),
      );
      print('response: ${response.statusCode}');

      // print("Post Uploading ---------------------------");
      // Provider.of<AuthProvider>(context, listen: false).setLoading(true);

      // final _response = await http.post(Uri.parse(API.createPost),
      //     headers: {
      //       "Content-Type": "application/json",
      //       "Accept": "application/json",
      //       "Authorization":
      //           "Bearer 45|yix6Tfu6Zrpwy6BU6TiUwzQukRiKhT7sLz9TvTsH",
      //     },
      //     body: jsonEncode({
      //       "category_id": category_id,
      //       "product_id": product_id,
      //       "user_id": user_id,
      //       "price": price,
      //       "unit": unit,
      //       "image": image,
      //       "description": description,
      //       "address": address,
      //       "special_offer": special_offer,
      //     }));
      // result = jsonDecode(_response.body);
      // var jsonRes = jsonDecode(_response.body);
      // // print('jsonRes: $jsonRes');
      // print('result: $result');

      // if (result['status'] == 'Success') {
      //   Provider.of<AuthProvider>(context, listen: false).setLoading(false);
      //   AppRoutes.pushAndRemoveUntil(context, OwnerNavBar());
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text("Post Uploaded Success!"),
      //   ));
      // } else {
      //   Provider.of<AuthProvider>(context, listen: false).setLoading(false);
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text("Post Uploaded Fail!"),
      //   ));

      //   // MotionToast.warning(
      //   //   title: const Text("SignUp Fail"),
      //   //   description: const Text("Email is already exist"),
      //   // ).show(context);

      //   Provider.of<AuthProvider>(context, listen: false).setLoading(false);
      // }
      // return result;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops! something wrong"),
      ));
      // MotionToast.warning(
      //   title: Text("Oops!"),
      //   description: Text("Some thing went wrong"),
      // ).show(context);
      Provider.of<AuthProvider>(context, listen: false).setLoading(false);
      print('e: $e');
      return e;
    }
  }
}
