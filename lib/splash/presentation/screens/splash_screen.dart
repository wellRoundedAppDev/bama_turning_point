import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

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
                "assets/images/app_splash.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              )),
          Container(
            color: const Color(0xff025A64).withOpacity(0.45),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ClipOval(
                      child: Image.asset(
                    "assets/images/app_logo.png",
                    width: 200,
                    height: 200,
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "SHOP NOW",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ))
        ],
      ),
    ));
  }


}
