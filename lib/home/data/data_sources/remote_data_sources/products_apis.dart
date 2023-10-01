import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/home/data/models/get_best_sellers_response.dart';
import 'package:classic_eccomerce/home/data/models/get_featured_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_latest_products_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class ProductsApis {
  static final dioHelper = DioHelper.instance;

  static Future<GetFeaturedProductsResponse?> getFeaturedProducts() async {
    String endPoint = ApiUrls.GET_FEATURED_PRODUCTS_ENDPOINT;
    String? accessToken = MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"}

      );
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

  static Future<GetFeaturedProductsResponse?>
      getFeaturedProductsOverview() async {
    String? accessToken = MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.getFeaturedProductsWithLimitEndpoint(6);
    try {
      var response = await dioHelper.get(endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"}

      );
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

  static Future<GetLatestProductsResponse?> getNewArrivalsProducts() async {
    String endPoint = ApiUrls.GET_NEW_ARRIVALS_ENDPOINT;
    String? accessToken = MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;


    try {
      var response = await dioHelper.get(endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"}

      );
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

  static Future<GetLatestProductsResponse?>
      getNewArrivalsProductsOverview() async {
    String? accessToken = MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.getNewArrivalsProductsWithLimitEndpoint(6);
    try {
      var response = await dioHelper.get(endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"}

      );
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

  static Future<GetBestSellersResponse?> getBestSellersOverview() async {
    String? accessToken = MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    String endPoint = ApiUrls.getBestSellersWithLimitEndpoint(6);
    try {
      var response = await dioHelper.get(endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"}

      );
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

  static Future<GetBestSellersResponse?> getBestSellersProducts() async {
    String endPoint = ApiUrls.getBestSellersWithLimitEndpoint(10);
    String? accessToken = MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"}

      );
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

}
