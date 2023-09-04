import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_app_bar.dart';
import '../../../shared_components/custom_button.dart';
import '../../../shared_components/custom_input.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          CustomAppBar.renderAppBar(title: "My Account", showBackButton: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Change your password",
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
              CustomInput(hintText: "E-mail"),
              const SizedBox(
                height: 16,
              ),
              CustomInput(
                hintText: "Telephone",
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(text: "Save", action: () {}),


            ],
          ),
        ),
      ),
    ));
  }
}
