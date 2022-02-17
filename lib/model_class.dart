// To parse this JSON data, do
//
//     final modelFakeApi = modelFakeApiFromJson(jsonString);

import 'dart:convert';

List<ModelFakeApi> modelFakeApiFromJson(String str) => List<ModelFakeApi>.from(json.decode(str).map((x) => ModelFakeApi.fromJson(x)));

String modelFakeApiToJson(List<ModelFakeApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelFakeApi {
  ModelFakeApi({
    required this.userId,
    required this.id,
    required this.title,
  });

  int userId;
  int id;
  String title;

  factory ModelFakeApi.fromJson(Map<String, dynamic> json) => ModelFakeApi(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
  };
}
