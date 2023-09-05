import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickCheckoutMainScreen extends StatelessWidget {
  const QuickCheckoutMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar.renderAppBar(title: "Quick Checkout"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(color: Color(0xffF5F5F5)),
              child: Row(
                children: [
                  Image.asset(IconPaths.SHIPPING,width: 50,height: 50,fit: BoxFit.cover,),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "SHIPPING METHOD",
                            style: TextStyle(
                                color: Color(0xff1E1B1B),
                                fontWeight: FontWeight.bold,
                                fontSize: FontSizes.FONT_SIZE_20),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: 1,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                          dense: true,

                          onChanged: (check) {},
                          title: const Text(
                            "Flat Shipping Rate - \$5.00",
                            style: TextStyle(fontSize: FontSizes.FONT_SIZE_16),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
