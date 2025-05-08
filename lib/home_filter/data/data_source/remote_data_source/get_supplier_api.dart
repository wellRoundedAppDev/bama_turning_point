import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/home_filter/data/model/get_response_model/get_groups_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';
import '../../model/get_response_model/get_supplier_response.dart';

class GetSupplierApis {
  static final dioHelper = DioHelper.instance;

  static Future<GetSupplierResponse?> getSupplier() async {
    String endPoint = ApiUrls.GET_Supplier_ENDPOINT;
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
      return GetSupplierResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}