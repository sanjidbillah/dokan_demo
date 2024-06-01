// To parse this JSON data, do
//
//     final authPayload = authPayloadFromJson(jsonString);

import 'dart:convert';

AuthPayload authPayloadFromJson(String str) =>
    AuthPayload.fromJson(json.decode(str));

String authPayloadToJson(AuthPayload data) => json.encode(data.toJson());

class AuthPayload {
  String? username;
  String? email;
  String? password;

  AuthPayload({
    this.username,
    this.email,
    this.password,
  });

  factory AuthPayload.fromJson(Map<String, dynamic> json) => AuthPayload(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}
