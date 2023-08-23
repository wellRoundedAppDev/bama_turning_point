import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(
            Icons.arrow_forward_sharp,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
