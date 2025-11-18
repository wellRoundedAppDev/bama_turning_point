import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/data/models/success_message_response.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/register_attendance_by_location/data/models/get_geo_fences_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../main.dart';

class AttendanceByLocationApis {
  static final dioHelper = DioHelper.instance;

  static Future<GeoFencesResponse?> getGeoFences() async {
    String endpoint = ApiUrls.GET_GEOFENCES_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {
      var response = await dioHelper.get(endpoint: endpoint,

          headers: {"Authorization": "Bearer $accessToken"});
      return GeoFencesResponse.fromJson(response?.data);
    } catch (e) {
      if (kDebugMode) {
        print("Get Geofences api error api $e");
      }
    }
  }


}
