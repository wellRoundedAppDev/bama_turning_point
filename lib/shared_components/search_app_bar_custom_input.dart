import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchAppBarCustomInput extends StatelessWidget {
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
  TextAlign? textAlign;

  SearchAppBarCustomInput({
    Key? key,
    this.hintText = "",
    this.controller,
    this.prefixIcon,
    this.isFilled = false,
    this.readOnly = false,
    this.suffixIcon,
    this.textDirection,
    this.onSaved,
    this.obscureText = false,
    this.textInputType,
    this.borderWidth = 1,
    this.validator,
    this.textAlign = TextAlign.left,
    this.filledColor = const Color(0xff5A606B),
    this.hintTextStyle,
    this.onTap,
    this.borderColor = Colors.white,
    this.minLines,
    this.initialValue,
    this.radius = 20,
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
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: borderColor, width: borderWidth)),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: borderColor, width: borderWidth)),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        // focusColor: Color(AppColors.LIGHT_GREY),
      ),
    );
  }
}
