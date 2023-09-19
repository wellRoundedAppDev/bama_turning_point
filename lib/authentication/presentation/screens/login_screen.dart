import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/forget_password_screen.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/sign_up_screen.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../checkout/presentation/screens/quick_checkout_main_screen.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';
import '../../../shared_components/custom_input.dart';

class SignInScreen extends StatelessWidget {
  bool isCheckingOut;
  SignInScreen({super.key,  this.isCheckingOut = false});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: AuthCubit.get(context).loginFormKey,
            child: Column(
              children: [
                ClipOval(
                    child: Image.asset(
                      ImagePaths.APP_LOGO,
                      width: 200,
                      height: 200,
                    )),
                CustomInput(hintText: "Email",
                textInputType: TextInputType.emailAddress,
                  validator: (v){
                  if(v == null || v.isEmpty == true){
                    return "Enter your email";
                  }
                },
                  onSaved: (v) => AuthCubit.get(context).loginFormInput.email,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Password",
                  validator: (v){
                    if(v == null || v.length < 6){
                      return "Enter a password of at least 6 characters";
                    }
                  },
                  onSaved: (v) => AuthCubit.get(context).loginFormInput.password,

                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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

                  ],),

                const SizedBox(
                  height: 16,
                ),
                BlocConsumer<AuthCubit,AuthStates>(
                  listener: (context,state){},
                  builder: (context,state){
                    return  CustomButton(text: "Login",
                        isLoading: state is LoginLoadingState,
                        action: () {
                          if(isCheckingOut == false){
                            AuthCubit.get(context).login();
                          }else{
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const QuickCheckoutMainScreen(),
                                    type: PageTransitionType.leftToRight));
                          }
                        });
                  },
                ),
                const SizedBox(height: 24,),
                (isCheckingOut == true)?Container(): Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("NEW HERE? ",style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,color: Color(0xff313846)),

                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(child: const SignUpScreen(), type: PageTransitionType.leftToRight));
                      },
                      child: const Text("SIGN UP!",style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,fontWeight:FontWeight.bold,color: Color(0xff313846)),

                      ),
                    ),

                  ],),

              ],
            ),
          ),
        ),
      ),
    ));
  }
}
