import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../theme/colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DejaRu'),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(right: 25, left: 25),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 31, 30, 30),
                    ),
                  ),
                  Image.asset('assets/Login.png', height: 250, width: 250),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Masukan Email",
                      labelText: "Email",
                      suffixIcon: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(Icons.email_outlined)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != "" || value != " ") {
                        return "Field cannot be empety";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(width: 20, height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Masukan Password",
                      labelText: "Password",
                      suffixIcon: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(Icons.password_outlined)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value != "" || value != " ") {
                        return "Field cannot be empety";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        minimumSize: const Size(300, 50),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Get.toNamed(Routes.DASHBOARD)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 70),
                      const Text("have'nt an account ?"),
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.WELCOME),
                        child: Text("Register now"),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
