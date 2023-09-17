import 'package:classic_eccomerce/authentication/presentation/screens/forget_password_screen.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../checkout/presentation/screens/quick_checkout_main_screen.dart';
import '../../../shared_components/custom_button.dart';
import '../../../shared_components/custom_input.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInput(hintText: "Phone Number",
              textInputType: TextInputType.phone,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomInput(
                hintText: "Password",
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(text: "Login", action: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const QuickCheckoutMainScreen(),
                        type: PageTransitionType.leftToRight));
              }),
              const SizedBox(height: 16,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("FORGOT PASSWORD? ",style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,color: Color(0xff313846)),

                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: const ForgetPasswordScreen(), type: PageTransitionType.leftToRight));
                  },
                  child: const Text("GET NEW!",style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,fontWeight:FontWeight.bold,color: Color(0xff313846)),

                  ),
                ),

              ],)

            ],
          ),
        ),
      ),
    ));
  }
}
