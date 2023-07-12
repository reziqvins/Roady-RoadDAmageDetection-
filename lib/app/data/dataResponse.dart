import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class Jalan {
  String created_At;
  String id;
  String img;
  String lokasi;
  String tingkat_kerusakan;

  Jalan(
      {required this.created_At,
      required this.id,
      required this.img,
      required this.lokasi,
      required this.tingkat_kerusakan});

  factory Jalan.fromMap(Map<String, dynamic> json) {
    return Jalan(
      created_At: json["created_At"],
      id: json["id"],
      img: json["img"],
      lokasi: json["lokasi"],
      tingkat_kerusakan: json["tingkat_kerusakan"],
    );
  }
}

class JalanResponse {
  List<Jalan> dataJalan;
  String message;

  JalanResponse({required this.message, required this.dataJalan});

  factory JalanResponse.fromMap(Map<String, dynamic> json) {
    return JalanResponse(
        dataJalan: List<Jalan>.from(
            (json["data"] as List).map((e) => Jalan.fromMap(e))),
        message: json["message"]);
  }
}
