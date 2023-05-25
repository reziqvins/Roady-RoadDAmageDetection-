import 'dart:convert';

class SignUpRequest {
  String name;
  String email;
  String password;
  String re_password;

  SignUpRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.re_password,
  });

  Map<String, dynamic> toMap(){
    return{"name":name, "email":email, "password":password, "re_password":re_password};
  }

  String toJson() => json.encode(toMap());
}
