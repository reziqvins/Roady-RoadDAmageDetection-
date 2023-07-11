import 'dart:convert';

class UserResponse {
  String status;
  User data;

  UserResponse({required this.status, required this.data});

  factory UserResponse.fromMap(Map<String, dynamic> json) {
    return UserResponse(
        status: json["status"], data: User.fromMap(json["data"]));
  }
}

class ChangeUserResponse {
  String message;

  ChangeUserResponse({required this.message});

  factory ChangeUserResponse.fromMap(Map<String, dynamic> json) {
    return ChangeUserResponse(message: json["message"]);
  }
}

class UserChange {
  String email;
  String name;

  UserChange({required this.email, required this.name});

  Map<String, dynamic> toMap() => {"email": this.email, "name": this.name};


  String toJson() => json.encode(toMap());
}

class User {
  int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromMap(Map<String, dynamic> json) {
    return User(id: json["id"], name: json["name"], email: json["email"]);
  }
}
