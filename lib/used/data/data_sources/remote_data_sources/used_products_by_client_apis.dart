import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/data/models/success_message_response.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/product_details/data/models/get_product_details_response.dart';
import 'package:classic_eccomerce/used/data/models/add_used_product_response.dart';
import 'package:classic_eccomerce/used/data/models/used_products_by_client_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class UsedProductsApis {
  static final dioHelper = DioHelper.instance;

  static Future<GetUsedProductsByClientResponse?> getUsedProductsByClients() async {
    String endPoint = ApiUrls.GET_USED_PRODUCTS_BY_CLIENTS_ENDPOINT;

    try {
      var response = await dioHelper.get(
        endpoint: endPoint,
        headers: {
          "ApiKey": "h3G67BnqUjw9XZLmQrVKT1oPyWAcDF54",
        },
      );
      if (response == null) {
        return null;
      }
      print(response.data);
      return GetUsedProductsByClientResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  static Future<GetUsedProductsByClientResponse?> getUsedProductsByCompany() async {
    String endPoint = ApiUrls.GET_USED_PRODUCTS_BY_COMPANY_ENDPOINT;

    try {
      var response = await dioHelper.get(
        endpoint: endPoint,
        headers: {
          "ApiKey": "h3G67BnqUjw9XZLmQrVKT1oPyWAcDF54",
        },
      );
      if (response == null) {
        return null;
      }
      print(response.data);
      return GetUsedProductsByClientResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

}
