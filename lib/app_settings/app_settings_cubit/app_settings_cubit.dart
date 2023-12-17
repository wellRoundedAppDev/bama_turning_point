import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSettingsCubit extends Cubit<AppSettingsStates>{
  AppSettingsCubit():super(AppSettingsInitialState());

  static AppSettingsCubit get(context) => BlocProvider.of(context);

  String currencyCode = "IQD";

  changeCurrency(String currencyCode){
    this.currencyCode = currencyCode;
    //emit(ChangeCurrencyState());
  }


}