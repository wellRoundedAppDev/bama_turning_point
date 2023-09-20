import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:flutter/foundation.dart';

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

  static Future<bool?> login(Map<String, dynamic> loginInput,) async {

    String endpoint = ApiUrls.LOGIN_ENDPOINT;
    try {
      var response = await dioHelper.post(endPoint: endpoint,body: loginInput,);
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
    }
    catch (e) {
      if (kDebugMode) {
        print("Login error api $e");
      }
    }
  }


  static Future<bool?> logOut() async {

    String endpoint = ApiUrls.LOGOUT_ENDPOINT;
    try {
      var response = await dioHelper.post(endPoint: endpoint,);
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
    }
    catch (e) {
      if (kDebugMode) {
        print("Logout error api $e");
      }
    }
  }



  static Future<bool?> createGuestUser(Map<String, dynamic> guestForm,) async {
    String endpoint = ApiUrls.CREATE_GUEST_USER_ENDPOINT;
    try {
      var response = await dioHelper.post(endPoint: endpoint,body: guestForm,);
      if (response == null) {
        return null;
      }
      if (response.data['data']['success'] == 1) {
        return true;
      } else if (response.data['data']['success'] == 0) {
        return false;
      } else {
        return null;
      }
    }
    catch (e) {
      if (kDebugMode) {
        print("Create Guest User error api $e");
      }
    }
  }
}
