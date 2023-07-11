import 'package:bismillahcapston/app/data/auth/user/user_response.dart';
import 'package:bismillahcapston/app/data/authService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {
  final email1 = TextEditingController();
  final name = TextEditingController();

  Rx<String> username = "".obs;
  Rx<String> email = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getCurrentUser();
    super.onInit();
  }

  void getCurrentUser() {
    authService.currentUser().then((value) {
      username(value.data.name);
      email(value.data.email);
    }).catchError((e) {
      print("$e hhhhhhh");
    });
  }

  void updateUser(UserChange userChange) {
    authService.changeUser(userChange).then((value) {
      getCurrentUser();
      Get.snackbar("Success", value.message);
    }).catchError((e) {
      print("$e hhhhhhh");
    });
  }
}
