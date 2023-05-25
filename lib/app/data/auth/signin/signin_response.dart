class SignInResponse {
  String? token;
  SignInResponse({required this.token});

  factory SignInResponse.fromMap(Map<String,dynamic> json){
    return SignInResponse (token: json["token"]);
  }
}
