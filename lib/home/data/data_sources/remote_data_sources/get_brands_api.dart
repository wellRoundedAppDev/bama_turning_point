import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/home/data/models/get_brands_response.dart';
import 'package:classic_eccomerce/home/data/models/get_slide_shows_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class GetBrandsApi {
  static final dioHelper = DioHelper.instance;

  static Future<GetBrandsResponse?> getBrands(
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String endPoint = ApiUrls.GET_BRANDS_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    // final params = {
    //   'route': endPoint,
    //   'extended': 1,
    //   'limit': limit,
    //   'page': page
    // };
    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      print(response);
      return GetBrandsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
