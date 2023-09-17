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
}