import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/constants/colors/colors.dart';
import '../core/constants/fonts/font_sizes.dart';

class CustomButton extends StatelessWidget {
  String text;
  Color color;
  Function()? action;
  double textFontSize;
  double height;
  int textColor;
  Color buttonBorderWidthColor;
  FontWeight fontWeight;
  bool isLoading;
  Widget? icon;
  double borderRadius;

  CustomButton(
      {Key? key,
      required this.text,
      required this.action,
      this.color = AppColors.APP_MAIN_COLOR,
      this.textFontSize = FontSizes.FONT_SIZE_22,
      this.textColor = 0xffffffff,
        this.borderRadius = 32,
      this.buttonBorderWidthColor = AppColors.APP_MAIN_COLOR,
      this.fontWeight = FontWeight.w800,
      this.isLoading = false,
      this.icon,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: buttonBorderWidthColor),
                  borderRadius: BorderRadius.circular(borderRadius))),
          onPressed: (isLoading) ? null : action,
          child: (isLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: textFontSize,
                            fontWeight: fontWeight,
                            color: Color(textColor)),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(child: (icon)),
                  ],
                ),
        ));
  }
}
