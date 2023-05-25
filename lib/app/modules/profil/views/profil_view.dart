import 'package:bismillahcapston/app/data/authproses.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../theme/colors.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 30),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Image.asset("assets/pp.png"),
                height: 100,
                width: 100,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bang Kepins",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "KeVinskuy@gmail.com",
                    style: TextStyle(fontSize: 15, color: primaryColor),
                  ),
                ]),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Nama",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        fillColor: secondaryColor,
                        focusColor: secondaryColor,
                        hintText: "Masukan Nama lengkap anda",
                        labelText: "Bang Kepins",
                        suffixIcon: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(Icons.title)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20, height: 20),
                    TextFormField(
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
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Pasword",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20, height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "12345678",
                        labelText: "Password",
                        suffixIcon: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(Icons.password_outlined)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              backgroundColor: Colors.green[600],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                            child: const Text(
                              "Simpan",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => Get.toNamed(Routes.LOGIN)),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              backgroundColor: Colors.red[600],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                            child: const Text(
                              "Keluar",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              AuthProses.deleteToken();
                              AuthProses.isLogout();
                              Get.offAllNamed(Routes.WELCOME);
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
