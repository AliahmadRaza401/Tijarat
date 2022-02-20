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

  static saveUserType(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userType', value);
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
}
