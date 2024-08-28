// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    User user;
    String accessToken;
    String refreshToken;

    Welcome({
        required this.user,
        required this.accessToken,
        required this.refreshToken,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        user: User.fromJson(json["user"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };
}

class User {
    String id;
    String username;
    String name;
    String role;


    User({
        required this.id,
        required this.username,
        required this.name,
        required this.role,

    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        name: json["name"],
        role: json["role"],

    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "name": name,
        "role": role,

    };
}
