import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const TurningPointApp());
}

class TurningPointApp extends StatelessWidget {
  const TurningPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1C61),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 200,
              width: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFF8A71A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: ClipPath(
          //     clipper: WaveClipper(),
          //     child: Container(
          //       height: 200,
          //       width: 200,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImagePaths.APP_LOGO, // Replace with your logo path
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'HUMAN RESOURCE',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2,
                  ),
                ),
                const SizedBox(height: 60),

                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color(0xFFF8A71A),
                //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //   ),
                //   onPressed: () {},
                //   child: const Text(
                //     'تسجيل دخول',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // )
              ],
            ),
          ),

          Positioned(
            bottom: 50,
            left: 40,
            right: 40,
            child: CustomButton(text: AppLocalizations.of(context)!.login, action: (){},
              borderRadius: 50,
            ),
          ),

        ],
      ),
    );
  }
}

// Simple wave shape clipper for the bottom white shape
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(size.width / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
