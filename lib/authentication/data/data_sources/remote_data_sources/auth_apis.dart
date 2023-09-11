import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:flutter/foundation.dart';

class AuthApis {
  static final dioHelper = DioHelper.instance;

  static Future<String?> getSessionId() async {
    String endpoint = ApiUrls.GET_SESSION_ID_ENDPOINT;
    try {
      var response = await dioHelper.post(endPoint: endpoint);
      if(response?.data['success'] == 1){
        return response?.data['data']['session'];
      }else{
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Session Id error api $e");
      }
    }
  }
}
