import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class Jalan {
  String createAt;
  String id;
  String img;
  double latitude;
  double longitude;
  String tingkat_kerusakan;

  Jalan(
      {required this.createAt,
      required this.id,
      required this.img,
      required this.latitude,
      required this.longitude,
      required this.tingkat_kerusakan});

  factory Jalan.fromMap(Map<String, dynamic> json) {
    return Jalan(
      createAt: json["create_at"],
      id: json["id"],
      img: json["img"],
      latitude: json["latitude"],
      longitude: json["longitude"],
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
