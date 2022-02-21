import 'package:shared_preferences/shared_preferences.dart';

class SpServices {
  static saveUserToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', value);
  }

  static saveUserLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('userLoggedIn', value);
  }

  static saveUserFirstTime(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('userFirstTime', value);
  }

  static saveOwnerLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ownerLoggedIn', value);
  }

  static saveUserType(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userType', value);
  }

  static saveUserName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', value);
  }

  static getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stringValue = prefs.getString('userToken');
    return stringValue;
  }

  static getUserFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool('userFirstTime');
    return boolValue;
  }

  static getownerLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool('ownerLoggedIn');
    return boolValue;
  }

  static getUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool('userLoggedIn');
    return boolValue;
  }

  static getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stringValue = prefs.getString('userType');
    return stringValue;
  }

  static getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stringValue = prefs.getString('userName');
    return stringValue;
  }
}
