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
    @required cPassword,
    @required bool userTypeFac = true,
    @required factoryName,
    @required factoryImage,
  }) async {
    try {
      print("Sign Up ---------------------------");
              Provider.of<AuthProvider>(context).setLoading(true);

      final _response = await http.post(
        Uri.parse(API.signUp),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: userTypeFac
            ? jsonEncode({
                "name": name,
                "email": email,
                "password": password,
                "c_password": cPassword,
                "user_type": "factory",
                "factory_name": factoryName,
                "factory_image": factoryImage,
              })
            : jsonEncode({
                "name": name,
                "email": email,
                "password": password,
                "c_password": cPassword,
                "user_type": "farmer"
              }),
      );
      result = jsonDecode(_response.body);
      Map<String, dynamic> jsonRes = jsonDecode(_response.body);
      // print('jsonRes: $jsonRes');
      print('result: $result');

      if (result['status'] == 'Success') {
        Provider.of<AuthProvider>(context).setLoading(false);
        var token = result['data']['token'];
        SpServices.saveUserToken(token);
        MyMotionToast.success(context, "SignUp Success!",
            "Your account created successfully Done");
      } else {
                Provider.of<AuthProvider>(context).setLoading(false);
        MyMotionToast.warning(
            context, "SignUp Fail", "Email is not valid".toString());

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
