import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';
import '../../model/get_response_model/get_color_response.dart';

class GetColorsApis {
  static final dioHelper = DioHelper.instance;

  static Future<GetColorResponse?> getColors() async {
    String endPoint = ApiUrls.GET_Colors_ENDPOINT;
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
      }
      );
      if (response == null) {
        return null;
      }
      return GetColorResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}