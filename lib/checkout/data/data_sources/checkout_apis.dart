import 'package:classic_eccomerce/authentication/data/models/guest_form_input.dart';
import 'package:classic_eccomerce/checkout/data/models/get_customer_payment_address_response.dart';
import 'package:classic_eccomerce/checkout/data/models/get_payment_methods_response.dart';
import 'package:classic_eccomerce/checkout/data/models/get_shipping_methods_response.dart';
import 'package:classic_eccomerce/core/data/models/success_message_response.dart';
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

  static setCouponCode(
      {String languageCode = "ir_arabic",
      String currencyCode = "IQD",
      required String couponCode}) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.SET_COUPON_CODE_ENDPOINT;

    try {
      var response = await _dioHelper.post(endPoint: endPoint, body: {
        "coupon": couponCode
      }, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode,
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

  static Future<bool?> createOrder(
      {String languageCode = "ir_arabic", String currencyCode = "IQD",
        var items
      }) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.CONFIRM_ORDER_ENDPOINT;

    try {
      var response = await _dioHelper.post(endPoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        // "X-Oc-Merchant-Language": languageCode,
        // "X-Oc-Currency": currencyCode
      },
          body: {
            "purchaseRequestDetails": items
          }
      );
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


  static Future<SuccessAndErrorResponse?> confirmOrder(
      {String languageCode = "ir_arabic", String currencyCode = "IQD",
      var items
      }) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.CONFIRM_ORDER_ENDPOINT;

    try {
      var response = await _dioHelper.post(endPoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        // "X-Oc-Merchant-Language": languageCode,
        // "X-Oc-Currency": currencyCode
      },
      body: {
        "purchaseRequestDetails": items
      }
      );

      return SuccessAndErrorResponse.fromJson(response?.data);

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<bool?> confirmOrderAndEndSession(
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.CONFIRM_ORDER_ENDPOINT;

    try {
      var response = await _dioHelper.put(endPoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
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
        print("Confirm order and end session API: $e");
      }
    }
  }

  static Future<GetShippingMethodsResponse?> getShippingMethods(
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.SHIPPING_METHODS_ENDPOINT;

    try {
      var response = await _dioHelper.get(endpoint: endPoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
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

  static Future<bool?> setShippingMethod(ShippingMethod shippingMethod) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.SHIPPING_METHODS_ENDPOINT;

    try {
      var response = await _dioHelper.post(endPoint: endPoint, body: {
        "shipping_method": shippingMethod.quote?[0].code,
        "comment": "string"
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

  static Future<GetPaymentMethodsResponse?> getPaymentMethods() async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.PAYMENT_METHODS_ENDPOINT;

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

  static Future<bool?> setPaymentMethod(PaymentMethod paymentMethod) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.PAYMENT_METHODS_ENDPOINT;

    try {
      var response = await _dioHelper.post(endPoint: endPoint, body: {
        "payment_method": paymentMethod.code,
        "agree": 1,
        "comment": "string"
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

  static Future<GetCustomerPaymentAddressesResponse?>
      getCustomerPaymentAddresses() async {

    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.CUSTOMER_PAYMENT_ADDRESS_ENDPOINT;

    try {
      var response = await _dioHelper.get(
          endpoint: endPoint,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return GetCustomerPaymentAddressesResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<SuccessAndErrorResponse?> setExistingCustomerPaymentAddress(
      int addressId) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.SET_EXISTING_CUSTOMER_PAYMENT_ADDRESS_ENDPOINT;

    try {
      var response = await _dioHelper.post(
          endPoint: endPoint,
          body: {"address_id": addressId},
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<SuccessAndErrorResponse?> setExistingCustomerShippingAddress(
      int addressId) async {
    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    String endPoint = ApiUrls.SET_EXISTING_CUSTOMER_SHIPPING_ADDRESS_ENDPOINT;

    try {
      var response = await _dioHelper.post(
          endPoint: endPoint,
          body: {"address_id": addressId},
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<SuccessAndErrorResponse?> addAddressToOrder(
      Map<String, dynamic> addressInput) async {
    String endpoint = ApiUrls.CUSTOMER_PAYMENT_ADDRESS_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await _dioHelper.post(
          endPoint: endpoint,
          body: addressInput,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Add Address to order, error api $e");
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
