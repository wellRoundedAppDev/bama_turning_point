import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future setPrefferedPaymentMethodInSharedPrefs(Map<String,dynamic> preferredPaymentMethod) async {

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String preferredPaymentMethodJsonString = jsonEncode(preferredPaymentMethod);

  await prefs.setString('preferredPaymentMethod', preferredPaymentMethodJsonString);


}

Future<Map<String,dynamic>?> getpreferredPaymentMethodFromSharedPrefs() async {

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? preferredPaymentMethodJsonString = prefs.getString('preferredPaymentMethod');
  if(preferredPaymentMethodJsonString == null){
    return null;
  }
  return jsonDecode(preferredPaymentMethodJsonString);


}

clearPreferredPaymentMethodFromSharedPrefs() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('preferredPaymentMethod');
}