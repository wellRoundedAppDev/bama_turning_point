import 'package:classic_eccomerce/core/data/models/get_countries_response.dart';
import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';

class AccountAddressInput {
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? postalCode;
  Country? country;
  Region? region;
  bool? isDefaultAddress;

  AccountAddressInput({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.country,
    required this.city,
    required this.region,
    required this.isDefaultAddress,
    required this.postalCode,
  });

  Map<String, dynamic> toJson() => {
    "firstname": firstName,
    "lastname": lastName,
    "city": city,
    "address_1": address,
    "address_2": "",
    "country_id": country?.countryId,
    "postcode": postalCode,
    "zone_id": region?.zoneId,
    "company": "",
    "custom_field": {
      "address": {
        "": ""
      }
    },
    "default": 0
  };
}
