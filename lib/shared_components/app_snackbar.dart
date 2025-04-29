import 'package:classic_eccomerce/main.dart';
import 'package:flutter/material.dart';

showAppSnackBar({required String content,Color? color =const Color(0xff101216)}) {
  BuildContext context = MyApp.navKey.currentState!.context;
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Text(
      content,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: color,
  ));
}
