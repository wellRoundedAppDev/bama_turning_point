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

  Map<String, dynamic> toJsonForApi() =>
      {
        'customer_id': 1,
        'customer_group_id': 1,
        'store_id': 1,
        'language_id': 1,
        'firstname': firstName,
        'lastname': lastName,
        'email': phoneNumber,
        'telephone': phoneNumber,
        'password': password,
        'confirm': confirmPassword,
        'mobileAppId': 1,
        'address_id': 1,
        'status': 1,
        // 'cart_count_products': 1,
        'agree': 1,
        // "custom_field": {
        //   "account": {"1": "32223"}

          "custom_field": {
            "account": {"1": "+364545454"}
          }
       //}
};
      }