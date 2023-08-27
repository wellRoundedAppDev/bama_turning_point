import 'package:classic_eccomerce/cart/presentation/widgets/wish_list_item.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/fonts/font_sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(
          title: "Shopping Cart", showBackButton: false, showCartIcon: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, bottom: 16, top: 24),
              itemBuilder: (context, index) {
                return const CartItem();
              },
              itemCount: 7,
            ),
          ),
          Container(
            height: 80,
            color: const Color(0xff313846),
            padding: const EdgeInsets.only(
              left: 20,
              right: 16,
              top: 16,
              bottom: 16,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "1478",
                        style: TextStyle(fontSize: FontSizes.FONT_SIZE_12),
                      )
                    ],
                  ),
                ),
                CustomButton(
                  text: "Checkout",
                  textFontSize: FontSizes.FONT_SIZE_14,
                  action: () {},
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
