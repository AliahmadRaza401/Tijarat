// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, avoid_types_as_parameter_names, unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tijarat/api/api.dart';
import 'package:tijarat/providers/auth_provider.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/motion_toast.dart';

class AuthServices {
  var result;
  late AuthProvider _authProvider;

  Future signIn(
      {required BuildContext context,
      @required email,
      @required password}) async {
    try {
      print(email);
      print("Sign In ---------------------------");
      final _response = await http.post(
        Uri.parse(API.login),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "password": password}),
      );

      result = jsonDecode(_response.body);
      print('result: $result');
      if (result['status'] == 'Success') {
        Provider.of<AuthProvider>(context, listen: false).setLoading(false);
        var token = result['data']['token'];
        SpServices.saveUserToken(token);
        SpServices.saveUserLoggedIn(true);
        MyMotionToast.success(context, "Success", "Login Successfully Done");
      } else {
        print("User Login False");
        Provider.of<AuthProvider>(context, listen: false).setLoading(false);
        MyMotionToast.warning(context, "UnAuthorized".toString(),
            "Your given Email Password is Wrong".toString());
      }
      return result;
    } catch (e) {
      MyMotionToast.warning(
          context, "Oops!".toString(), "Some thing went wrong".toString());
      print('e: $e');
      Provider.of<AuthProvider>(context, listen: false).setLoading(false);
      return e.toString();
    }
  }

  //  _________________ sign Up__________________________________

  Future signUp({
    required BuildContext context,
    @required name,
    @required email,
    @required password,
    @required c_password,
    @required bool userType_fac = true,
    @required factory_name,
    @required factory_image,
  }) async {
    try {
      print("Sign Up ---------------------------");
      final _response = await http.post(
        Uri.parse(API.signUp),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: userType_fac
            ? jsonEncode({
                "name": name,
                "email": email,
                "password": password,
                "c_password": c_password,
                "user_type": "factory",
                "factory_name": factory_name,
                "factory_image": factory_image,
              })
            : jsonEncode({
                "name": name,
                "email": email,
                "password": password,
                "c_password": c_password,
                "user_type": "farmer"
              }),
      );
      result = jsonDecode(_response.body);
      //  Map<String, dynamic> jsonRes = jsonDecode(_response.body['errors']);
      print('result: $result');

      if (result['status'] == 'Success') {
        var token = result['data']['token'];
        SpServices.saveUserToken(token);
        MyMotionToast.success(context, "SignUp Success!",
            "Your account created successfully Done");
      } else {
        // if (jsonRes.containsKey(['email'][0]) ) {

        // } else {
        // }
        MyMotionToast.warning(
            context, "Fail".toString(), "Some thing went wrong".toString());

        Provider.of<AuthProvider>(context, listen: false).setLoading(false);
      }
      return result;
    } catch (e) {
      MyMotionToast.warning(
          context, "Oops!".toString(), "Some thing went wrong".toString());
      Provider.of<AuthProvider>(context, listen: false).setLoading(false);
      print('e: $e');
      return e;
    }
  }
}
