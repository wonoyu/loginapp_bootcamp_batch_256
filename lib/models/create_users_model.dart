// To parse this JSON data, do
//
//     final createUsersModel = createUsersModelFromJson(jsonString);

import 'dart:convert';

CreateUsersModel createUsersModelFromJson(String str) =>
    CreateUsersModel.fromJson(json.decode(str));

String createUsersModelToJson(CreateUsersModel data) =>
    json.encode(data.toJson());

class CreateUsersModel {
  CreateUsersModel({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory CreateUsersModel.fromJson(Map<String, dynamic> json) =>
      CreateUsersModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
