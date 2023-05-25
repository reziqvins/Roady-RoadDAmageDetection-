import 'dart:convert';

class ChangePasswordRequest {
  String email;

  ChangePasswordRequest({required this.email});

  Map<String, dynamic> toMap() {
    return {"email": email};
  }

  String toJson() => json.encode(toMap());
}