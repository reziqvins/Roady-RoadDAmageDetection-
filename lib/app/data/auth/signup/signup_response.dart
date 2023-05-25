class SignUpResponse {
  String message;

  SignUpResponse({required this.message});

  factory SignUpResponse.fromMap(Map<String, dynamic> json) {
    return SignUpResponse( message: json["message"]);
  }
}
