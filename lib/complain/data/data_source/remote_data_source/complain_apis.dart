import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../../core/data/models/success_message_response.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../main.dart';

class ComplainApis {
  static final dioHelper = DioHelper.instance;

  static Future<SuccessAndErrorResponse?> Complain(
    Map<String, dynamic> complainInput,
  ) async {
    String endpoint = ApiUrls.Complain_ENDPOINT;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    try {
      var response = await dioHelper.post(
          endPoint: endpoint,
          body: complainInput,
          headers: {"Authorization": "Bearer $accessToken"});

      if (response == null) {
        return null;
      }
      return SuccessAndErrorResponse(
          success:
              response.data['IsSuccssed'],
          errorMsgs: response.data['Message']);
    } catch (e) {
      if (kDebugMode) {
        print("Register error api $e");
      }
    }
  }
}
