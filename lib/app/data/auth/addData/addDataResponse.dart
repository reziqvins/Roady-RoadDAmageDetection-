class addDataResponse {
  String? message ;
  addDataResponse({required this.message});

  factory addDataResponse.fromMap(Map<String,dynamic> json){
    return addDataResponse (message: json["message"]);
  }
}
