import 'dart:convert';

class ChangePasswordResponse {
  String message;

  ChangePasswordResponse({required this.message});

  factory ChangePasswordResponse.fromMap(Map<String, dynamic> json) {
    return ChangePasswordResponse(message: json["message"]);
  }
}