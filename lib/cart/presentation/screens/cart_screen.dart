import 'package:classic_eccomerce/cart/presentation/widgets/checkout_bottom_sheet.dart';
import 'package:classic_eccomerce/cart/presentation/widgets/cart_item.dart';
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
                return (index == 6)
                    ? const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: CheckOutBottomSheet()
                      )
                    : const CartItem();
              },
              itemCount: 7,
            ),
          ),
        ],
      ),
    ));
  }
}
