import 'package:flutter/widgets.dart';

class LocaleProvider extends ChangeNotifier{

  Locale _locale = const Locale("ar");

  Locale get locale => _locale;

  setLocale(Locale locale){
    _locale = locale;
    notifyListeners();
  }
  setDefaultLocale(){
    _locale = const Locale("ar");
    notifyListeners();
  }
}