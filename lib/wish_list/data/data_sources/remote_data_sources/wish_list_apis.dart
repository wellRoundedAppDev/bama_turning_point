import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/wish_list/data/models/get_wishlist_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class WishListApis {
  static final dioHelper = DioHelper.instance;

  static Future<bool?> addItemToWishlist(
    int productId,
  ) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;

    String endpoint = ApiUrls.getAddItemsToWishlistEndpoint(productId);
    try {
      var response = await dioHelper.post(
          endPoint: endpoint,
          headers: {"Authorization": "Bearer $accessToken"});
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
        print("Add item to wish list error api $e");
      }
    }
  }

  static Future<bool?> deleteItemFromWishlist(
    int productId,
  ) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endpoint = ApiUrls.getDeleteItemsFromWishlistEndpoint(productId);
    try {
      var response = await dioHelper.delete(
          endPoint: endpoint,
          headers: {"Authorization": "Bearer $accessToken"});
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
        print("Delete item from wish list error api $e");
      }
    }
  }

  static Future<GetWishlistResponse?> getWishlist(
      {String languageCode = "ir_arabic",
        String currencyCode = "IQD"

      }

      ) async {
    String endPoint = ApiUrls.GET_WISH_LIST_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(
          endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken",
            "X-Oc-Merchant-Language": languageCode,
            "X-Oc-Currency": currencyCode

          });
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
