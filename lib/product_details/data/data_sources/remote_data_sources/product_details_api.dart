import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/product_details/data/models/get_product_details_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class ProductDetailsApi {
  static final dioHelper = DioHelper.instance;

  static Future<GetProductDetailsResponse?> getProductDetailsById(int id,
      {String languageCode = "ir_arabic",
        String currencyCode = "IQD"

      }

      ) async {
    String endPoint = ApiUrls.getProductDetailsByIdEndpoint(id);
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken",
            "X-Oc-Merchant-Language": languageCode,
            "X-Oc-Currency": currencyCode


          }

      );
      if (response == null) {
        return null;
      }
      return GetProductDetailsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}