import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:get/get.dart';

import '../controllers/kamera_controller.dart';
import 'camera.dart';

late List<CameraDescription> cameras;

class KameraView extends GetView<KameraController> {
  const KameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraScreen(cameras),
    );
  }
}
