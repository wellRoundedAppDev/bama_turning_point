import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/data/models/success_message_response.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/register_attendance_by_location/data/models/get_geo_fences_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class AttendanceByLocationApis {

  static DioHelper? dioHelper;

  AttendanceByLocationApis(DioHelper helper){
    dioHelper = helper;
  }

   Future<GeoFencesResponse?> getGeoFences(String baseUrl) async {
    String endpoint = baseUrl + ApiUrls.GET_GEOFENCES_ENDPOINT;
    print(endpoint);
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper?.get(endpoint: endpoint,

          headers: {"Authorization": "Bearer $accessToken"});
      return GeoFencesResponse.fromJson(response?.data);
    } catch (e) {
      if (kDebugMode) {
        print("Get Geofences api error api $e");
      }
    }
  }


   Future<SuccessAndErrorResponse?> registerAttendanceOrDismissal(int employeeId, double lat, double lng, int action,String baseUrl) async {
    String endpoint = baseUrl + ApiUrls.REGISTER_ATTENDANCE_OR_DISMISSALS_BY_LOCATION_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper?.post(endPoint: endpoint,
          body: {
            "employeeId": employeeId,
            "latitude": lat,
            "longitude": lng,
            "action": action
          },

          headers: {"Authorization": "Bearer $accessToken"});
      return SuccessAndErrorResponse.fromJson(response?.data);
    } catch (e) {
      if (kDebugMode) {
        print("register Attendance Or Dismissal api error api $e");
      }
    }
  }


}
