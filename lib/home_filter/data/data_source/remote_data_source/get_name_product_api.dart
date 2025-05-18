
import 'package:classic_eccomerce/categories/data/models/get_products_in_category_response.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../home/data/models/get_all_products_response.dart';
import '../../../../main.dart';

class GetNameProduct {
  static final dioHelper = DioHelper.instance;

  static Future<GetAllProductsResponse?> getNameProducts() async {
    String endPoint = ApiUrls.GET_ALL_PRODUCTS_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    // print("lang:$languageCode");
    // print("curr:$currencyCode");
    try {
      var response = await dioHelper.get(endpoint: endPoint,
          headers: {
            "Authorization": "Bearer $accessToken",
            // "X-Oc-Merchant-Language": languageCode,
            // "X-Oc-Currency": currencyCode
          },queryParameters: {
        "pageSize":10000
          }
      );
      if (response == null) {
        return null;
      }
      return GetAllProductsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}