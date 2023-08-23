import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../core/constants/fonts/font_sizes.dart';

Future<void> showCustomAlert(BuildContext context, AlertType alertType,
    String? title, String? content) async {
  await Alert(
      context: context,
      type: alertType,
      title: title,
      desc: content,
      buttons: [
        DialogButton(
            child: Text(
              "تم",
              style: TextStyle(
                  fontSize: FontSizes.FONT_SIZE_20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            })
      ]).show();
}
