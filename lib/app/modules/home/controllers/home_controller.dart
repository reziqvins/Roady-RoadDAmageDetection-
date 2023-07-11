import 'dart:ffi';

import 'package:bismillahcapston/app/data/dataResponse.dart';
import 'package:get/get.dart';
import 'package:bismillahcapston/app/data/dataService.dart';

class HomeController extends GetxController {
  final dataService = DataService();
  RxList jalan = <Jalan>[].obs;
  RxList jalan1 = <int>[].obs;
  RxList jalan2 = <double>[].obs;
  RxInt countRetak = 0.obs;
  RxInt countBerlubang = 0.obs;

  @override
  void onInit() {
    getAllJalan();
    super.onInit();
  }

  void getAllJalan() {
    dataService.getAllJalan().then((value) {
      jalan.addAll(value.dataJalan);
      print("cek 222222");
      jalan.forEach((e) {
        if (e.tingkat_kerusakan == "Retak") {
          countRetak.value += 1;
          jalan1.add(1);

          print("cek 1");
        } else {
          jalan1.add(2);
          print("cek 2");
          countBerlubang.value += 1;
        }
      });

      if (countBerlubang != 0 && countRetak != 0) {
        jalan2.add(countBerlubang.value.toDouble());
        jalan2.add(countRetak.value.toDouble());
      }
      print("$jalan2 cek 2");
      print(value.dataJalan);
      print(jalan1);
    }).catchError((value) {
      print("$value hehehehehhhhhhh");
    });
  }
}
