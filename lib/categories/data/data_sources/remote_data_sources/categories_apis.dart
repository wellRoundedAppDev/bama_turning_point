import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/helpers/dio_helper.dart';
import '../../models/GetCategoriesResponse.dart';

class CategoriesApis {
  static final _dioHelper = DioHelper.instance;

  static Future<GetCategoriesResponse?> getCategories() async {
    String endPoint = ApiUrls.GET_CATEGORIES_ENDPOINT;
    try {
      var response = await _dioHelper.get(endpoint: endPoint);
      if(response == null){
        return null;
      }
      return GetCategoriesResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
