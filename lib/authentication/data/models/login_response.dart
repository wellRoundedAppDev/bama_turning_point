import 'package:flutter/cupertino.dart';

class LoginResponse {
  LoginResponse({
    this.success,
    this.error,
    this.loginData,
  });

  factory LoginResponse.fromJson(dynamic json) {
    var success = json['success'];
    List<String>? error;
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add(v);
      });
    }
    var loginData =
        json['data'] != null ? LoginData.fromJson(json['data']) : null;
    return LoginResponse(error: error, success: success, loginData: loginData);
  }
  num? success;
  List<String>? error;
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

class LoginData {
  LoginData({
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
  });

  factory LoginData.fromJson(dynamic json) {
    var customerId = json['customer_id'];
    var customerGroupId = json['customer_group_id'];
    var storeId = json['store_id'];
    var languageId = json['language_id'];
    var firstname = json['firstname'];
    var lastname = json['lastname'];
    var email = json['email'];
    var telephone = json['telephone'];
    var fax = json['fax'];
    var wishlist =
        json['wishlist'] != null ? json['wishlist'].cast<String>() : [];
    var newsletter = json['newsletter'];
    var addressId = json['address_id'];
    var ip = json['ip'];
    var status = json['status'];
    var safe = json['safe'];
    var code = json['code'];
    var dateAdded = json['date_added'];
    // if (json['custom_fields'] != null) {
    //   customFields = [];
    //   json['custom_fields'].forEach((v) {
    //     customFields?.add(Dynamic.fromJson(v));
    //   });
    // }
    //accountCustomField = json['account_custom_field'] != null ? AccountCustomField.fromJson(json['account_custom_field']) : null;
    var wishlistTotal = json['wishlist_total'];
    var cartCountProducts = json['cart_count_products'];
    return LoginData(
      dateAdded: dateAdded,
      email: email,
      telephone: telephone,
      lastname: lastname,
      firstname: firstname,
      addressId: addressId,
      storeId: storeId,
      languageId: languageId,
      customerId: customerId,
      cartCountProducts: cartCountProducts,
      fax: fax,
      ip: ip,
      newsletter: newsletter,
      safe: safe,
      wishlist: wishlist,
      wishlistTotal: wishlistTotal,
      customerGroupId: customerGroupId,
      code: code,
      status: status,
    );
  }
  String? customerId;
  String? customerGroupId;
  String? storeId;
  String? languageId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? fax;
  List<String>? wishlist;
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
