import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/forget_password_screen.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/sign_up_screen.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../checkout/presentation/cubits/check_out_cubit.dart';
import '../../../checkout/presentation/screens/quick_checkout_main_screen.dart';
import '../../../checkout/presentation/screens/set_billing_address_for_registered_user_screen.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';
import '../../../shared_components/custom_input.dart';

class SignInScreen extends StatelessWidget {
  bool isCheckingOut;
  SignInScreen({
    super.key,
    this.isCheckingOut = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: AuthCubit.get(context).loginFormKey,
            child: Column(
              children: [
                const SizedBox(height: 16,),
                ClipOval(
                    child: Image.asset(
                  ImagePaths.APP_LOGO,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.2,
                )),
                const SizedBox(height: 16,),
                CustomInput(
                  hintText: "Phone number",
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.length != 9) {
                      return 'Enter a valid phone number';
                    }
                  },
                  onSaved: (v) =>
                      AuthCubit.get(context).loginFormInput.email = v?.trim(),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Password",
                  validator: (v) {
                    if (v == null || v.length < 6) {
                      return "Enter a password of at least 6 characters";
                    }
                  },
                  onSaved: (v) => AuthCubit.get(context)
                      .loginFormInput
                      .password = v?.trim(),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "FORGOT PASSWORD? ",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_14,
                          color: Color(0xff313846)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const ForgetPasswordScreen(),
                                type: PageTransitionType.leftToRight));
                      },
                      child: const Text(
                        "GET NEW!",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff313846)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return CustomButton(
                        text: "Login",
                        isLoading: state is LoginLoadingState,
                        action: () {
                          AuthCubit.get(context).login(
                              isCheckingOut: isCheckingOut,
                              cartCubit: CartCubit.get(context));
                        });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                (isCheckingOut == true)
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "NEW HERE? ",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: SignUpScreen(),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: const Text(
                              "SIGN UP!",
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff313846)),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
