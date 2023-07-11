import 'package:device_apps/device_apps.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) async {
    tabIndex = index;
    print("$tabIndex hehehe: ");
    if (tabIndex == 1) {
      DeviceApps.openApp('org.tensorflow.lite.examples.objectdetection');
    }
    update();
  }
}
