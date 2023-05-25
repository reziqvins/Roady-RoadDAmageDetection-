import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bismillahcapston/app/model/Chart_Data.dart';

import '../../../theme/colors.dart';

class BarGraph extends StatelessWidget {
  final List graph_data;
  const BarGraph({Key? key, required this.graph_data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      RusakRingan: graph_data[0],
      RusakBerat: graph_data[1],
    );
    myBarData.initializedBarData();
    return Container(
        height: 250,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: chart,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            const Text(
              "Visualisasi Data",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              // height: 450,
              child: BarChart(BarChartData(
                  maxY: 20,
                  minY: 0,
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                      show: true,
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: getBottomGraphBarValue))),
                  barGroups: myBarData.graph_datas
                      .map((data) => BarChartGroupData(x: data.x, barRods: [
                            BarChartRodData(
                                toY: data.y,
                                color: secondaryColor,
                                width: 100,
                                borderRadius: BorderRadius.circular(6),
                                backDrawRodData: BackgroundBarChartRodData(
                                    show: false,
                                    toY: 20,
                                    color: Colors.grey[200])),
                          ]))
                      .toList())),
            ),
          ],
        ));
  }
}

Widget getBottomGraphBarValue(double y, TitleMeta tittle) {
  Widget text;
  switch (y.toInt()) {
    case 1:
      text = const Text("Rusak Berat");
      break;
    case 2:
      text = const Text("Rusak Ringan");
      break;

    default:
      text = const Text(" ");
  }

  return SideTitleWidget(child: text, axisSide: tittle.axisSide);
}
