import 'package:classic_eccomerce/account/data/models/account_address.dart';

class GetAccountAddressResponse {
  GetAccountAddressResponse({
    this.success,
    // this.error,
    this.data,
  });

  factory GetAccountAddressResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    var data =
        json['data'] != null ? AccountAddress.fromJson(json['data']) : null;
    return GetAccountAddressResponse(data: data, success: success);
  }
  num? success;
  // List<dynamic>? error;
  AccountAddress? data;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (data != null) {
  //     map['data'] = data?.toJson();
  //   }
  //   return map;
  // }
}
