import 'dart:async';
import 'package:bismillahcapston/app/data/auth/forgot_Pasword/forgotPass_request.dart';
import 'package:bismillahcapston/app/data/authService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoadingChangePassword = false.obs;
  TextEditingController email = new TextEditingController();

  void   doChangePassword(String email) {
    isLoadingChangePassword.value = true;
    isLoadingChangePassword(true);
    Timer(const Duration(seconds: 3), () {
      authService
          .doChagePassword(ChangePasswordRequest(email: email))
          .then((value) {
        Get.showSnackbar(GetSnackBar(
            message: value.message,
            title: "Success",
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16 / 2),
            duration: const Duration(milliseconds: 2000)));
      }).catchError((value) {
        Get.showSnackbar(GetSnackBar(
            message: value.message,
            title: "Error",
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16 / 2),
            duration: const Duration(milliseconds: 2000)));
      });
    });

    isLoadingChangePassword(false);
  }
}
