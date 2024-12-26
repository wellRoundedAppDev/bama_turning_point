import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';

class ContactUsApi {
  static final _dioHelper = DioHelper.instance;

  // static Future<bool?> contactUs() async {
  //   String? accessToken =
  //       MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
  //
  //   String endPoint = ApiUrls.CONTACT_US_ENDPOINT;
  //   try {
  //     var response = await _dioHelper.post(endPoint: endPoint, body: {
  //       "name": "Demo User",
  //       "email": "wellroundedappdev@gmail.com",
  //       "enquiry": "This jhghjgjghjghj."
  //     }, headers: {
  //       "Authorization": "Bearer $accessToken"
  //     });
  //     print(response?.data);
  //     return null;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }


  static Future<bool?> contactUs(
      String name, String phoneNumber, String message, String subject) async {
    String endPoint = ApiUrls.SEND_EMAIL_ENDPOINT;
    try {
      var response = await _dioHelper.post(
        endPoint: endPoint,
        body: {
          "Id": "0",
          "Name": name,
          "phoneNumber": phoneNumber,
          "Message": message,
          "Subject": subject
        },
        headers: {
          "ApiKey": "h3G67BnqUjw9XZLmQrVKT1oPyWAcDF54",
        },
      );

      return response?.data['Status'];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
