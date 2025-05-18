

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';
import '../../model/get_response_model/get_name_product_response.dart';

class GetCategoryFilterApi {
  static final dioHelper = DioHelper.instance;

  static Future<GetCategoryResponse?> getCategory() async {
    String endPoint = ApiUrls.GET_CategoryStore_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    try {
      var response = await dioHelper.get(endpoint: endPoint,headers: {
        "Authorization": "Bearer $accessToken",
      });
      if (response == null) {
        return null;
      }
      return GetCategoryResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}