import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_components/custom_input.dart';

class EditAccountInformationScreen extends StatelessWidget {
  const EditAccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          CustomAppBar.renderAppBar(title: "My Account", showCartIcon: false),
      body: BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AccountCubit accountCubit = AccountCubit.get(context);
          return (state is GetAccountLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is GetAccountNetworkConnectionFailedState)
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: NoNetworkRefreshPage(refresh: () {
                        accountCubit.setAccountDetails();
                      }),
                    )
                  : SingleChildScrollView(
                      child: Form(
                        key: accountCubit.accountInformationFormKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Edit your account information",
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
                                hintText: "First Name",
                                controller:
                                    accountCubit.firstNameEditingController,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return "Enter first name";
                                  }
                                },
                                onSaved: (v) =>
                                    accountCubit.accountInput.firstName = v!,
                                textInputType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomInput(
                                hintText: "Last Name",
                                controller:
                                    accountCubit.lastNameEditingController,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return "Enter last name";
                                  }
                                },
                                onSaved: (v) =>
                                    accountCubit.accountInput.lastName = v!,
                                textInputType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomInput(
                                hintText: "E-mail",
                                controller: accountCubit.emailEditingController,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return "Enter email";
                                  } else if (EmailValidator.validate(v) ==
                                      false) {
                                    return "Enter a valid email";
                                  }
                                },
                                textInputType: TextInputType.emailAddress,
                                onSaved: (v) =>
                                    accountCubit.accountInput.email = v!,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomInput(
                                hintText: "Telephone",
                                controller: accountCubit.phoneEditingController,
                                textInputType: TextInputType.phone,
                                validator: (v) {
                                  if (v == null || v.length != 9) {
                                    return "Enter valid phone number";
                                  }
                                },
                                onSaved: (v) =>
                                    accountCubit.accountInput.phoneNumber = v!,
                              ),
                              // const SizedBox(
                              //   height: 16,
                              // ),
                              // Container(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 16),
                              //   decoration: BoxDecoration(
                              //       border: Border.all(
                              //           color: const Color(0xff95989A))),
                              //   child: DropdownSearch<String>(
                              //     asyncItems: (String filter) async {
                              //       // var res =
                              //       // searchAdsCubit.getJobCategories();
                              //       return ["ss"];
                              //     },
                              //     dropdownDecoratorProps:
                              //         const DropDownDecoratorProps(
                              //             dropdownSearchDecoration:
                              //                 InputDecoration(
                              //                     border: InputBorder.none,
                              //                     hintStyle: TextStyle(
                              //                       fontSize:
                              //                           FontSizes.FONT_SIZE_16,
                              //                       color: Color(0xff878787),
                              //                     ),
                              //                     hintText: "Gender")),
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
                              const SizedBox(
                                height: 16,
                              ),
                              CustomButton(
                                  isLoading: state is EditAccountLoadingState,
                                  text: "Save",
                                  action: () {
                                    accountCubit.editAccountDetails();
                                  })
                            ],
                          ),
                        ),
                      ),
                    );
        },
      ),
    ));
  }
}
