import 'package:shared_preferences/shared_preferences.dart';

class AuthProses {
  
  static final  String auth = "auth";
  static final String token = "token";

  static Future<bool> isLogin() async {
    final preferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 2000));
    return preferences.getBool(auth) ?? false;
  }

  static Future<bool> setLogin() async {
    final preferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 2000));
    return preferences.setBool(auth, true);
  }

  static Future<bool> deleteToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(token, "");
  }

  static Future<bool> isLogout() async {
    final preferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 2000));
    return preferences.setBool(auth, false);
  }

  static Future<String> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(token) ?? "";
  }

  static Future<bool> setToken(String touken) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(token, touken);
  }
}