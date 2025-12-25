import 'package:classic_eccomerce/account/data/models/get_account_details_response.dart';
import 'package:classic_eccomerce/account/data/models/get_order_details_response.dart';
import 'package:classic_eccomerce/core/data/models/success_message_response.dart';
import 'package:classic_eccomerce/profile/data/model/get_employee_by_id_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';

class GetEmployeeProfileApis {
  static final dioHelper = DioHelper()..init(ApiUrls.BASE_URL);

  static Future<GetEmployeeResponse?> getEmployeeById(
      ) async {
    String endpoint = ApiUrls.GET_EMPLOYEE_BY_ID_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    try {

      int id = MyApp.navKey.currentState?.context.read<AuthCubit>().loginResponse?.loginData?.employeeId??0;
      var response = await dioHelper.get(
        endpoint: endpoint,
        headers: {"Authorization": "Bearer $accessToken"},
        queryParameters: {"Id":id}
        //       body: loginInput,
        //    headers: {"Authorization": "Bearer $accessToken"}
      );

      if (response == null) {
        return null;
      }


      return GetEmployeeResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print("GetEmployeeResponse  api $e");
      }
    }
  }
}
