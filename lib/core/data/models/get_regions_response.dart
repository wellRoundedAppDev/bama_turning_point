class GetRegionsResponse {
  GetRegionsResponse({
    this.success,
    //  this.error,
    this.data,
  });

  factory GetRegionsResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    var data = json['data'] != null ? Data.fromJson(json['data']) : null;

    return GetRegionsResponse(success: success, data: data);
  }

  num? success;
  // List<dynamic>? error;
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
    this.countryId,
    this.name,
    this.isoCode2,
    this.isoCode3,
    this.addressFormat,
    this.postcodeRequired,
    this.status,
    this.regions,
  });

  factory Data.fromJson(dynamic json) {
    var countryId = json['country_id'];
    var name = json['name'];
    var isoCode2 = json['iso_code_2'];
    var isoCode3 = json['iso_code_3'];
    var addressFormat = json['address_format'];
    var postcodeRequired = json['postcode_required'];
    var status = json['status'];
    List<Region>? regions;
    if (json['zone'] != null) {
      regions = [];
      json['zone'].forEach((v) {
        regions?.add(Region.fromJson(v));
      });
    }
    return Data(
        name: name,
        status: status,
        countryId: countryId,
        postcodeRequired: postcodeRequired,
        isoCode3: isoCode3,
        isoCode2: isoCode2,
        addressFormat: addressFormat,
        regions: regions);
  }
  num? countryId;
  String? name;
  String? isoCode2;
  String? isoCode3;
  String? addressFormat;
  String? postcodeRequired;
  String? status;
  List<Region>? regions;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['country_id'] = countryId;
  //   map['name'] = name;
  //   map['iso_code_2'] = isoCode2;
  //   map['iso_code_3'] = isoCode3;
  //   map['address_format'] = addressFormat;
  //   map['postcode_required'] = postcodeRequired;
  //   map['status'] = status;
  //   if (zone != null) {
  //     map['zone'] = zone?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class Region {
  Region({
    this.zoneId,
    this.countryId,
    this.name,
    this.code,
    this.status,
  });

  factory Region.fromJson(dynamic json) {
    var zoneId = json['zone_id'];
    var countryId = json['country_id'];
    var name = json['name'];
    var code = json['code'];
    var status = json['status'];
    return Region(
        countryId: countryId,
        status: status,
        name: name,
        code: code,
        zoneId: zoneId);
  }

  String? zoneId;
  String? countryId;
  String? name;
  String? code;
  String? status;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['zone_id'] = zoneId;
  //   map['country_id'] = countryId;
  //   map['name'] = name;
  //   map['code'] = code;
  //   map['status'] = status;
  //   return map;
  // }
}
