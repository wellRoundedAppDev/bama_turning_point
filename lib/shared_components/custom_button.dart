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
  double? elevation;
  double? circularProgressIndicatorSize;

  CustomButton(
      {Key? key,
      required this.text,
      required this.action,
      this.elevation = 0,
      this.color = AppColors.APP_MAIN_COLOR,
      this.textFontSize = FontSizes.FONT_SIZE_16,
      this.textColor = 0xff313846,
        this.circularProgressIndicatorSize,
      this.borderRadius = 0,
      this.buttonBorderWidthColor = AppColors.APP_MAIN_COLOR,
      this.fontWeight = FontWeight.bold,
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
              elevation: elevation,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius))),
          onPressed:(){
            if(isLoading){
              return;
            }
            action!();
          },
          child: (isLoading)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: textFontSize,
                          fontWeight: fontWeight,
                          color: Color(textColor)),
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
