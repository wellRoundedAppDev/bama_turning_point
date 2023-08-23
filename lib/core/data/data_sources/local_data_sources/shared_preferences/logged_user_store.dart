import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future setLoginCredentialsInSharedPrefs(Map<String,dynamic> credentials) async {

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String credentialsJsonString = jsonEncode(credentials);

  await prefs.setString('loginCreds', credentialsJsonString);


}

Future<Map<String,dynamic>?> getLoginCredentialsFromSharedPrefs() async {

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? credentialsJsonString = prefs.getString('loginCreds');
  if(credentialsJsonString == null){
    return null;
  }
  return jsonDecode(credentialsJsonString);


}

clearLoginCredentialsFromSharedPrefs() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('loginCreds');
}