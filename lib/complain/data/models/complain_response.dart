import 'package:flutter/cupertino.dart';

class ComplainResponse {
  ComplainResponse({
    this.success,
    this.error,
  });

  factory ComplainResponse.fromJson(dynamic json) {
    var success = json['IsSuccssed'];
    String? error = json['Message'];

    var loginData =
    json['Obj'] != null && json['Obj'].isNotEmpty ? null : null;
    return ComplainResponse(error: error, success: success,);
  }

  bool? success;
  String? error;
}
