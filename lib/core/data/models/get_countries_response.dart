class GetCountriesResponse {
  GetCountriesResponse({
    this.success,
    this.countries,
  });

  factory GetCountriesResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    List<Country>? countries;
    if (json['data'] != null) {
      countries = [];
      json['data'].forEach((v) {
        countries?.add(Country.fromJson(v));
      });
    }

    return GetCountriesResponse(success: success, countries: countries);
  }
  num? success;
  List<Country>? countries;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (countries != null) {
  //     map['data'] = countries?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class Country {
  Country({
    this.countryId,
    this.name,
    this.isoCode2,
    this.isoCode3,
    this.addressFormat,
    this.postcodeRequired,
    this.status,
  });

  factory Country.fromJson(dynamic json) {
    var countryId = json['country_id'];
    var name = json['name'];
    var isoCode2 = json['iso_code_2'];
    var isoCode3 = json['iso_code_3'];
    var addressFormat = json['address_format'];
    var postcodeRequired = json['postcode_required'];
    var status = json['status'];
    return Country(
        name: name,
        status: status,
        addressFormat: addressFormat,
        countryId: countryId,
        isoCode2: isoCode2,
        isoCode3: isoCode3,
        postcodeRequired: postcodeRequired);
  }
  num? countryId;
  String? name;
  String? isoCode2;
  String? isoCode3;
  String? addressFormat;
  String? postcodeRequired;
  String? status;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['country_id'] = countryId;
  //   map['name'] = name;
  //   map['iso_code_2'] = isoCode2;
  //   map['iso_code_3'] = isoCode3;
  //   map['address_format'] = addressFormat;
  //   map['postcode_required'] = postcodeRequired;
  //   map['status'] = status;
  //   return map;
  // }
}
