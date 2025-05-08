

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../categories/data/models/get_products_in_category_response.dart';
import '../../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';
import '../../model/filter_form_input.dart';

class FilterApi {
  static final dioHelper = DioHelper.instance;

  static Future<GetProductsInCategoryResponse?> getFilterHome(Map map,bool isCompany) async {
    String endPoint =isCompany==true? ApiUrls.GET_Filter_COMPANY_ENDPOINT:ApiUrls.GET_Filter_VENDOR_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    // print("lang:$languageCode");
    // print("curr:$currencyCode");
    try {
      var response = await dioHelper.post(endPoint: endPoint,
          headers: {
            "Authorization": "Bearer $accessToken",
          },body: map
      );
      if (response == null) {
        return null;
      }
     return GetProductsInCategoryResponse.fromJson(response.data) ;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}