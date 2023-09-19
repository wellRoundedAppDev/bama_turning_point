import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/wish_list/data/models/get_wishlist_response.dart';
import 'package:flutter/foundation.dart';

class WishListApis {
  static final dioHelper = DioHelper.instance;

  static Future<bool?> addItemToWishlist(
    int productId,
  ) async {
    String endpoint = ApiUrls.getAddItemsToWishlistEndpoint(productId);
    try {
      var response = await dioHelper.post(
        endPoint: endpoint,
      );
      if (response == null) {
        return null;
      }
      if (response.data['data']['success'] == 1) {
        return true;
      } else if (response.data['data']['success'] == 0) {
        return false;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Add item to wish list error api $e");
      }
    }
  }

  static Future<GetWishlistResponse?> getWishlist() async {
    String endPoint = ApiUrls.GET_WISH_LIST_ENDPOINT;
    try {
      var response = await dioHelper.get(endpoint: endPoint);
      if (response == null) {
        return null;
      }
      return GetWishlistResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

// static Future<bool?> addItemToWishlist(int productId,) async {
  //   String endpoint = ApiUrls.ADD_TO_WISH_LIST_ENDPOINT;
  //   try {
  //     var response = await dioHelper.post(endPoint: endpoint,body: {
  //       "id":productId
  //     },);
  //     if (response == null) {
  //       return null;
  //     }
  //     if (response.data['data']['success'] == 1) {
  //       return true;
  //     } else if (response.data['data']['success'] == 0) {
  //       return false;
  //     } else {
  //       return null;
  //     }
  //   }
  //   catch (e) {
  //     if (kDebugMode) {
  //       print("Add item to wish list error api $e");
  //     }
  //   }
  // }
}
