import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class CartApis {
  static final dioHelper = DioHelper.instance;

  // {
  // "product_id": 34,
  // "quantity": 2
  // }
  static Future<bool?> addItemToCart(dynamic item) async {
    String endpoint = ApiUrls.ADD_ITEM_TO_CART_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.post(
          endPoint: endpoint,
          body: item,
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
        print("Add Item To Cart error api $e");
      }
    }
  }

  static Future<bool?> addItemsToCart(dynamic items) async {
    String endpoint = ApiUrls.ADD_ITEMS_TO_CART_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.post(
          endPoint: endpoint,
          body: items,
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
        print("Add Items To Cart error api $e");
      }
    }
  }
}
