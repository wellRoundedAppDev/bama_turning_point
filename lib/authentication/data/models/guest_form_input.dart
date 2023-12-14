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
//     {
  //   "firstname": firstName,
  //   "lastname": lastName,
  //   "email": "noornido@gmail.com",
  //   "telephone": phoneNumber,
  //   "company": "",
  //   "city": cityName,
  //   "address_1": address,
  //   "address_2": "",
  //   "country_id": country?.countryId?.toInt(),
  //   "postcode": postalCode,
  //   "zone_id": int.parse(region?.zoneId??"")
  // };
  Map<String, dynamic> toJsonForCreateGuestApi() => {
        'customer_id': 1,
        'customer_group_id': 1,
        'store_id': 1,
        'language_id': 1,
        'firstname': firstName,
        'lastname': lastName,
        'email': "noornido@gmail.com",
        'telephone': phoneNumber,
        'mobileAppId': 1,
        'address_id': 1,
        'status': 1,
        // 'cart_count_products': 1,
        'agree': 1,
        "company": "",
        "city": cityName,
        "address_1": address,
        "address_2": "",
        "country_id": country?.countryId?.toInt(),
        "postcode": postalCode,
        "zone_id": int.parse(region?.zoneId ?? ""),

        "custom_field": {
          "account": {"1": "+364545454"}
        }
        //}
      };

  clear() {
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
