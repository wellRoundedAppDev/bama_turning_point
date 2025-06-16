import 'package:classic_eccomerce/shared_components/yellow_curve.dart';
import 'package:flutter/material.dart';

import '../core/constants/colors/colors.dart';

class AppbarContainer extends StatelessWidget {
  String title;

  AppbarContainer({ required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration:  BoxDecoration(
        color: AppColors.APP_SECONDARY_COLOR, // Dark blue
        borderRadius:const BorderRadius.only(
          bottomLeft:const Radius.circular(40),
          bottomRight:const Radius.circular(40),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child:Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(40)),
                child: ClipPath(
                  clipper: YellowCurveClipper(),
                  child: Container(
                    width: 60,
                    height: 80,
                    color: AppColors.APP_MAIN_COLOR,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon:const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}