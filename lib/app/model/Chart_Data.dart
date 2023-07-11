class IndividualBar {
  int x;
  double y;

  IndividualBar({required this.x, required this.y});
}

class BarData {
  final double Retak;
  final double Berlubang;

  BarData({
    required this.Retak,
    required this.Berlubang,
  });

  List<IndividualBar> graph_datas = [];
  List<IndividualBar> graph_datas_mobile = [];

  void initializedBarData() {
    graph_datas = [
      IndividualBar(x: 1, y: Retak),
      IndividualBar(x: 2, y: Berlubang),
    ];
    graph_datas_mobile = [
      IndividualBar(x: 1, y: Retak),
      IndividualBar(x: 2, y: Berlubang),
    ];
  }
}

List<double> graph_datas = [
  10.0,
  20.0,
];
