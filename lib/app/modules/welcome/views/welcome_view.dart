import 'package:bismillahcapston/app/modules/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff16222F),
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/welcome.png",
                  height: 333,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Selamat Datang",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Deteksi jalan rusak untuk membantu masyarakat dalam pelaporan",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 120,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * 24,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (context) => Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(top: 25),
                        child: Wrap(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Haloo",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Buat Akun Yukk..",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                TextFormField(
                                  controller: controller.name,
                                  decoration: InputDecoration(
                                    hintText: "Masukan Nama",
                                    labelText: "Nama",
                                    suffixIcon: const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Icon(Icons.title)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
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
                                  controller: controller.email,
                                  decoration: InputDecoration(
                                    hintText: "Masukan Email",
                                    labelText: "Email",
                                    suffixIcon: const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Icon(Icons.email_outlined)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
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
                                  controller: controller.password,
                                  decoration: InputDecoration(
                                    hintText: "Masukan Password",
                                    labelText: "Password",
                                    suffixIcon: const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Icon(Icons.password_outlined)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
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
                                const SizedBox(width: 20, height: 20),
                                TextFormField(
                                  controller: controller.re_password,
                                  decoration: InputDecoration(
                                    hintText: "Masukan Ulang Password",
                                    labelText: "Re-Password",
                                    suffixIcon: const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Icon(Icons.password_outlined)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    minimumSize: const Size(300, 50),
                                  ),
                                  child: const Text(
                                    "Buat Akun",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    controller.doRegister(
                                        controller.name.text.toString(),
                                        controller.email.text.toString(),
                                        controller.password.text.toString(),
                                        controller.re_password.text.toString());
                                  },
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Buat Akun",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * 24,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (context) => Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(top: 25),
                        child: Wrap(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Haloo",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Masuk Ke Aplikasi Yukk..",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(width: 20, height: 20),
                                TextFormField(
                                  controller: controller.email,
                                  decoration: InputDecoration(
                                    hintText: "Masukan Email",
                                    labelText: "Email",
                                    suffixIcon: const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Icon(Icons.email_outlined)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
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
                                  controller: controller.password,
                                  decoration: InputDecoration(
                                    hintText: "Masukan Password",
                                    labelText: "Password",
                                    suffixIcon: const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Icon(Icons.password_outlined)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
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
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    child: Text(
                                      "Lupa Password??",
                                      style: TextStyle(color: primaryColor),
                                    ),
                                    onPressed: () {
                                      Get.toNamed(Routes.FORGOT_PASSWORD);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 3,
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    minimumSize: const Size(300, 50),
                                  ),
                                  child: const Text(
                                    "Masuk Yuk",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    controller.doLogin(
                                        controller.email.text.toString(),
                                        controller.password.text.toString());
                                  },
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff16222F),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: primaryColor, width: 3),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: Text("All Rights Reserved @bubadibakoTeam",
                      style: TextStyle(fontSize: 10, color: Colors.white)))
            ],
          ),
        ),
      ),
    );
  }
}
