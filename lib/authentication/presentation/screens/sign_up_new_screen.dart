import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../shared_components/custom_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {

  bool showBackButton;
  SignUpScreen({
    super.key,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: AuthCubit.get(context).registerFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    (showBackButton == false)
                        ? Container()
                        : const Row(
                      children: [BackButton()],
                    ),
                    Center(
                      child: ClipOval(
                          child: Image.asset(
                            ImagePaths.APP_LOGO,
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.2,
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      label: AppLocalizations.of(context)!.full_name,
                      hintText: AppLocalizations.of(context)!.full_name,
                      validator: (value) {
                        if (value!.trim() == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.enter_full_name;
                        }
                        // if ((value?.split(" ")?.length ?? 0) == 1 ||
                        //     value?.split(" ")?.last?.isEmpty == true ||
                        //     value?.split(" ")?.last == " ") {
                        //   return AppLocalizations.of(context)!
                        //       .enter_full_name;
                        // }
                      },
                      onSaved: (v) {
                        // AuthCubit.get(context).registerFormInput.firstName =
                        //     v?.trim()?.split(" ")?.first;
                        // if ((v?.split(" ")?.length ?? 0) > 1) {
                        //   AuthCubit.get(context).registerFormInput.lastName =
                        //       v?.trim()?.split(" ")?.last;
                        // }
                        AuthCubit.get(context).registerFormInput.name=v!.trim();
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      label: AppLocalizations.of(context)!.name_user,
                      hintText: AppLocalizations.of(context)!.name_user,
                      validator: (value) {
                        if (value!.trim() == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.enter_name_user;
                        }
                        // if ((value?.split(" ")?.length ?? 0) == 1 ||
                        //     value?.split(" ")?.last?.isEmpty == true ||
                        //     value?.split(" ")?.last == " ") {
                        //   return AppLocalizations.of(context)!
                        //       .enter_name_user;
                        // }
                      },
                      onSaved: (v) {
                        // AuthCubit.get(context).registerFormInput.firstName =
                        //     v?.trim()?.split(" ")?.first;
                        // if ((v?.split(" ")?.length ?? 0) > 1) {
                        //   AuthCubit.get(context).registerFormInput.lastName =
                        //       v?.trim()?.split(" ")?.last;
                        // }
                        AuthCubit.get(context).registerFormInput.userName =v!.trim();
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // CustomInput(
                    //   label: AppLocalizations.of(context)!.phone_number,
                    //   hintText: AppLocalizations.of(context)!.phone_number,
                    //   validator: (value) {
                    //     if (
                    //     // value == null ||
                    //     // value.isEmpty
                    //     (value?.length??0) < 8 ||
                    //         (value?.length??0) > 13
                    //     ) {
                    //       return AppLocalizations.of(context)!.enter_a_valid_phone_number;
                    //     }
                    //   },
                    //   textInputType: TextInputType.phone,
                    //
                    //   onSaved: (v) => AuthCubit.get(context)
                    //       .registerFormInput
                    //       .phoneNumber = v?.trim(),
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    CustomInput(
                      label: AppLocalizations.of(context)!
                          .email,
                      hintText: AppLocalizations.of(context)!
                          .email,
                      textInputType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.isEmpty == true) {
                          return AppLocalizations.of(context)!
                              .enter_your_email_to_get_updates;
                        } else if (EmailValidator.validate(v) != true) {
                          return AppLocalizations.of(context)!
                              .email_valid;
                        }
                      },
                      onSaved: (v) => AuthCubit.get(context)
                          .registerFormInput
                          .email = v?.trim(),
                    ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 16, right: 8),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: const Color(0xff95989A))),
                    //   child: DropdownSearch<String>(
                    //     asyncItems: (String filter) async {
                    //       // var res =
                    //       // searchAdsCubit.getJobCategories();
                    //       return ["ss"];
                    //     },
                    //     dropdownDecoratorProps: const DropDownDecoratorProps(
                    //         dropdownSearchDecoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintStyle: TextStyle(
                    //               fontSize: FontSizes.FONT_SIZE_16,
                    //               color: Color(0xff878787),
                    //             ),
                    //             hintText: "Gender")),
                    //     dropdownButtonProps: const DropdownButtonProps(
                    //         icon: Icon(
                    //       Icons.keyboard_arrow_down,
                    //       color: Color(0xff696C6E),
                    //     )),
                    //     popupProps: PopupProps.menu(
                    //         itemBuilder: (context, String sort, bool) {
                    //       return const Padding(
                    //         padding: EdgeInsets.all(16.0),
                    //         child: Text(
                    //           "Gender",
                    //           style: TextStyle(
                    //               fontSize: FontSizes.FONT_SIZE_16,
                    //               color: Color(0xff878787)),
                    //         ),
                    //       );
                    //     }),
                    //     dropdownBuilder: (context, sort) {
                    //       return const Text(
                    //         "Gender",
                    //         style: TextStyle(
                    //             fontSize: FontSizes.FONT_SIZE_16,
                    //             color: Color(0xff878787)),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),



                    // CustomInput(
                    //   label: AppLocalizations.of(context)!.first_name,
                    //   hintText: AppLocalizations.of(context)!.first_name,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return AppLocalizations.of(context)!
                    //           .enter_your_first_name;
                    //     }
                    //   },
                    //   onSaved: (v) =>
                    //       AuthCubit.get(context).registerFormInput.firstName = v,
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // CustomInput(
                    //   label: AppLocalizations.of(context)!.family_name,
                    //   hintText: AppLocalizations.of(context)!.family_name,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return AppLocalizations.of(context)!
                    //           .enter_your_family_name;
                    //     }
                    //   },
                    //   onSaved: (v) =>
                    //       AuthCubit.get(context).registerFormInput.lastName = v,
                    // ),


                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      label: AppLocalizations.of(context)!.password,
                      hintText: AppLocalizations.of(context)!.password,
                      validator: (v) {
                        if (v == null || v.length < 6) {
                          return AppLocalizations.of(context)!
                              .enter_a_password_of_at_least_six_characters;
                        }
                      },
                      onSaved: (v) =>
                      AuthCubit.get(context).registerFormInput.password = v,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // CustomInput(
                    //   label: AppLocalizations.of(context)!.confirm_password,
                    //   hintText: AppLocalizations.of(context)!.confirm_password,
                    //   validator: (v) {
                    //     if (v == null || v.length < 6) {
                    //       return AppLocalizations.of(context)!
                    //           .enter_a_password_of_at_least_six_characters;
                    //     }
                    //   },
                    //   onSaved: (v) => AuthCubit.get(context)
                    //       .registerFormInput
                    //       .confirmPassword = v,
                    // ),
                    // const SizedBox(
                    //   height: 24,
                    // ),

                    // const Text(
                    //   "Billing Address",
                    //   style: TextStyle(
                    //       fontSize: FontSizes.FONT_SIZE_16,
                    //       fontWeight: FontWeight.bold,
                    //       color: Color(0xff313846)),
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // CustomInput(
                    //   hintText: "Address 1",
                    //   textInputType: TextInputType.phone,
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 16, right: 8),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: const Color(0xff95989A))),
                    //   child: DropdownSearch<String>(
                    //     asyncItems: (String filter) async {
                    //       // var res =
                    //       // searchAdsCubit.getJobCategories();
                    //       return ["ss"];
                    //     },
                    //     dropdownDecoratorProps: const DropDownDecoratorProps(
                    //         dropdownSearchDecoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintStyle: TextStyle(
                    //               fontSize: FontSizes.FONT_SIZE_16,
                    //               color: Color(0xff878787),
                    //             ),
                    //             hintText: "City")),
                    //     dropdownButtonProps: const DropdownButtonProps(
                    //         icon: Icon(
                    //       Icons.keyboard_arrow_down,
                    //       color: Color(0xff696C6E),
                    //     )),
                    //     popupProps: PopupProps.menu(
                    //         itemBuilder: (context, String sort, bool) {
                    //       return const Padding(
                    //         padding: EdgeInsets.all(16.0),
                    //         child: Text(
                    //           "City",
                    //           style: TextStyle(
                    //               fontSize: FontSizes.FONT_SIZE_16,
                    //               color: Color(0xff878787)),
                    //         ),
                    //       );
                    //     }),
                    //     dropdownBuilder: (context, sort) {
                    //       return const Text(
                    //         "City",
                    //         style: TextStyle(
                    //             fontSize: FontSizes.FONT_SIZE_16,
                    //             color: Color(0xff878787)),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // CustomInput(
                    //   hintText: "Postal Code",
                    //   textInputType: TextInputType.phone,
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 16, right: 8),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: const Color(0xff95989A))),
                    //   child: DropdownSearch<String>(
                    //     asyncItems: (String filter) async {
                    //       // var res =
                    //       // searchAdsCubit.getJobCategories();
                    //       return ["ss"];
                    //     },
                    //     dropdownDecoratorProps: const DropDownDecoratorProps(
                    //         dropdownSearchDecoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintStyle: TextStyle(
                    //               fontSize: FontSizes.FONT_SIZE_16,
                    //               color: Color(0xff878787),
                    //             ),
                    //             hintText: "Country")),
                    //     dropdownButtonProps: const DropdownButtonProps(
                    //         icon: Icon(
                    //       Icons.keyboard_arrow_down,
                    //       color: Color(0xff696C6E),
                    //     )),
                    //     popupProps: PopupProps.menu(
                    //         itemBuilder: (context, String sort, bool) {
                    //       return const Padding(
                    //         padding: EdgeInsets.all(16.0),
                    //         child: Text(
                    //           "Country",
                    //           style: TextStyle(
                    //               fontSize: FontSizes.FONT_SIZE_16,
                    //               color: Color(0xff878787)),
                    //         ),
                    //       );
                    //     }),
                    //     dropdownBuilder: (context, sort) {
                    //       return const Text(
                    //         "Country",
                    //         style: TextStyle(
                    //             fontSize: FontSizes.FONT_SIZE_16,
                    //             color: Color(0xff878787)),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 16, right: 8),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: const Color(0xff95989A))),
                    //   child: DropdownSearch<String>(
                    //     asyncItems: (String filter) async {
                    //       // var res =
                    //       // searchAdsCubit.getJobCategories();
                    //       return ["ss"];
                    //     },
                    //     dropdownDecoratorProps: const DropDownDecoratorProps(
                    //         dropdownSearchDecoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintStyle: TextStyle(
                    //               fontSize: FontSizes.FONT_SIZE_16,
                    //               color: Color(0xff878787),
                    //             ),
                    //             hintText: "Region / State")),
                    //     dropdownButtonProps: const DropdownButtonProps(
                    //         icon: Icon(
                    //       Icons.keyboard_arrow_down,
                    //       color: Color(0xff696C6E),
                    //     )),
                    //     popupProps: PopupProps.menu(
                    //         itemBuilder: (context, String sort, bool) {
                    //       return const Padding(
                    //         padding: EdgeInsets.all(16.0),
                    //         child: Text(
                    //           "Region / State",
                    //           style: TextStyle(
                    //               fontSize: FontSizes.FONT_SIZE_16,
                    //               color: Color(0xff878787)),
                    //         ),
                    //       );
                    //     }),
                    //     dropdownBuilder: (context, sort) {
                    //       return const Text(
                    //         "Region / State",
                    //         style: TextStyle(
                    //             fontSize: FontSizes.FONT_SIZE_16,
                    //             color: Color(0xff878787)),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Checkbox(value: true, onChanged: (check) {}),
                    //     const SizedBox(
                    //       width: 8,
                    //     ),
                    //     const Expanded(
                    //       child: Text(
                    //         "My delivery and billing addresses are the same.",
                    //         style: TextStyle(
                    //             fontSize: FontSizes.FONT_SIZE_14,
                    //             color: Color(0xff747982)),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 24,
                    ),
                    BlocConsumer<AuthCubit, AuthStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return CustomButton(
                            text: AppLocalizations.of(context)!.sign_up,
                            isLoading: state is RegisterLoadingState,
                            action: () {
                              AuthCubit.get(context)
                                  .register(cartCubit: CartCubit.get(context));
                              // Navigator.push(
                              //     context,
                              //     PageTransition(
                              //         child: const QuickCheckoutMainScreen(),
                              //         type: PageTransitionType.leftToRight));
                            });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
