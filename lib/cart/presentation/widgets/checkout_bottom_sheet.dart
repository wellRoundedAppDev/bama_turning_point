import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';

class CheckOutBottomSheet extends StatelessWidget {
  const CheckOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: const Color(0xff313846),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 16,
                bottom: 16,
              ),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      " : 1478",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_12,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 8,
                top: 8,
                bottom: 8,
              ),
              child: CustomButton(
                text: "Checkout",
                height: MediaQuery.of(context).size.height,
                textFontSize: FontSizes.FONT_SIZE_14,
                action: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
