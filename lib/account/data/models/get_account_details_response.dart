class GetAccountDetailsResponse {
  GetAccountDetailsResponse({
    this.success,
    // this.error,
    this.account,
  });

  factory GetAccountDetailsResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    var data = json['data'] != null ? Account.fromJson(json['data']) : null;
    return GetAccountDetailsResponse(account: data, success: success);
  }
  num? success;
  //List<dynamic>? error;
  Account? account;

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

class Account {
  Account({
    this.customerId,
    this.customerGroupId,
    this.storeId,
    this.languageId,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
    // this.fax,
    // this.cart,
    // this.wishlist,
    // this.newsletter,
    // this.addressId,
    // this.ip,
    // this.status,
    // this.safe,
    // this.token,
    // this.code,
    // this.dateAdded,
    // this.accountCustomField,
    // this.rewardTotal,
    // this.userBalance,
  });

  factory Account.fromJson(dynamic json) {
    var customerId = json['customer_id'];
    var customerGroupId = json['customer_group_id'];
    var storeId = json['store_id'];
    var languageId = json['language_id'];
    var firstname = json['firstname'];
    var lastname = json['lastname'];
    var email = json['email'];
    var telephone = json['telephone'];
    // var fax = json['fax'];
    // var cart = json['cart'];
    // varwishlist = json['wishlist'];
    // newsletter = json['newsletter'];
    // addressId = json['address_id'];
    // ip = json['ip'];
    // status = json['status'];
    // safe = json['safe'];
    // token = json['token'];
    // code = json['code'];
    // dateAdded = json['date_added'];
    // accountCustomField = json['account_custom_field'] != null ? AccountCustomField.fromJson(json['account_custom_field']) : null;
    // rewardTotal = json['reward_total'];
    // userBalance = json['user_balance'];
    return Account(
        customerGroupId: customerGroupId,
        customerId: customerId,
        email: email,
        firstname: firstname,
        languageId: languageId,
        lastname: lastname,
        storeId: storeId,
        telephone: telephone);
  }
  String? customerId;
  String? customerGroupId;
  String? storeId;
  String? languageId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  // String? fax;
  // String? cart;
  // String? wishlist;
  // String? newsletter;
  // String? addressId;
  // String? ip;
  // String? status;
  // String? safe;
  // String? token;
  // String? code;
  // String? dateAdded;
  // AccountCustomField? accountCustomField;
  // String? rewardTotal;
  // String? userBalance;

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
  //   map['cart'] = cart;
  //   map['wishlist'] = wishlist;
  //   map['newsletter'] = newsletter;
  //   map['address_id'] = addressId;
  //   map['ip'] = ip;
  //   map['status'] = status;
  //   map['safe'] = safe;
  //   map['token'] = token;
  //   map['code'] = code;
  //   map['date_added'] = dateAdded;
  //   if (accountCustomField != null) {
  //     map['account_custom_field'] = accountCustomField?.toJson();
  //   }
  //   map['reward_total'] = rewardTotal;
  //   map['user_balance'] = userBalance;
  //   return map;
  // }
}

// class AccountCustomField {
//   AccountCustomField({
//       this.,});
//
//   AccountCustomField.fromJson(dynamic json) {
//      = json['1'];
//   }
//   String? ;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['1'] = ;
//     return map;
//   }
//
// }
