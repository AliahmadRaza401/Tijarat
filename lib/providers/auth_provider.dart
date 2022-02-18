import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  late BuildContext context;

  init({required BuildContext context}) {
    this.context = context;
  }

  bool loading = false;

  setLoading(bool val) {
    loading = val;
    notifyListeners();
  }

  // // Save User Data

  // userFName(String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('userFName', value);
  // }

  // userLName(String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('userLName', value);
  // }

  // userEmailSave(String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('userEmail', value);
  // }

  // userUniqueIdSave(String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('userUniqueId', value);
  // }

  // Future getUserFName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var user = prefs.getString('userFName');
  //   return user;
  // }

  // Future getUserLName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var user = prefs.getString('userLName');
  //   return user;
  // }

  // Future getUserEmail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var user = prefs.getString('userEmail');
  //   return user;
  // }

  // Future saveName() async {
  //   userFname = await getUserFName();
  //   userLname = await getUserLName();
  //   userEmail = await getUserEmail();
  // }

  // // Check Uer Login or Not
  // checkUserAlreadyLogin(BuildContext context) async {
  //   bool loginUser = await getloginUser();
  //   print('loginUser: $loginUser');
  //   var splashToken = await Provider.of<SignUpProvider>(context, listen: false)
  //       .getUserTokenSF();
  //   print('splashToken: $splashToken');
  //   if (loginUser == true) {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => CountryNavBar()));
  //     print("User Alrady Login");
  //   } else {
  //     print("User Not Login");
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => LogIn()));
  //   }
  // }

  // loginTrue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('loginUser', true);
  //   print("User  Login  True");
  // }

  // loginFalse() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('loginUser', false);
  //   print("User  Login  False");
  // }

  // getloginUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //Return bool
  //   bool? boolValue = prefs.getBool('loginUser');
  //   return boolValue;
  // }
}
