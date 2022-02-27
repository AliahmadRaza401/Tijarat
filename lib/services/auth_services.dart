// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, avoid_types_as_parameter_names, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tijarat/api/api.dart';
import 'package:tijarat/navbar/far_navbar.dart';
import 'package:tijarat/navbar/onr_navbar.dart';
import 'package:tijarat/providers/auth_provider.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/app_routes.dart';

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
        var userType = result['data']['user_type'][0];
        SpServices.saveUserToken(token);
        // SpServices.saveOwnerLoggedIn(true);
        SpServices.saveUserType(userType);
        if (userType == 'factory') {
          SpServices.saveOwnerLoggedIn(true);
          AppRoutes.pushAndRemoveUntil(context, OwnerNavBar());
        } else {
          SpServices.saveUserLoggedIn(true);
          AppRoutes.pushAndRemoveUntil(context, FarmerNavBar());
        }
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Login Successful"),
        ));
        // MotionToast.success(description: const Text("Login Successfully Done"))
        //     .show(context);
      } else {
        print("User Login False");
        Provider.of<AuthProvider>(context, listen: false).setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Your given Email Password is Wrong"),
        ));
        // MotionToast.warning(
        //   title: Text("UnAuthorized"),
        //   description: Text("Your given Email Password is Wrong"),
        // ).show(context);
      }
      return result;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Something went wrong!!!"),
      ));
      // MotionToast.warning(
      //   title: Text("Oops!"),
      //   description: Text("Some thing went wrong"),
      // ).show(context);
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
      Provider.of<AuthProvider>(context, listen: false).setLoading(true);

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
        Provider.of<AuthProvider>(context, listen: false).setLoading(false);
        var token = result['data']['token'].toString();
        var userType = result['data']['data']['user_type'].toString();
        var userName = result['data']['data']['name'].toString();
        var userId = result['data']['data']['id'].toString();

        print('userType: $userType');
        SpServices.saveUserLoggedIn(true);
        SpServices.saveUserToken(token);
        SpServices.saveUserType(userType);
        SpServices.saveUserId(userId);
        if (userType == 'farmer') {
          SpServices.saveUserName(userName);
          AppRoutes.pushAndRemoveUntil(context, FarmerNavBar());
        } else {
          AppRoutes.pushAndRemoveUntil(context, OwnerNavBar());
        }

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Account created!"),
        ));
        // MotionToast.success(
        //   title: const Text("SignUp Success!"),
        //   description: const Text("Your account created successfully Done"),
        // ).show(context);
      } else {
        Provider.of<AuthProvider>(context, listen: false).setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Email already exist"),
        ));

        // MotionToast.warning(
        //   title: const Text("SignUp Fail"),
        //   description: const Text("Email is already exist"),
        // ).show(context);

        Provider.of<AuthProvider>(context, listen: false).setLoading(false);
      }
      return result;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Your given Email Password is Wrong"),
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
