
import 'package:flutter/material.dart';

class YellowCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(
        size.width * .4, size.height * 0.2, size.width * .2, size.height * 0.4);
    path.quadraticBezierTo(
        0, size.height * 0.75, size.width, size.height * 0.9);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(YellowCurveClipper oldClipper) => false;
}