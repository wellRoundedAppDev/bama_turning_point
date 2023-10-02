import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "Quick Checkout",cartCubit: CartCubit.get(context)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.check_circle,
                color: Color(0xff2EAF23),
                size: 100,
              ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: Text(
                  "Your order has been successfully processed!",
                  style: TextStyle(
                      color: Color(0xff313846),
                      fontSize: FontSizes.FONT_SIZE_16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                  text: const TextSpan(
                      text:
                          "- You can view your order history by going to the my ",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_14,
                          color: Color(0xff434248)),
                      children: [
                    TextSpan(
                      text: "account page ",
                      style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Color(0xff6157E2),
                      ),
                    ),
                    TextSpan(
                      text: "and by clicking on ",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_14,
                          color: Color(0xff434248)),
                    ),
                    TextSpan(
                      text: "history.",
                      style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Color(0xff2859E1),
                      ),
                    ),
                  ])),
              const SizedBox(
                height: 24,
              ),
              RichText(
                  text: const TextSpan(
                      text:
                          "- If your purchase has an associated download, you can go to the account ",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_14,
                          color: Color(0xff484242)),
                      children: [
                    TextSpan(
                      text: "downloads ",
                      style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Color(0xff426CE2),
                      ),
                    ),
                    TextSpan(
                      text: "page to view them.",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_14,
                          color: Color(0xff484242)),
                    ),
                  ])),
              const SizedBox(
                height: 24,
              ),
              RichText(
                  text: const TextSpan(
                      text: "- Please direct any questions you have to the ",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_14,
                          color: Color(0xff484242)),
                      children: [
                    TextSpan(
                      text: "store owner.",
                      style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Color(0xff1E49D5),
                      ),
                    ),
                  ])),
              const SizedBox(
                height: 32,
              ),
              const Center(
                child: Text(
                  "Thanks for shopping with us online!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: FontSizes.FONT_SIZE_16,
                      color: Color(0xff484242)),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
