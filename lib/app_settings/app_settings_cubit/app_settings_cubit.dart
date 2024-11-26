import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_states.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../cart/presentation/cubits/cart_cubit/cubit.dart';

class AppSettingsCubit extends Cubit<AppSettingsStates>{
  AppSettingsCubit():super(AppSettingsInitialState());

  static AppSettingsCubit get(context) => BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;

  String currencyCode = "IQD";

  changeCurrency(String currencyCode){
    this.currencyCode = currencyCode;
    emit(ChangeCurrencyState());
  }

  launchApp(){
    //NotificationsCubit.get(context).init();
    AuthCubit.get(context).autoLogin(cartCubit: CartCubit.get(context));

  }



}