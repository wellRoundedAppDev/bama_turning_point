
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';
import '../../model/get_response_model/get_manufacture_company_response.dart';

class GetManufactureFilterApi {
  static final dioHelper = DioHelper.instance;

  static Future<GetManufactureCompanyResponse?> getManufacture() async {
    String endPoint = ApiUrls.GET_ManufacturerCompany_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    try {
      var response = await dioHelper.get(endpoint: endPoint,headers: {
        "Authorization": "Bearer $accessToken",
      });
      if (response == null) {
        return null;
      }
      return GetManufactureCompanyResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}