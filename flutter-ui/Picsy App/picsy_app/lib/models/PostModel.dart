import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

@JsonSerializable()
class Post {
  Post({
    required this.data,
  });

  List<Datum>? data;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  int? id;
  int? userId;
  String? title;
  String? body;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "body": body,
      };
}
