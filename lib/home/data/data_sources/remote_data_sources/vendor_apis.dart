import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/home/data/models/get_all_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_best_sellers_response.dart';
import 'package:classic_eccomerce/home/data/models/get_featured_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_latest_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_products_in_brand_response.dart';
import 'package:classic_eccomerce/home/data/models/get_vendors_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class VendorsApis {
  static final dioHelper = DioHelper.instance;

  static Future<GetVendorsResponse?> getVendors(
      {
        int pageNumber = 1,
        int pageSize = 10
      }) async {
    String endPoint = ApiUrls.GET_VENDORS_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(
          endpoint:
          endPoint,
          queryParameters: {
            "pageNumber":pageNumber,
            "pageSize":pageSize
          },
          headers: {
            "Authorization": "Bearer $accessToken",
            // "X-Oc-Merchant-Language": languageCode,
            // "X-Oc-Currency": currencyCode,
          });
      if (response == null) {
        return null;
      }
      print(response.data);
      return GetVendorsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
