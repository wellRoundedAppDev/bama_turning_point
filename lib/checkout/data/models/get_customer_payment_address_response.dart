class GetCustomerPaymentAddressesResponse {
  GetCustomerPaymentAddressesResponse({
      this.success,
      // this.error,
      this.data,});

  factory GetCustomerPaymentAddressesResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    var data = json['data'] != null ? Data.fromJson(json['data']) : null;
    return GetCustomerPaymentAddressesResponse(success: success,data: data);
  }
  num? success;
  // List<dynamic>? error;
  Data? data;
  //
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
      this.addressId,
      this.addresses,});

  factory Data.fromJson(dynamic json) {
    var addressId = json['address_id'];
    List<Address>? addresses;
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(Address.fromJson(v));
      });
    }
    return Data(addresses: addresses,addressId: addressId);
  }
  String? addressId;
  List<Address>? addresses;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['address_id'] = addressId;
  //   if (addresses != null) {
  //     map['addresses'] = addresses?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }

}

class Address {
  Address({
      this.addressId,
      this.firstname,
      this.lastname,
      // this.company,
      this.address1,
     // this.address2,
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
  });

  factory Address.fromJson(dynamic json) {
    var addressId = json['address_id'];
    var firstname = json['firstname'];
    var lastname = json['lastname'];
    // var company = json['company'];
    var address1 = json['address_1'];
    // var address2 = json['address_2'];
    var postcode = json['postcode'];
    var city = json['city'];
    var zoneId = json['zone_id'];
    var zone = json['zone'];
    var zoneCode = json['zone_code'];
    var countryId = json['country_id'];
    var country = json['country'];
    // var isoCode2 = json['iso_code_2'];
    // var isoCode3 = json['iso_code_3'];
    // var addressFormat = json['address_format'];
    // var customField = json['custom_field'] != null ? CustomField.fromJson(json['custom_field']) : null;
    return Address(
      addressId: addressId,
      firstname: firstname,
      lastname: lastname,
      countryId: countryId,zoneId: zoneId,address1: address1,city: city,country: country,postcode: postcode,zone: zone,zoneCode: zoneCode,);
  }
  String? addressId;
  String? firstname;
  String? lastname;
  // String? company;
  String? address1;
 // String? address2;
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
  // CustomField? customField;

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
  //   return map;
  // }

//}
}