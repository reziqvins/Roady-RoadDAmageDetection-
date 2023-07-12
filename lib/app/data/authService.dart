import 'dart:convert';
import 'package:bismillahcapston/app/data/auth/addData/addDataRequest.dart';
import 'package:bismillahcapston/app/data/auth/addData/addDataResponse.dart';
import 'package:bismillahcapston/app/data/auth/constant.dart';
import 'package:bismillahcapston/app/data/auth/forgot_Pasword/forgotPass_request.dart';
import 'package:bismillahcapston/app/data/auth/forgot_Pasword/forgotPass_response.dart';
import 'package:bismillahcapston/app/data/auth/user/user_response.dart';
import 'package:bismillahcapston/app/data/authProses.dart';
import 'package:http/http.dart' as http;

import 'auth/signin/signin_request.dart';
import 'auth/signin/signin_response.dart';
import 'auth/signup/signup_request.dart';
import 'auth/signup/signup_response.dart';

final baseUrl = "http://kuro.asrofur.me:6969";
// final baseUrl = "https://broady-production.up.railway.app";
// const baseUrl = "https://web-service-production-498a.up.railway.app";

class authService {
  static Future<SignUpResponse> doRegister(SignUpRequest signupRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/user/signup"),
        headers: {"Content-Type": "application/json"},
        body: signupRequest.toJson());
    print("$response");
    if (response.statusCode == 201) {
      return SignUpResponse.fromMap(json.decode(response.body));
    } else {
      final err = SignUpResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }

  static Future<SignInResponse> doLogin(SignInRequest loginRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/user/signin"),
        headers: {"Content-Type": "application/json"},
        body: loginRequest.toJson());
    if (response.statusCode == 200) {
      return SignInResponse.fromMap(json.decode(response.body));
    } else {
      final err = SignInResponse.fromMap(json.decode(response.body));
      throw Exception("${err}");
    }
  }

  static Future<ChangePasswordResponse> doChagePassword(
      ChangePasswordRequest changePasswordRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/user/forgot-password"),
        headers: {"Content-Type": "application/json"},
        body: changePasswordRequest.toJson());

    if (response.statusCode == 200) {
      return ChangePasswordResponse.fromMap(json.decode(response.body));
    } else {
      final err = ChangePasswordResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }

  Future<addDataResponse> addData(addDataRequest addRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/kondisi"),
        headers: {"Content-Type": "application/json"},
        body: addRequest.toJson());
    print("KONCI ${response.body}");
    if (response.statusCode == 200) {
      return addDataResponse.fromMap(json.decode(response.body));
    } else {
      final err = addDataResponse.fromMap(json.decode(response.body));
      throw Exception("${err}");
    }
  }

  static Future<UserResponse> currentUser() async {
    final token = await AuthProses.getToken();
    print("$token hahahaha");
    final response = await http.get(Uri.parse("$baseUrl/user/current"),
        headers: headers(token));
    print(
        "${UserResponse.fromMap(json.decode(response.body))} hehehehehehehehehehehehehehe he");
    if (response.statusCode == 200) {
      print("${UserResponse.fromMap(json.decode(response.body))} he");
      return UserResponse.fromMap(json.decode(response.body));
    } else {
      final err = UserResponse.fromMap(json.decode(response.body));
      throw Exception(" $err hhhh");
    }
  }

  static Future<ChangeUserResponse> changeUser(UserChange changeUser) async {
    final token = await AuthProses.getToken();
    print(token);
    final response = await http.put(Uri.parse("$baseUrl/user/update"),
        headers: headers(token), body: changeUser.toJson());
    if (response.statusCode == 200) {
      return ChangeUserResponse.fromMap(json.decode(response.body));
    } else {
      final err = ChangeUserResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }
}
