import 'package:bismillahcapston/app/modules/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff16222F),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
          ),
          onTap: () {
            Get.back();
          },
        ),
        title: Text("Lupa Password"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 250,
                child: Image.asset("assets/forgotPass.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lupa Password Kamu?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Masukan Email Kamu di bawah, dan dapatkan email penggantian password",
                style: TextStyle(fontSize: 15, color: primaryColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * 24,
                child: TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: "Masukan Email anda",
                    labelText: "keVinskuy@gmail.com",
                    suffixIcon: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(Icons.email_outlined)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * 24,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      controller.doChangePassword(
                          controller.email.text.toString().trim());
                    },
                    child: Text("Reset Password")),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
