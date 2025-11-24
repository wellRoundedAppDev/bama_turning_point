import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';
import '../../../presentation/auth_cubit/auth_cubit.dart';
import '../../models/get_place_governorate_response/get_governorate.dart';
import '../../models/get_place_governorate_response/get_judiciary.dart';
import '../../models/get_place_governorate_response/get_way_by_Judiciary.dart';

class GetPlaceApis {
  static final dioHelper = DioHelper()..init(ApiUrls.BASE_URL);

  static Future<GovernorateResponse?> getGovernorate() async {
    String endPoint = ApiUrls.GET_Governorate_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    // print("lang:$languageCode");
    // print("curr:$currencyCode");
    try {
      var response = await dioHelper.post(endPoint: endPoint,
          // headers: {
          //   "Authorization": "Bearer $accessToken",
          //   // "X-Oc-Merchant-Language": languageCode,
          //   // "X-Oc-Currency": currencyCode
          // }
      );
      if (response == null) {
        return null;
      }
      return GovernorateResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<JudiciaryResponse?> getJudiciary(int governorateId) async {
    String endPoint = ApiUrls.GET_Judiciary_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    // print("lang:$languageCode");
    // print("curr:$currencyCode");
    try {
      var response = await dioHelper.post(endPoint: endPoint,
          // headers: {
          //   "Authorization": "Bearer $accessToken",
          //   // "X-Oc-Merchant-Language": languageCode,
          //   // "X-Oc-Currency": currencyCode
          // },

          queryParameters: {
          "governorateId":governorateId
          }
      );
      if (response == null) {
        return null;
      }
      return JudiciaryResponse.fromJson(response.data);

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  static Future<WayResponse?> getWay(int judiciaryId) async {
    String endPoint = ApiUrls.GET_Way_By_Judiciary_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    // print("lang:$languageCode");
    // print("curr:$currencyCode");
    try {
      var response = await dioHelper.post(endPoint: endPoint,
          // headers: {
          //   "Authorization": "Bearer $accessToken",
          //   // "X-Oc-Merchant-Language": languageCode,
          //   // "X-Oc-Currency": currencyCode
          // }
          // ,
          queryParameters: {
          "judiciaryId":judiciaryId
          }
      );
      if (response == null) {
        return null;
      }
      return WayResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

}