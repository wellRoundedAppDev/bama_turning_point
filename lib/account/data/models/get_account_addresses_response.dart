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
    var data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  factory Data.fromJson(dynamic json) {
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

class AccountAddress {
  AccountAddress({
    this.addressId,
    this.firstname,
    this.lastname,
    // this.company,
    this.address1,
    //this.address2,
    this.postcode,
    this.city,
    this.zoneId,
    this.zone,
    this.zoneCode,
    this.countryId,
    this.country,
    // this.isoCode2,
    // this.isoCode3,
    // this.addressFormat,
    // this.customField,
    this.defaultAddress,
  });

  factory AccountAddress.fromJson(dynamic json) {
    var addressId = json['address_id'];
    var firstname = json['firstname'];
    var lastname = json['lastname'];
    // var company = json['company'];
    var address1 = json['address_1'];
    //address2 = json['address_2'];
    var postcode = json['postcode'];
    var city = json['city'];
    var zoneId = json['zone_id'];
    var zone = json['zone'];
    var zoneCode = json['zone_code'];
    var countryId = json['country_id'];
    var country = json['country'];
    // isoCode2 = json['iso_code_2'];
    // isoCode3 = json['iso_code_3'];
    //addressFormat = json['address_format'];
    // customField = json['custom_field'] != null ? CustomField.fromJson(json['custom_field']) : null;
    var defaultAddress = json['default'];
    return AccountAddress(
        firstname: firstname,
        lastname: lastname,
        zoneId: zoneId,
        countryId: countryId,
        address1: address1,
        city: city,
        country: country,
        postcode: postcode,
        zone: zone,
        zoneCode: zoneCode,
        addressId: addressId,
        defaultAddress: defaultAddress);
  }
  String? addressId;
  String? firstname;
  String? lastname;
  //String? company;
  String? address1;
  //String? address2;
  String? postcode;
  String? city;
  String? zoneId;
  String? zone;
  String? zoneCode;
  String? countryId;
  String? country;
  // String? isoCode2;
  // String? isoCode3;
  // String? addressFormat;
  //CustomField? customField;
  bool? defaultAddress;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['address_id'] = addressId;
  //   map['firstname'] = firstname;
  //   map['lastname'] = lastname;
  //   map['company'] = company;
  //   map['address_1'] = address1;
  //   map['address_2'] = address2;
  //   map['postcode'] = postcode;
  //   map['city'] = city;
  //   map['zone_id'] = zoneId;
  //   map['zone'] = zone;
  //   map['zone_code'] = zoneCode;
  //   map['country_id'] = countryId;
  //   map['country'] = country;
  //   map['iso_code_2'] = isoCode2;
  //   map['iso_code_3'] = isoCode3;
  //   map['address_format'] = addressFormat;
  //   if (customField != null) {
  //     map['custom_field'] = customField?.toJson();
  //   }
  //   map['default'] = defaultAddress;
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
