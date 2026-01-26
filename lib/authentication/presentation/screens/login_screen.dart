import 'package:classic_eccomerce/authentication/data/data_sources/local_data_source/login_credentials_store.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/forget_password_screen.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/sign_up_new_screen.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/sign_up_screen.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/face_recogonition/presentation/screens/face_detection_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/locales/l10n/app_localizations.dart';
import '../../../shared_components/custom_button.dart';
import '../../../shared_components/custom_input.dart';

class SignInScreen extends StatelessWidget {
  bool isCheckingOut;

  SignInScreen({
    super.key,
    this.isCheckingOut = false,
  });

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: AuthCubit.get(context).loginFormKey,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 60,),
                    // Row(children: [
                    //   IconButton(onPressed: (){
                    //     Navigator.pop(context);
                    //   }, icon:
                    //   const Icon(Icons.arrow_back)
                    //   )
                    // ],),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    ClipOval(
                        child: Image.asset(
                      ImagePaths.APP_LOGO,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                    )),
                    const SizedBox(height: 16,),

                    Text(AppLocalizations.of(context)!.login,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: FontSizes.FONT_SIZE_20),),

                    const SizedBox(
                      height: 32,
                    ),
                    CustomInput(
                      label:
                          AppLocalizations.of(context)!.username,

                      hintText:
                          AppLocalizations.of(context)!.username,

                      validator: (value) {
                        if (value == null || value.isEmpty
                            // (value?.length??0) < 8 ||
                            // (value?.length??0) > 13
                            ) {
                          return AppLocalizations.of(context)!
                              .enter_your_main_userName;
                        }
                      },

                      textInputType: TextInputType.name,
                      onSaved: (v) => AuthCubit.get(context)
                          .loginFormInput
                          .username = v?.trim(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      label: AppLocalizations.of(context)!.password,
                      hintText: AppLocalizations.of(context)!.password,
                      obscureText: true,
                      validator: (v) {
                        if (v == null || v.length < 6) {
                          return AppLocalizations.of(context)!
                              .enter_a_password_of_at_least_six_characters;
                        }
                      },
                      onSaved: (v) => AuthCubit.get(context)
                          .loginFormInput
                          .password = v?.trim(),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Text(
                    //       "${AppLocalizations.of(context)!.forgot_password} ",
                    //       style: const TextStyle(
                    //           fontSize: FontSizes.FONT_SIZE_14,
                    //           color: Color(0xff313846)),
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             PageTransition(
                    //                 child: const ContactUsScreen(),
                    //                 type: PageTransitionType.leftToRight));
                    //       },
                    //       child: Text(
                    //         AppLocalizations.of(context)!.contact_us,
                    //         style: const TextStyle(
                    //             fontSize: FontSizes.FONT_SIZE_14,
                    //             fontWeight: FontWeight.bold,
                    //             color: Color(0xff313846)),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //      Text(
                    //       "${AppLocalizations.of(context)!.did_you_forget_password} ",
                    //       style: const TextStyle(
                    //           fontSize: FontSizes.FONT_SIZE_14,
                    //           color: Color(0xff313846)),
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             PageTransition(
                    //                 child: const ForgetPasswordScreen(),
                    //                 type: PageTransitionType.leftToRight));
                    //       },
                    //       child: const Text(
                    //         "GET NEW!",
                    //         style: TextStyle(
                    //             fontSize: FontSizes.FONT_SIZE_14,
                    //             fontWeight: FontWeight.bold,
                    //             color: Color(0xff313846)),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 32,
                    ),
                    BlocConsumer<AuthCubit, AuthStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return CustomButton(
                            text: AppLocalizations.of(context)!.login,
                            isLoading: state is LoginLoadingState,
                            action: () async {


                              AuthCubit.get(context).loginFromLoginForm(
                                  isCheckingOut: isCheckingOut,
                                 );
                            });
                      },
                    ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // (isCheckingOut == true)
                    //     ? Container()
                    //     : Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             "${AppLocalizations.of(context)!.new_here} ",
                    //             style: const TextStyle(
                    //                 fontSize: FontSizes.FONT_SIZE_14,
                    //                 color: Color(0xff313846)),
                    //           ),
                    //           GestureDetector(
                    //             onTap: () {
                    //               Navigator.push(
                    //                   context,
                    //                   PageTransition(
                    //                       child: BlocProvider.value(
                    //                           value: CartCubit.get(context),
                    //                           child: SignUpScreen()),
                    //                       type: PageTransitionType.leftToRight));
                    //             },
                    //             child: Text(
                    //               "${AppLocalizations.of(context)!.sign_up}!",
                    //               style: const TextStyle(
                    //                   fontSize: FontSizes.FONT_SIZE_14,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Color(0xff313846)),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                  ],
                ),
              ),

        // Positioned(
        //   top: 40,
        //   left: 0,
        //   child: IconButton(onPressed: (){
        //     Navigator.pop(context);
        //   }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,))),
              Positioned(
                top: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.height * 0.35,
                child: Image.asset(ImagePaths.ORANGE_CURVY_DECORATION,
                  fit: BoxFit.cover,

                ),
              ),

              Positioned(




                  child: GestureDetector(
                      onTap: (){
                        if (kDebugMode) {
                          print("object");
                        }
                        showDialog(context: context,builder: (context)=>Material(child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 60,),
                              SizedBox(
                                  height: 50,
                                  child: CustomInput(controller: controller,

                                  borderColor: AppColors.APP_MAIN_COLOR,
                                  )),

                              const SizedBox(height: 24,),

                              CustomButton(text: "Submit", action: () async {

                               


                                // if (kDebugMode) {
                                //   print(controller.text);
                                // }
                                // var saveLoginData = await getLoginCredentialsFromSharedPrefs();
                                // if(saveLoginData != null){
                                //   controller.text =  saveLoginData['baseUrl']??"";
                                // }
                                ApiUrls.BASE_URL =


                                    controller.text;

                                if (kDebugMode) {
                                  print(ApiUrls.BASE_URL);
                                }
                                Navigator.pop(context);
                              })
                            ],
                          ),
                        )));
                      },
                      child: Container(color: Colors.transparent,height: 50,width: 50))
              ),

            ],
          ),
        ),
      ),
    );
  }
}
