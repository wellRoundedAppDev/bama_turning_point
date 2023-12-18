import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/core/locales/locale_cubit/locale_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

class LocaleCubit extends Cubit<LocaleStates>{

  LocaleCubit() : super(LocaleInitialState());

  static LocaleCubit get(BuildContext context) => BlocProvider.of(context);


  Locale _locale = const Locale("ar");

  Locale get locale => _locale;

  setLocale(Locale locale){
    _locale = locale;
    emit(ChangeLanguageState());
  }

  setDefaultLocale(){
    _locale = const Locale("ar");
    emit(ChangeLanguageState());
  }
}