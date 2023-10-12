import 'account_address.dart';

class GetAccountAddressesResponse {
  GetAccountAddressesResponse({
    this.success,
    //this.error,
    this.data,
  });

  factory GetAccountAddressesResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    var data = json['data'].isEmpty?null:json['data'] != null ? Data.fromJson(json['data']) : null;
    return GetAccountAddressesResponse(success: success, data: data);
  }
  num? success;
  //List<dynamic>? error;
  Data? data;

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

class Data {
  Data({
    this.addresses,
  });

  List<AccountAddress>? addresses;
  factory Data.fromJson(Map<String,dynamic> json) {
    print(json['addresses']);
    List<AccountAddress>? addresses;
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(AccountAddress.fromJson(v));
      });
    }
    return Data(
      addresses: addresses,
    );
  }
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   if (addresses != null) {
  //     map['addresses'] = addresses?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}


// class CustomField {
//   CustomField({
//       this.,});
//
//   CustomField.fromJson(dynamic json) {
//      = json['3'];
//   }
//   String? ;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['3'] = ;
//     return map;
//   }
//
// }
