// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

class SignUpModel {
  String userName;
  String password;
  String platform;

  SignUpModel({
    this.userName,
    this.password,
    this.platform,
  });

  factory SignUpModel.fromRawJson(String str) => SignUpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    userName: json["userName"] == null ? null : json["userName"],
    password: json["password"] == null ? null : json["password"],
    platform: json["platform"] == null ? null : json["platform"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName == null ? null : userName,
    "password": password == null ? null : password,
    "platform": platform == null ? null : platform,
  };
}
