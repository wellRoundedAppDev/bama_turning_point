import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';

import '../../../core/data/models/get_countries_response.dart';

class RegisterFormInput {
  String? phoneNumber;
  String? email;
  String? gender;
  String? firstName;
  String? lastName;
  String? password;
  String? confirmPassword;
  String? address;
  Country? country;
  Region? region;
  String? cityName;
  String? postalCode;

  RegisterFormInput({this.gender = "Male"});

  Map<String, dynamic> toJsonForApi() => {
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
    "password": password,
    "confirm": confirmPassword,
    "telephone": phoneNumber,
    "customer_group_id": 1,
    "agree": 1,

    "custom_field": {
      "account": {
        "1": "+364545454"
      }
    }
      };
}
