import 'package:classic_eccomerce/authentication/data/models/guest_form_input.dart';
import 'package:classic_eccomerce/checkout/data/models/get_payment_methods_response.dart';
import 'package:classic_eccomerce/checkout/data/models/get_shipping_methods_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../core/helpers/dio_helper.dart';
import '../../../main.dart';

class CheckoutApis {
  static final _dioHelper = DioHelper.instance;

  static Future<bool?> setGuestShippingAddress(
      GuestFormInput guestFormInput) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;

    String endPoint = ApiUrls.GUEST_CHECKOUT_ENDPOINT;
    try {
      var response = await _dioHelper.post(endPoint: endPoint, body: {
        "firstname": guestFormInput.firstName,
        "lastname": guestFormInput.lastName,
        "city": guestFormInput.cityName,
        "address_1": guestFormInput.address,
        "address_2": "",
        "country_id": guestFormInput.country?.countryId,
        "postcode": guestFormInput.postalCode,
        "zone_id": guestFormInput.region?.zoneId
      }, headers: {
        "Authorization": "Bearer $accessToken"
      });
      if (response == null) {
        return null;
      }
      if (response.data['success'] == 1) {
        return true;
      } else if (response.data['success'] == 0) {
        return false;
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<bool?> confirmOrder() async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.CONFIRM_ORDER_ENDPOINT;

    try {
      var response = await _dioHelper.post(
          endPoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      if (response.data['success'] == 1) {
        return true;
      } else if (response.data['success'] == 0) {
        return false;
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  static Future<GetShippingMethodsResponse?> getShippingMethods() async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.GET_SHIPPING_METHODS_ENDPOINT;

    try {
      var response = await _dioHelper.get(
          endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return GetShippingMethodsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<GetPaymentMethodsResponse?> getPaymentMethods() async {

    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.GET_PAYMENT_METHODS_ENDPOINT;

    try {
      var response = await _dioHelper.get(
          endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return GetPaymentMethodsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

// static Future<GetShippingMethodsResponse?> getShippingMethods() async {
  //   String? accessToken =
  //       MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
  //   String endPoint = ApiUrls.GET_SHIPPING_METHODS_ENDPOINT;
  //
  //   try {
  //     var response = await _dioHelper.post(
  //         endPoint: endPoint,
  //         headers: {"Authorization": "Bearer $accessToken"});
  //     if (response == null) {
  //       return null;
  //     }
  //     return GetShippingMethodsResponse.fromJson(response.data);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }

}
