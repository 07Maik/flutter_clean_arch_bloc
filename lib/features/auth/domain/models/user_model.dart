import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.username = "",
    this.firstName = "",
    this.lastName = "",
    this.password = "",
    this.token,
  });

  final String username;
  final String firstName;
  final String lastName;
  final String? token;
  final String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "token": token,
        "password": password,
      };
}
