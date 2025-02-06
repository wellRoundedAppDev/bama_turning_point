import 'package:classic_eccomerce/account/data/models/get_account_details_response.dart';
import 'package:classic_eccomerce/account/data/models/get_order_details_response.dart';
import 'package:classic_eccomerce/core/data/models/success_message_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';
import '../../models/get_account_address_response.dart';
import '../../models/get_account_addresses_response.dart';
import '../../models/get_customer_orders_response.dart';

class AccountApis {
  static final dioHelper = DioHelper.instance;

  static Future<Response?> getLanguages() async {
    String endpoint = ApiUrls.GET_SELECT_VALUES_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(
          endpoint: endpoint,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      print(response.data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("Get Account details error api $e");
      }
    }
  }

  static Future<GetAccountDetailsResponse?> getAccountDetails() async {
    String endpoint = ApiUrls.ACCOUNT_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(
          endpoint: endpoint,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return GetAccountDetailsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Get Account details error api $e");
      }
    }
  }

  static Future<SuccessAndErrorResponse?> editAccountDetails(
      Map<String, dynamic> accountDetails) async {
    String endpoint = ApiUrls.ACCOUNT_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.put(
          endPoint: endpoint,
          body: accountDetails,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Edit Account details error api $e");
      }
    }
  }

  static Future<SuccessAndErrorResponse?> changePassword(
      Map<String, dynamic> changePasswordInput) async {
    String endpoint = ApiUrls.CHANGE_ACCOUNT_PASSWORD_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.put(
          endPoint: endpoint,
          body: changePasswordInput,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Change password error api $e");
      }
    }
  }

  static Future<GetAccountAddressesResponse?> getAccountAddresses() async {
    String endpoint = ApiUrls.ACCOUNT_ADDRESS_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(
          endpoint: endpoint,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return GetAccountAddressesResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Get Account Addresses error api $e");
      }
    }
  }

  static Future<GetAccountAddressResponse?> getAccountAddress(
      int addressId) async {
    String endpoint = ApiUrls.getAccountAddressEndpoint(addressId);
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(
          endpoint: endpoint,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return GetAccountAddressResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Get Account Address error api $e");
      }
    }
  }

  static Future<SuccessAndErrorResponse?> addAccountAddress(
      Map<String, dynamic> addressInput) async {
    String endpoint = ApiUrls.ACCOUNT_ADDRESS_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.post(
          endPoint: endpoint,
          body: addressInput,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Add Account Address error api $e");
      }
    }
  }

  static Future<SuccessAndErrorResponse?> editAccountAddress(
      Map<String, dynamic> addressInput, int id) async {
    String endpoint = ApiUrls.getEditOrDeleteAccountAddressEndpoint(id);
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.put(
          endPoint: endpoint,
          body: addressInput,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Edit Account Address error api $e");
      }
    }
  }

  static Future<SuccessAndErrorResponse?> deleteAccountAddress(int id) async {
    String endpoint = ApiUrls.getEditOrDeleteAccountAddressEndpoint(id);
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.delete(
          endPoint: endpoint,
          headers: {"Authorization": "Bearer $accessToken"});
      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Delete Account Address error api $e");
      }
    }
  }

  static Future<GetCustomerOrdersResponse?> getCustomerOrders(int page,
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String endpoint = ApiUrls.getCustomerOrdersEndpoint(page);
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endpoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });
      if (response == null) {
        return null;
      }
      return GetCustomerOrdersResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Get customer orders error api $e");
      }
    }
  }

  static Future<GetOrderDetailsResponse?> getOrderDetails(int? orderId,
      {String languageCode = "ir_arabic", String currencyCode = "IQD"}) async {
    String endpoint = ApiUrls.getCustomerOrderDetailsEndpoint(orderId ?? 0);
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    print({
      "Authorization": "Bearer $accessToken",
      "X-Oc-Merchant-Language": languageCode,
      "X-Oc-Currency": currencyCode
    });
    try {
      var response = await dioHelper.get(endpoint: endpoint, headers: {
        "Authorization": "Bearer $accessToken",
        "X-Oc-Merchant-Language": languageCode,
        "X-Oc-Currency": currencyCode
      });

      if (response == null) {
        return null;
      }
      return GetOrderDetailsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Get order details error api $e");
      }
    }
  }

  static Future<bool?> cancelOrder(
    int? orderId,
  ) async {
    String endpoint = ApiUrls.CANCEL_ORDER_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.delete(endPoint: endpoint, headers: {
        "Authorization": "Bearer $accessToken",
      }, body: {
        "order_id": orderId
      });
      if (response == null) {
        return null;
      }
      return response.data['success'] == "Order Has Been Canceled Successfully"
          ? true
          : false;
    } catch (e) {
      if (kDebugMode) {
        print("Get order details error api $e");
      }
    }
  }

// static Future<bool?> createGuestUser(
  //     Map<String, dynamic> guestForm,
  //     ) async {
  //   String? accessToken =
  //       MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
  //   String endpoint = ApiUrls.CREATE_GUEST_USER_ENDPOINT;
  //   try {
  //     var response = await dioHelper.post(
  //       endPoint: endpoint,
  //       headers: {"Authorization": "Bearer $accessToken"},
  //       body: guestForm,
  //     );
  //     if (response == null) {
  //       return null;
  //     }
  //     if (response.data['success'] == 1) {
  //       return true;
  //     } else if (response.data['success'] == 0) {
  //       return false;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Create Guest User error api $e");
  //     }
  //   }
  // }
}
