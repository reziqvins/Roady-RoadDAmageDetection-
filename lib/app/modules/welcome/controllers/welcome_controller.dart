import 'dart:async';

import 'package:bismillahcapston/app/data/auth/signin/signin_request.dart';
import 'package:bismillahcapston/app/data/auth/signup/signup_request.dart';
import 'package:bismillahcapston/app/data/authproses.dart';
import 'package:bismillahcapston/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bismillahcapston/app/data/authService.dart';

class WelcomeController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController re_password = TextEditingController();

  RxBool visibility = true.obs;
  RxBool visibilitys = true.obs;
  RxBool isLoadingLogin = false.obs;

  void doRegister(
      String name, String email, String password, String re_password) {
    isLoadingLogin.value = true;
    Timer(const Duration(seconds: 3), () {
      if (email.contains("@")) {
        authService
            .doRegister(SignUpRequest(
                name: name,
                email: email,
                password: password,
                re_password: re_password))
            .then((value) {
          Get.showSnackbar(GetSnackBar(
            message: value.message,
            title: "Success",
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16 / 2),
            duration: Duration(milliseconds: 2000),
          ));
          isLoadingLogin(false);
        }).catchError((value) {
          Get.showSnackbar(GetSnackBar(
            message: "$value",
            title: "Error",
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16 / 2),
            duration: const Duration(milliseconds: 2000),
          ));
          isLoadingLogin(false);
        });
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "Invalid email",
          title: "Error",
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16 / 2),
          duration: Duration(milliseconds: 2000),
        ));
      }
    });
  }

  void doLogin(String email, String password) {
    isLoadingLogin.value = true;
    Timer(const Duration(seconds: 3), () {
      authService
          .doLogin(SignInRequest(email: email, password: password))
          .then((value) {
        AuthProses.setLogin();
        print("${value.token}");
        AuthProses.setToken(value.token.toString());
        print("${AuthProses.getToken()} ${AuthProses.isLogin()} hehe");
        Get.showSnackbar(GetSnackBar(
            message: value.token,
            title: "Success",
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16 / 2),
            duration: const Duration(milliseconds: 2000)));
        Get.offAllNamed(Routes.DASHBOARD);
      }).catchError((value) {
        Get.showSnackbar(GetSnackBar(
            message: "$value",
            title: "Error",
            padding: EdgeInsets.all(16),
            margin: const EdgeInsets.all(16 / 2),
            duration: const Duration(milliseconds: 2000)));
      });

      isLoadingLogin(false);
    });
  }

  // Future oneTimeIsIt() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   var key = sharedPreferences.getBool("keys");
  //   print("key is $key");
  //   if (key != null) {
  //     if (key) {
  //       final isLogin = await authRepository.isLogin();
  //       print("$isLogin hehe");
  //       if (isLogin) {
  //         Get.put(DashboardController());
  //         Get.offAll(() => const DashboardView(),
  //             transition: Transition.upToDown,
  //             duration: const Duration(milliseconds: 600));
  //       }else{
  //          Get.offAll(() => const LoginView(),
  //             transition: Transition.upToDown,
  //             duration: const Duration(milliseconds: 600));
  //       }
       
  //     }
  //   } else {
  //     Get.offAll(() => const OnboardingView(),
  //         transition: Transition.upToDown,
  //         duration: const Duration(milliseconds: 600));
  //   }
  // }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    re_password.dispose();
    super.dispose();
  }
}
