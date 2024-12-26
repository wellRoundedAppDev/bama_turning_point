import 'package:classic_eccomerce/categories/data/models/get_products_in_category_response.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';
import '../../models/get_categories_response.dart';

class CategoriesApis {
  static final _dioHelper = DioHelper.instance;

  static Future<GetCategoriesResponse?> getCategories(int page,
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;

    String endPoint = ApiUrls.getCategoriesEndpoint(page);
    try {
      var response = await _dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      return GetCategoriesResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<GetProductsInCategoryResponse?> getProductsInCategoryById(
      int id,
      {String languageCode = "ir_arabic",
      String currencyCode = "IQD"}) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;

    String endPoint = ApiUrls.getProductsByCategoryIdEndpoint(id);
    try {
      var response = await _dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });

      if (response == null) {
        return null;
      }
      print(response.data);
      return GetProductsInCategoryResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
