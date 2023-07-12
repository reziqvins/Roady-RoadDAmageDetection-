import 'package:bismillahcapston/app/data/dataResponse.dart';
import 'package:bismillahcapston/app/model/Chart_Data.dart';
import 'package:bismillahcapston/app/modules/home/views/component/bar_Chart.dart';
import 'package:bismillahcapston/app/modules/home/views/component/visualisasi.dart';
import 'package:bismillahcapston/app/routes/app_pages.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../theme/colors.dart';
import '../controllers/home_controller.dart';

import '../../../model/kondisi.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                backgroundColor: primaryColor,
                expandedHeight: bodyHeight * 0.1,
                flexibleSpace: Stack(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/pp.png"),
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 2))),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Haloo Bang Kepins, Selamat datang!!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
              child: Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(
                      'Statistik',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Obx(() {
                    if (controller.jalan2.isNotEmpty) {
                      return BarGraph(graph_data: controller.jalan2);
                    } else {
                      return BarGraph(graph_data: graph_datas);
                    }
                  }),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(
                      'Analytic Overview',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: rberat,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            height: 100,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Berlubang',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 12.0),
                                      child: Obx(
                                        () => Text(
                                            "${controller.countBerlubang}",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: rringan,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            height: 100,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Retak',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 12.0),
                                      child: Obx(
                                        () => Text("${controller.countRetak}",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text('List Jalan Rusak',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Obx(() {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.jalan.length,
                      itemBuilder: (context, index) {
                        // final GasDetail gas = gasList[index];
                        return InkWell(
                            onTap: () {},
                            child: Card_Kondisi(jalan: controller.jalan[index])
                            // ? Card_Shimmer()
                            // : Card_Gas(gas: controller.gas[index]);

                            );
                      },
                    );
                  }),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}

class Card_Kondisi extends StatelessWidget {
  Jalan jalan;

  Card_Kondisi({
    super.key,
    required this.jalan,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 14, left: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      topLeft: Radius.circular(6))),
              child: Image.network(jalan.img, fit: BoxFit.fill),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      jalan.created_At,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    jalan.tingkat_kerusakan,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("${jalan.lokasi}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
