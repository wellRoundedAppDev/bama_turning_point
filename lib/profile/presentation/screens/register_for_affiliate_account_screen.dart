import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_app_bar.dart';
import '../../../shared_components/custom_input.dart';

class RegisterForAffiliateAccountScreen extends StatelessWidget {
  const RegisterForAffiliateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "My Account"),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Affiliate Account",
                  style: TextStyle(
                      color: Color(0xff313846),
                      fontSize: FontSizes.FONT_SIZE_20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 40,
                  height: 3,
                  color: const Color(0xff015963),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Company",
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Website",
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Payment Information ",
                  style: TextStyle(
                      color: Color(0xff313846),
                      fontSize: FontSizes.FONT_SIZE_20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 40,
                  height: 3,
                  color: const Color(0xff015963),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Tax ID",
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Payment Method",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_18,
                      color: Color(0xff8D7579)),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                  title: const Text(
                    "Cheque",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff473A3C)),
                  ),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                  title: const Text(
                    "PayPal",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff473A3C)),
                  ),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                  title: const Text(
                    "Bank Transfer",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff473A3C)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Cheque Payee Name",
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(value: false, onChanged: (check) {}),
                    const SizedBox(
                      width: 16,
                    ),
                    const Expanded(
                      child: Text(
                        "I have read and agree to the About Us",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            color: Color(0xff313846)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  text: 'Send',
                  action: () {},
                ),
              ],
            )),
      ),
    ));
  }
}
