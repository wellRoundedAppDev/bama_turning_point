import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/data/models/success_message_response.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';
import '../../../presentation/auth_cubit/auth_cubit.dart';
import '../../models/login_response.dart';

class AuthApis {
  static final dioHelper = DioHelper.instance;

  static Future<String?> getSessionId() async {
    String endpoint = ApiUrls.GET_SESSION_ID_ENDPOINT;
    try {
      var response = await dioHelper.post(endPoint: endpoint);
      if (response?.data['success'] == 1) {
        return response?.data['data']['session'];
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Session Id error api $e");
      }
    }
  }

  static Future<String?> getAccessToken() async {
    String endpoint = ApiUrls.GET_TOKEN_ENDPONT;
    try {
      var response = await dioHelper.post(endPoint: endpoint, headers: {
        "Authorization": "Basic c2hvcHBpbmdfb2F1dGhfY2xpZW50OnNob3BwaW5nX29hdXRoX3NlY3JldA=="
            //"bS1jZXNhci11c2VyOm0tY2VzYXItc2VjcmV0"
      });
      if (response?.data['success'] == 1) {
        return response?.data['data']['access_token'];
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Get Access Token error api $e");
      }
    }
  }

  static Future<LoginResponse?> login(
    Map<String, dynamic> loginInput,
  ) async {
    String endpoint = ApiUrls.LOGIN_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.post(
          endPoint: endpoint,
          body: loginInput,
      );
      if (response == null) {
        return null;
      }


      return LoginResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("Login error api $e");
      }
    }
  }

  static Future<SuccessAndErrorResponse?> register(
    Map<String, dynamic> registerInput,
  ) async {
    String endpoint = ApiUrls.REGISTER_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.post(
          endPoint: endpoint,
          body: registerInput,
          headers: {"Authorization": "Bearer $accessToken"});

      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse(success: response.data['Obj']!=null&&  response.data['Obj'].isNotEmpty,errorMsgs: response.data['Message'],

      message: response.data['Message']);
    } catch (e) {
      if (kDebugMode) {
        print("Register error api $e");
      }
    }
  }

  static Future<bool?> logOut() async {
    String endpoint = ApiUrls.LOGOUT_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.post(
        headers: {"Authorization": "Bearer $accessToken"},
        endPoint: endpoint,
      );
      if (response == null) {
        return null;
      }
      if (response.data['success'] == 1) {
        return true;
      } else if (response.data['success'] == 0) {
        return false;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Logout error api $e");
      }
    }
  }

  static Future<bool?> createGuestUser(
    Map<String, dynamic> guestForm,
  ) async {
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    String endpoint = ApiUrls.CREATE_GUEST_USER_ENDPOINT;
    try {
      var response = await dioHelper.post(
        endPoint: endpoint,
        headers: {"Authorization": "Bearer $accessToken"},
        body: guestForm,
      );
      if (response == null) {
        return null;
      }
      if (response.data['success'] == 1) {
        return true;
      } else if (response.data['success'] == 0) {
        return false;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Create Guest User error api $e");
      }
    }
  }
}
