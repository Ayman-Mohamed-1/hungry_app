import 'package:flutter/cupertino.dart';

class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message']?.toString() ?? 'Unknown error',
      code: json['code'] is int
          ? json['code']
          : int.tryParse(json['code']?.toString() ?? '') ?? -1,
    );
  }

  String errorString() {
    return "Error: $message , StatusCode: $code";
  }
}
