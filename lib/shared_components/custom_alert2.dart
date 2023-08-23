import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../core/constants/fonts/font_sizes.dart';
import '../main.dart';


BuildContext context = MyApp.navKey.currentState!.context;
Future<void> showCustomAlert2(
    {required AlertType alertType,
    String title = "",
    required String content,
    required String buttonLabel,
    Function()? action}) async {
  await Alert(
      context: context,
      type: alertType,
      title: title,
      desc: content,
      buttons: [
        DialogButton(
            onPressed: (action == null)
                ? () {
                    Navigator.pop(context);
                  }
                : () {
                    action();
                    Navigator.pop(context);

            },
            child: Text(
              buttonLabel,
              style: const TextStyle(
                  fontSize: FontSizes.FONT_SIZE_20, color: Colors.white),
            ))
      ]).show();
}
