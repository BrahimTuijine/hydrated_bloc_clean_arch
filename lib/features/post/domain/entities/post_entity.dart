// To parse this JSON data, do
//
//     final postEntity = postEntityFromJson(jsonString);

import 'dart:convert';

PostEntity postEntityFromJson(String str) => PostEntity.fromJson(json.decode(str));

String postEntityToJson(PostEntity data) => json.encode(data.toJson());

class PostEntity {
    final int? userId;
    final int? id;
    final String? title;
    final String? body;

    PostEntity({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    PostEntity copyWith({
        int? userId,
        int? id,
        String? title,
        String? body,
    }) => 
        PostEntity(
            userId: userId ?? this.userId,
            id: id ?? this.id,
            title: title ?? this.title,
            body: body ?? this.body,
        );

    factory PostEntity.fromJson(Map<String, dynamic> json) => PostEntity(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
