import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:bismillahcapston/app/modules/kamera/views/kamera_view.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.WELCOME,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    ),
  );
}
