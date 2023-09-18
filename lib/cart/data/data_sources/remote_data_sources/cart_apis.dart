import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:flutter/foundation.dart';

class CartApis {
  static final dioHelper = DioHelper.instance;


  static Future<bool?> addItemsToCart(dynamic items) async {
    String endpoint = ApiUrls.ADD_ITEMS_TO_CART_ENDPOINT;
    try {
      var response = await dioHelper.post(endPoint: endpoint,body: items,

      );
      if (response == null) {
        return null;
      }
      if (response.data['success'] == 1) {
        return true;
      } else if (response.data['success'] == 0) {
        return false;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Add Items To Cart error api $e");
      }
    }
  }
}
