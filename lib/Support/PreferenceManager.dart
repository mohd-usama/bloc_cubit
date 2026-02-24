import 'dart:convert';



import 'package:shared_preferences/shared_preferences.dart';

import '../Model/LoginModel.dart';



class PreferenceManager {
  PreferenceManager._privateConstructor();

  static final PreferenceManager instance = PreferenceManager._privateConstructor();

  setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<LoginModel> getLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginModel loginModel = LoginModel();

    String loginjson = prefs.getString("LoginDetails") ?? "";

    if (loginjson.isNotEmpty) {
      loginModel = LoginModel.fromJson(jsonDecode(loginjson));
    }
    return loginModel;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
