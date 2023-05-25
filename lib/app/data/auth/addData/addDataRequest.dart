import 'dart:convert';

class addDataRequest {
  String tingkat_kerusakan;
  String longitude;
  String latitude;
  String create_At;
  String img;
  

  addDataRequest({required this.tingkat_kerusakan, required this.longitude, required this.latitude, required this.create_At, required this.img});

  Map<String, dynamic> toMap() {
    return {"tingkat_kerusakan": tingkat_kerusakan, "longitude": longitude, "latitude": latitude, "longitude": create_At, "img": img};
  }

  String toJson() => json.encode(toMap());
}
