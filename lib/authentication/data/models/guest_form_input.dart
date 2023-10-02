import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';

import '../../../core/data/models/get_countries_response.dart';

class GuestFormInput {
  String? phoneNumber;
  String? gender;
  String? firstName;
  String? lastName;
  String? address;
  Country? country;
  Region? region;
  String? cityName;
  String? postalCode;

  GuestFormInput({this.gender = "Male"});

  Map<String, dynamic> toJsonForCreateGuestApi() =>{
    "firstname": firstName,
    "lastname": lastName,
    "email": "noornido@gmail.com",
    "telephone": phoneNumber,
    "company": "",
    "city": cityName,
    "address_1": address,
    "address_2": "",
    "country_id": country?.countryId?.toInt(),
    "postcode": postalCode,
    "zone_id": int.parse(region?.zoneId??"")
  };

  clear(){
    phoneNumber = null;
    gender = "Male";
    firstName = null;
    lastName = null;
    address = null;
    country = null;
    region = null;
    cityName = null;
    postalCode = null;

  }
}