import 'dart:convert';

class addDataRequest {
  String tingkat_kerusakan;
  String lokasi;
  String created_At;
  String img;

  addDataRequest(
      {required this.tingkat_kerusakan,
      required this.lokasi,
      required this.created_At,
      required this.img});

  Map<String, dynamic> toMap() {
    return {
      "tingkat_kerusakan": tingkat_kerusakan,
      "lokasi": lokasi,
      "created_At": created_At,
      "img": img
    };
  }

  String toJson() => json.encode(toMap());
}
