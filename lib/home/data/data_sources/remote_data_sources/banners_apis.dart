import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/home/data/models/get_banners_response.dart';
import 'package:classic_eccomerce/home/data/models/search_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class BannersApis {
  static final dioHelper = DioHelper.instance;

  static Future<GetBannersResponse?> getBanners() async {
    String endPoint = ApiUrls.GET_BANNERS_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    // print("lang:$languageCode");
    // print("curr:$currencyCode");
    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        // "X-Oc-Merchant-Language": languageCode,
        // "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      return GetBannersResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
