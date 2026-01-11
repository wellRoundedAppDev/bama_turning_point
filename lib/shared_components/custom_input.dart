import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {

  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  final FormFieldSetter<String>? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  bool obscureText = false;
  int? maxLines;
  int? minLines;
  double radius;
  bool readOnly;
  Color borderColor;
  Color? filledColor;
  double borderWidth;
  bool isFilled;
  String? initialValue;
  Function()? onTap;
  TextStyle? hintTextStyle;
  TextEditingController? controller;
  TextDirection? textDirection;
  String label;

  CustomInput({
    Key? key,
    this.hintText = "",
    this.label = "",
    this.controller,
    this.prefixIcon,
    this.isFilled = true,
    this.readOnly = false,
    this.suffixIcon,
    this.textDirection,
    this.onSaved,
    this.obscureText = false,
    this.textInputType,
    this.borderWidth = 1,
    this.validator,
    this.filledColor = AppColors.CUSTOM_INPUT_COLOR,
    this.hintTextStyle = const TextStyle(color: Color(0xff878787),fontSize: FontSizes.FONT_SIZE_16,fontWeight: FontWeight.w300),
    this.onTap,
    this.borderColor = Colors.transparent,
    this.minLines,
    this.initialValue,
    this.radius = 40,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: textDirection,
      maxLines: maxLines,
      minLines: minLines,
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      keyboardType: textInputType,
      obscureText: obscureText,
      onTap: onTap,

      readOnly: readOnly,
      initialValue: initialValue,
      decoration: InputDecoration(
        fillColor: filledColor,
        filled: isFilled,
        hintText: hintText,
        hintStyle: hintTextStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Text(label,style: const TextStyle(fontSize: FontSizes.FONT_SIZE_16,fontWeight: FontWeight.bold,
        color: Color(0xff313846)
        ),),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: borderColor, width: borderWidth)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: borderColor, width: borderWidth)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        // focusColor: Color(AppColors.LIGHT_GREY),
      ),
    );
  }













}



class EnglishDigitFormatter extends TextInputFormatter {
  static const arabic = '٠١٢٣٤٥٦٧٨٩';
  static const english = '0123456789';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String text = newValue.text;

    for (int i = 0; i < arabic.length; i++) {
      text = text.replaceAll(arabic[i], english[i]);
    }

    return newValue.copyWith(text: text);
  }
}

