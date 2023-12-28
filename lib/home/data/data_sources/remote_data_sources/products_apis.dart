import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/home/data/models/get_best_sellers_response.dart';
import 'package:classic_eccomerce/home/data/models/get_featured_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_latest_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_products_in_brand_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class ProductsApis {
  static final dioHelper = DioHelper.instance;

  static Future<GetFeaturedProductsResponse?> getFeaturedProducts(
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String endPoint = ApiUrls.GET_FEATURED_PRODUCTS_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      return GetFeaturedProductsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<GetFeaturedProductsResponse?> getFeaturedProductsOverview(
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.getFeaturedProductsWithLimitEndpoint(6);
    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      print(response.data);

      return GetFeaturedProductsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<GetLatestProductsResponse?> getNewArrivalsProducts(
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String endPoint = ApiUrls.GET_NEW_ARRIVALS_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      return GetLatestProductsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<GetLatestProductsResponse?> getNewArrivalsProductsOverview(
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.getNewArrivalsProductsWithLimitEndpoint(6);
    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      return GetLatestProductsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<GetBestSellersResponse?> getBestSellersOverview(
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    String endPoint = ApiUrls.getBestSellersWithLimitEndpoint(6);
    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      return GetBestSellersResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<GetBestSellersResponse?> getBestSellersProducts(
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String endPoint = ApiUrls.getBestSellersWithLimitEndpoint(100);
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      return GetBestSellersResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<GetProductsInBrandResponse?> getProductsInBrand(int id,
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String endPoint = ApiUrls.GET_PRODUCTS_IN_BRAND_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode,
      },queryParameters: {
        "id":id
      }
      );
      if (response == null) {
        return null;
      }
      print(response.data);
      return GetProductsInBrandResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
