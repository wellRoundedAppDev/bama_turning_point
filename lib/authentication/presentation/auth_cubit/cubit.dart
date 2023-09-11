import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/authentication/data/data_sources/remote_data_sources/auth_apis.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/dio_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  
  final dioHelper = DioHelper.instance;

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<bool> setSessionId() async {
    var response = await AuthApis.getSessionId();
    if(response != null){
      dioHelper.addHeader("X-Oc-Session", response);
      return true;
    }else{
      return false;
    }
  }


}
