import 'package:bismillahcapston/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HotelKu'),
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
                    "Register",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 31, 30, 30),
                    ),
                  ),
                  // Image.asset('assets/images/register.png',
                  //     height: 250, width: 250),
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
                        backgroundColor: const Color.fromARGB(255, 31, 109, 36),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        minimumSize: const Size(300, 50),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Get.toNamed(Routes.LOGIN)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 70),
                      const Text("have an account ?"),
                      TextButton(
                        onPressed: () => Get.back(),
                        child: Text("Login Now"),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
