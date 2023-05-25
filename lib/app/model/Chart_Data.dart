class IndividualBar {
  int x;
  double y;

  IndividualBar({required this.x, required this.y});
}

class BarData {
  final double RusakRingan;
  final double RusakBerat;

  BarData({
    required this.RusakRingan,
    required this.RusakBerat,
  });

  List<IndividualBar> graph_datas = [];
  List<IndividualBar> graph_datas_mobile = [];

  void initializedBarData() {
    graph_datas = [
      IndividualBar(x: 1, y: RusakRingan),
      IndividualBar(x: 2, y: RusakBerat),
    ];
    graph_datas_mobile = [
      IndividualBar(x: 1, y: RusakRingan),
      IndividualBar(x: 2, y: RusakBerat),
    ];
  }
}

List<double> graph_datas = [
  10.0,
  20.0,
];
