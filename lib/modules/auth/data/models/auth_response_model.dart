// To parse this JSON data, do
//
//     final authResModel = authResModelFromJson(jsonString);

import 'dart:convert';

AuthResModel authResModelFromJson(String str) =>
    AuthResModel.fromJson(json.decode(str));

String authResModelToJson(AuthResModel data) => json.encode(data.toJson());

class AuthResModel {
  int? code;
  String? message;
  Data? data;

  AuthResModel({
    this.code,
    this.message,
    this.data,
  });

  factory AuthResModel.fromJson(Map<String, dynamic> json) => AuthResModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? status;

  Data({
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
