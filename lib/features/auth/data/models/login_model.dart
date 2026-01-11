import 'dart:convert';

AuthModel loginModelFromJson(String str) =>
    AuthModel.fromJson(json.decode(str));

String loginModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final dynamic code;
  final String? message;
  final Data? data;

  AuthModel({this.code, this.message, this.data});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
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
  final String? token;
  final String? name;
  final String? email;
  final String? image;

  Data({this.token, this.name, this.email, this.image});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    name: json["name"],
    email: json["email"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "name": name,
    "email": email,
    "image": image,
  };
}

// // To parse this JSON data, do
// //
// //     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';

// AuthModel userModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

// String userModelToJson(AuthModel data) => json.encode(data.toJson());

// class AuthModel {
//   final String? name;
//   final String? email;
//   final String? image;
//   final dynamic address;
//   final String? visa;
//   final String? token;

//   AuthModel({
//     this.name,
//     this.email,
//     this.image,
//     this.address,
//     this.visa,
//     this.token,
//   });

//   factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
//     name: json["name"],
//     email: json["email"],
//     image: json["image"],
//     address: json["address"],
//     visa: json["Visa"],
//     token: json["token"],
//   );

//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "email": email,
//     "image": image,
//     "address": address,
//     "Visa": visa,
//     "token": token,
//   };
// }
