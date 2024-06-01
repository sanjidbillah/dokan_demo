// To parse this JSON data, do
//
//     final authSignInResModel = authSignInResModelFromJson(jsonString);

import 'dart:convert';

AuthSignInResModel authSignInResModelFromJson(String str) =>
    AuthSignInResModel.fromJson(json.decode(str));

String authSignInResModelToJson(AuthSignInResModel data) =>
    json.encode(data.toJson());

class AuthSignInResModel {
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  AuthSignInResModel({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  factory AuthSignInResModel.fromJson(Map<String, dynamic> json) =>
      AuthSignInResModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
      };
}
