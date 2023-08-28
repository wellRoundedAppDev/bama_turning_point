import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(

                        top: 8.0,right: 16,
                    bottom: 8,
                      left: 16
                    ),
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
                    padding: const EdgeInsets.all(
                        8
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
