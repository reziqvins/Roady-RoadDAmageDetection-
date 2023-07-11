import 'dart:convert';
import 'package:bismillahcapston/app/data/dataResponse.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://kuro.asrofur.me:6969";
// const baseUrl = "web-service-production-0f42.up.railway.app";
// const baseUrl = "https://web-service-production-498a.up.railway.app";

class DataService {
  Future<JalanResponse> getAllJalan() async {
    final response = await http.get(
      Uri.parse("$baseUrl/kondisi"),
    );
    print("${response.body} ${response.statusCode} heheheheheheh");
    if (response.statusCode == 200) {
      return JalanResponse.fromMap(json.decode(response.body));
    } else {
      final err = JalanResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message} cccccccc");
    }
  }
}
