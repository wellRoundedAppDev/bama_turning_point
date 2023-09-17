import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/data/models/get_countries_response.dart';
import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:flutter/foundation.dart';

class GetCountriesAndRegionsApi {
  static final dioHelper = DioHelper.instance;

  static Future<GetCountriesResponse?> getCountries() async {

    String endPoint = ApiUrls.GET_LIST_OF_COUNTRIES;
    try {
      var response = await dioHelper.get(endpoint: endPoint);
      if (response == null) {
        return null;
      }
      return GetCountriesResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<GetRegionsResponse?> getRegionsByCountryId(int countryId) async {

    String endPoint = ApiUrls.getListOfRegionsByCountryIdEndpoint(countryId);
    try {
      var response = await dioHelper.get(endpoint: endPoint);
      if (response == null) {
        return null;
      }
      return GetRegionsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


}