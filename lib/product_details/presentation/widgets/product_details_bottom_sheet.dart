import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/product_details/presentation/screens/product_comparison_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: const Color(0xff313846),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          IconPaths.FAV_ICON,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, PageTransition(child:
                              const ProductComparisonScreen()
                              , type: PageTransitionType.leftToRight));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            IconPaths.COMPARE_ICON_2,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8, bottom: 8),
                    child: CustomButton(
                      text: "Buy Now",
                      color: const Color(0xff2EAF23),
                      height: MediaQuery.of(context).size.height,
                      textFontSize: FontSizes.FONT_SIZE_14,
                      action: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      right: 16,
                      bottom: 8,
                    ),
                    child: CustomButton(
                      text: "Add to cart",
                      height: MediaQuery.of(context).size.height,
                      textFontSize: FontSizes.FONT_SIZE_14,
                      action: () {},
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
