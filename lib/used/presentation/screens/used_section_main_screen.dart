import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/used/presentation/screens/add_used_product_by_client_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UsedSectionMainScreen extends StatelessWidget {
  bool showBackButton;
  UsedSectionMainScreen({Key? key, this.showBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar.renderAppBar(
                title: "", showBackButton: showBackButton, showCartIcon: false),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const AddUsedProductByClientScreen(),
                        type: PageTransitionType.leftToRight));
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 32, right: 16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.APP_MAIN_COLOR,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: const BoxDecoration(
                          color: AppColors.APP_MAIN_COLOR,
                        ),
                        child: const Text(
                          "من الشركة",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSizes.FONT_SIZE_15,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: const BoxDecoration(
                          color: AppColors.APP_MAIN_COLOR,
                        ),
                        child: const Text(
                          "من الزبائن",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSizes.FONT_SIZE_15,
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            )));
  }
}
