// To parse this JSON data, do
//
//     final profileUpdatePayload = profileUpdatePayloadFromJson(jsonString);

import 'dart:convert';

String profileUpdatePayloadToJson(ProfileUpdatePayload data) =>
    json.encode(data.toJson());

class ProfileUpdatePayload {
  int? id;
  String? name;
  String? email;
  String? description;

  ProfileUpdatePayload({
    this.id,
    this.email,
    this.name,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "description": description,
      };
}
