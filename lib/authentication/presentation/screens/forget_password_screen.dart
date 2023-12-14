import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';
import '../../../shared_components/custom_input.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "Forget Password",showCartIcon: false),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Forgot Your Password?",
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
              color: AppColors.APP_MAIN_COLOR,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Enter phone number associated with your account to verify it.",
              style: TextStyle(
                  fontSize: FontSizes.FONT_SIZE_16, color: Color(0xff705E5E)),
            ),
            const SizedBox(height: 24,),
            CustomInput(hintText: "Phone number"),
            const SizedBox(
              height: 16,
            ),
            CustomButton(text: "Send OTP", action: () {}),
            const SizedBox(height: 16),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text("Back To ",style: TextStyle(fontSize: FontSizes.FONT_SIZE_14),),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Text("Sign In",style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,color: Color(0xff313846),
                fontWeight: FontWeight.bold
                ),),
              )
            ],)
          ],
        ),
      ),
    ));
  }
}
