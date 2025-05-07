import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/data/models/success_message_response.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/wish_list/data/models/get_favorites_response.dart';
import 'package:classic_eccomerce/wish_list/data/models/get_wishlist_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class WishListApis {
  static final dioHelper = DioHelper.instance;

  static Future<SuccessAndErrorResponse?> addItemToWishlist(
    int productId,
      int productSource
  ) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;

    String endpoint = ApiUrls.ADD_TO_WISH_LIST_ENDPOINT;
    try {
      var response = await dioHelper.post(
          endPoint: endpoint,

          body: {
            "source": productSource,
            "sourceId":productId},
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
     return SuccessAndErrorResponse.fromJson(response?.data);
    } catch (e) {
      if (kDebugMode) {
        print("Add item to wish list error api $e");
      }
    }
  }

  static Future<SuccessAndErrorResponse?> deleteItemFromWishlist(
    int productId,
      int sourceId
  ) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endpoint = ApiUrls.getDeleteItemsFromWishlistEndpoint();
    try {
      var response = await dioHelper.post(
          endPoint: endpoint,


          body: {
            "source": sourceId,
            "sourceId": productId
          },
          headers: {"Authorization": "Bearer $accessToken"});

      return SuccessAndErrorResponse.fromJson(response?.data);
    } catch (e) {
      if (kDebugMode) {
        print("Delete item from wish list error api $e");
      }
    }
  }

  static Future<GetFavoritesResponse?> getWishlist(
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
          queryParameters: {
            "pageNumber":1,
            "pageSize":100000
          },
          headers: {"Authorization": "Bearer $accessToken",
            "X-Oc-Merchant-Language": languageCode,
            "X-Oc-Currency": currencyCode

          });
      if (response == null) {
        return null;
      }
      return GetFavoritesResponse.fromJson(response.data);
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
