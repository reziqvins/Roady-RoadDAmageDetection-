import 'package:bismillahcapston/app/data/dataResponse.dart';
import 'package:get/get.dart';
import 'package:bismillahcapston/app/data/dataService.dart';

class HomeController extends GetxController {
  final dataService = DataService();
  RxList jalan = <Jalan>[].obs;

  @override
  void onInit() {
    getAllJalan();
    super.onInit();
  }

  void getAllJalan()  {
    dataService.getAllJalan().then((value) {
      jalan.addAll(value.dataJalan);
      print(value.dataJalan);
      print(Jalan);
    }).catchError((value) {
      print(value);
    });
  }
}
