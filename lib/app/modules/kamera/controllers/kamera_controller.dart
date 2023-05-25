import 'dart:async';

import 'package:bismillahcapston/app/data/auth/addData/addDataRequest.dart';
import 'package:bismillahcapston/app/data/authService.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:bismillahcapston/app/data/authproses.dart';
import 'package:bismillahcapston/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KameraController extends GetxController {
  var location = 'Null, Press Button'.obs;
  var address = 'search'.obs;

  @override
  void onInit() async {
    super.onInit();
    // You can add initialization logic here
    Position position = await _getGeoLocationPosition();

    getAddressFromLatLong(position);
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      address.value =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}';
      print("${address.value} memek");
      location.value = address.value;
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString());
    }
  }

  RxBool isLoadingLogin = false.obs;
  final AuthService = authService();

  void addData(String tingkat_kerusakan, String longitude, String latitude,
      String create_At, String img) {
    isLoadingLogin.value = true;
    Timer(const Duration(seconds: 3), () {
      AuthService.addData(addDataRequest(
              tingkat_kerusakan: tingkat_kerusakan,
              longitude: longitude,
              latitude: latitude,
              create_At: create_At,
              img: img))
          .then((value) {
        print("${value.message}");
        AuthProses.setToken(value.message.toString());
        print("${AuthProses.getToken()}");
        Get.showSnackbar(GetSnackBar(
            message: value.message,
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
}
