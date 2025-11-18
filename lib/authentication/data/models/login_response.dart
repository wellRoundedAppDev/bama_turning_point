import 'package:flutter/cupertino.dart';

class LoginResponse {
  LoginResponse({
    this.success,
    this.error,
    this.loginData,
  });

  factory LoginResponse.fromJson(dynamic json) {
    var success = json['IsSuccssed'];
    String? error= json['Message'];

    var loginData =
         json['Obj'] != null && json['Obj'].isNotEmpty ? LoginData.fromJson(json['Obj']) : null;
    return LoginResponse(error: error, success: success, loginData: loginData);
  }
  bool? success;
  String? error;
  LoginData? loginData;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (loginData != null) {
  //     map['data'] = loginData?.toJson();
  //   }
  //   return map;
  // }
}

// class LoginData2 {
//   String? token;
//   bool? isAuthencated;
//   String? expiresOn;
//   Null? role;
//   User? user;
//   bool? isPasswordStrong;
//   Null? message;
//
//   LoginData2(
//       {this.token,
//         this.isAuthencated,
//         this.expiresOn,
//         this.role,
//         this.user,
//         this.isPasswordStrong,
//         this.message});
//
//   LoginData2.fromJson(Map<String, dynamic> json) {
//     token = json['Token'];
//     isAuthencated = json['IsAuthencated'];
//     expiresOn = json['ExpiresOn'];
//     role = json['Role'];
//     user = json['User'] != null ? new User.fromJson(json['User']) : null;
//     isPasswordStrong = json['IsPasswordStrong'];
//     message = json['Message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Token'] = this.token;
//     data['IsAuthencated'] = this.isAuthencated;
//     data['ExpiresOn'] = this.expiresOn;
//     data['Role'] = this.role;
//     if (this.user != null) {
//       data['User'] = this.user!.toJson();
//     }
//     data['IsPasswordStrong'] = this.isPasswordStrong;
//     data['Message'] = this.message;
//     return data;
//   }
// }

class User {
  String? id;
  String? fullName;
  String? typeAccountText;
  int? typeAccountValue;

  User({this.id, this.fullName, this.typeAccountText, this.typeAccountValue});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    fullName = json['FullName'];
    typeAccountText = json['TypeAccountText'];
    typeAccountValue = json['TypeAccountValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['FullName'] = this.fullName;
    data['TypeAccountText'] = this.typeAccountText;
    data['TypeAccountValue'] = this.typeAccountValue;
    return data;
  }
}

class LoginData {
  LoginData({
    this.token,
    this.isAuthencated,
    this.expiresOn,
    this.role,
    this.user,
    this.isPasswordStrong,
    this.message,
    //
    this.customerId,
    this.customerGroupId,
    this.storeId,
    this.languageId,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
    this.fax,
    this.wishlist,
    this.newsletter,
    this.addressId,
    this.ip,
    this.status,
    this.safe,
    this.code,
    this.dateAdded,
    // this.customFields,
    // this.accountCustomField,
    this.wishlistTotal,
    this.cartCountProducts,
    this.employeeId

  });

  factory LoginData.fromJson(dynamic json) {
   var token = json['Token'];
   var employeeId = json['EmployeeId'];
   // var isAuthencated = json['IsAuthencated'];
   // var  expiresOn = json['ExpiresOn'];
   // var  role = json['Role'];
   // var  user = json['User'] != null ? new User.fromJson(json['User']) : null;
   // var  isPasswordStrong = json['IsPasswordStrong'];
   // var  message = json['Message'];
   // //
   //  var customerId = json['customer_id'];
   //  var customerGroupId = json['customer_group_id'];
   //  var storeId = json['store_id'];
   //  var languageId = json['language_id'];
   //  var firstname = json['firstname'];
   //  var lastname = json['lastname'];
   //  var email = json['email'];
   //  var telephone = json['telephone'];
   //  var fax = json['fax'];
   // var wishlist = json['wishlist'] != null
   //     ? List<String>.from(json['wishlist'].map((item) => item.toString()))
   //     : [];
   //  var newsletter = json['newsletter'];
   //  var addressId = json['address_id'];
   //  var ip = json['ip'];
   //  var status = json['status'];
   //  var safe = json['safe'];
   //  var code = json['code'];
   //  var dateAdded = json['date_added'];
   //  // if (json['custom_fields'] != null) {
   //  //   customFields = [];
   //  //   json['custom_fields'].forEach((v) {
   //  //     customFields?.add(Dynamic.fromJson(v));
   //  //   });
   //  // }
   //  //accountCustomField = json['account_custom_field'] != null ? AccountCustomField.fromJson(json['account_custom_field']) : null;
   //  var wishlistTotal = json['wishlist_total'];
   //  var cartCountProducts = json['cart_count_products'];
    return LoginData(

      token: token,
    employeeId: employeeId,
    // isAuthencated:isAuthencated,
    // expiresOn:expiresOn,
    // role:role,
    // user:user,
    // isPasswordStrong:isPasswordStrong,
    // message:message,
    //   //
    //   dateAdded: dateAdded,
    //   email: email,
    //   telephone: telephone,
    //   lastname: lastname,
    //   firstname: firstname,
    //   addressId: addressId,
    //   storeId: storeId,
    //   languageId: languageId,
    //   customerId: customerId,
    //   cartCountProducts: cartCountProducts,
    //   fax: fax,
    //   ip: ip,
    //   newsletter: newsletter,
    //   safe: safe,
    //   wishlist: wishlist,
    //   wishlistTotal: wishlistTotal,
    //   customerGroupId: customerGroupId,
    //   code: code,
    //   status: status,
    );
  }
  String? token;
  bool? isAuthencated;
  String? expiresOn;
  Null? role;
  User? user;
  bool? isPasswordStrong;
  Null? message;
  //
  String? customerId;
  String? customerGroupId;
  String? storeId;
  String? languageId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? fax;
  List<dynamic>? wishlist;
  String? newsletter;
  String? addressId;
  String? ip;
  String? status;
  String? safe;
  String? code;
  String? dateAdded;
  List<dynamic>? customFields;
  String? wishlistTotal;
  num? cartCountProducts;
  int? employeeId;
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['customer_id'] = customerId;
  //   map['customer_group_id'] = customerGroupId;
  //   map['store_id'] = storeId;
  //   map['language_id'] = languageId;
  //   map['firstname'] = firstname;
  //   map['lastname'] = lastname;
  //   map['email'] = email;
  //   map['telephone'] = telephone;
  //   map['fax'] = fax;
  //   map['wishlist'] = wishlist;
  //   map['newsletter'] = newsletter;
  //   map['address_id'] = addressId;
  //   map['ip'] = ip;
  //   map['status'] = status;
  //   map['safe'] = safe;
  //   map['code'] = code;
  //   map['date_added'] = dateAdded;
  //   if (customFields != null) {
  //     map['custom_fields'] = customFields?.map((v) => v.toJson()).toList();
  //   }
  //   if (accountCustomField != null) {
  //     map['account_custom_field'] = accountCustomField?.toJson();
  //   }
  //   map['wishlist_total'] = wishlistTotal;
  //   map['cart_count_products'] = cartCountProducts;
  //   return map;
  // }
}
