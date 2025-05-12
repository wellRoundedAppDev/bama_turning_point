import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/product_details/data/models/get_product_details_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class ProductDetailsApi {
  static final dioHelper = DioHelper.instance;

  static Future<GetProductDetailsResponse?> getProductDetailsById(int id,bool isCompany,
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String endPoint =isCompany? ApiUrls.GET_COMPANY_PRODUCT_DETAILS_BY_ID_ENDPOINT: ApiUrls.GET_VENDOR_PRODUCT_DETAILS_BY_ID_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      }, queryParameters: {
        "productId": id
      });
      if (response == null) {
        return null;
      }
      if (kDebugMode) {
        print(response.data);
      }
      return GetProductDetailsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
