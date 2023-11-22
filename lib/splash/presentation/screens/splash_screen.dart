import 'package:classic_eccomerce/core/constants/fonts/font_families.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/home_layout/presentation/screens/home_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          PageTransition(
              child: const HomeLayoutScreen(), type: PageTransitionType.fade)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Image.asset(
                ImagePaths.APP_SPLASH,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              child: Image.asset(
                ImagePaths.APP_LOGO,
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.3,
              ))
        ],
      ),
    ));
  }
}
