import 'dart:convert';
import 'package:demo_task/core/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
const String isLoggedIn = "IsLoggedIn";
const String isUserType = "IsUserType";
const String loginResponse = "LoginResponse";
const String isScreenLock = "IsScreenLock";

Future<void> initSharedPref() async {
  sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getBool(isLoggedIn) == null) {
    sharedPreferences.setBool(isLoggedIn, false);
  }

}

Future<void> setIsLoggedIn(bool val) async {
  await sharedPreferences.setBool(isLoggedIn, val);
}

bool getIsLoggedIn() {
  return (sharedPreferences.getBool(isLoggedIn) ?? false);
}

Future<void> setIsUserType(String val) async {
  await sharedPreferences.setString(isUserType, val);
}

String getIsUserType() {
  return (sharedPreferences.getString(isUserType) ?? "Customer");
}

Future<void> setIsScreenLock(bool val) async {
  await sharedPreferences.setBool(isScreenLock, val);
}

bool getIsScreenLock() {
  return (sharedPreferences.getBool(isScreenLock) ?? false);
}


Future<void> setLoginResponse(LoginResponse? model) async {
  await sharedPreferences.setString(loginResponse, jsonEncode(model));
}
LoginResponse? get getLoginResponse {
  final data = sharedPreferences.getString(loginResponse);
  if (data != null) {
    return LoginResponse.fromJson(jsonDecode(data));
  }
  return null;
}

Future<void> removeLoginResponse() async {
  await sharedPreferences.remove(loginResponse);
}