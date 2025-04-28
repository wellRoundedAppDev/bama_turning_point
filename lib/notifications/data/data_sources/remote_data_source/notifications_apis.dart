import 'package:classic_eccomerce/notifications/data/models/get_all_notification_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';

class NotificationsApis {
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

  static Future<GetAllNotificationResponse?> getNotifications() async {
    print("jjj");

    String? accessToken =
        MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;


    String endPoint = ApiUrls.GET_ALL_NOTIFICATIONS_ENDPOINT;
    try {
      var response = await _dioHelper.get(
        endpoint: endPoint,

         headers: {
      "Authorization": "Bearer $accessToken",
      },


      );

      return GetAllNotificationResponse.fromJson(response?.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }



  // static Future<bool?> contactUs(
  //     String name, String phoneNumber, String message, String subject) async {
  //   String endPoint = ApiUrls.SEND_EMAIL_ENDPOINT;
  //   try {
  //     var response = await _dioHelper.post(
  //       endPoint: endPoint,
  //       body: {
  //         "Id": "0",
  //         "Name": name,
  //         "phoneNumber": phoneNumber,
  //         "Message": message,
  //         "Subject": subject
  //       },
  //       headers: {
  //         "ApiKey": "h3G67BnqUjw9XZLmQrVKT1oPyWAcDF54",
  //       },
  //     );
  //
  //     return response?.data['Status'];
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }
}
