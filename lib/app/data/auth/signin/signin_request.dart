import 'dart:convert';

class SignInRequest {
  String email;
  String password;

  SignInRequest({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {"email": email, "password": password};
  }

  String toJson() => json.encode(toMap());
}
