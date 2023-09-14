import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/product_details/data/models/get_product_details_response.dart';
import 'package:flutter/foundation.dart';

class ProductDetailsApi {
  static final dioHelper = DioHelper.instance;

  static Future<GetProductDetailsResponse?> getProductDetailsById(int id) async {
    String endPoint = ApiUrls.getProductDetailsByIdEndpoint(id);
    try {
      var response = await dioHelper.get(endpoint: endPoint);
      if (response == null) {
        return null;
      }
      return GetProductDetailsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}