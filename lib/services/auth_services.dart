import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tijarat/api/api.dart';
import 'package:tijarat/providers/auth_provider.dart';

class AuthServices {
  var result;
  late AuthProvider _authProvider;

  Future signIn({@required email, @required password}) async {
    try {
      print(email);
      print("Sign In ---------------------------");
      final _response = await http.post(
        Uri.parse(API.login),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'email': email}),
      );

      result = jsonDecode(_response.body);
      return result;
    } catch (e) {
      return e.toString();
    }
  }

  //  _________________ sign Up__________________________________

  Future signUp(
      {@required fName,
      @required lName,
      @required email,
      @required password}) async {
    try {
      print("Sign Up ---------------------------");
      final _response = await http.post(
        Uri.parse(API.signUp),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
        }),
      );
      result = jsonDecode(_response.body);
      // print('result: $result');
      return result;
    } catch (e) {
      return e;
    }
  }
}
