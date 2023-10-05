import 'package:classic_eccomerce/checkout/presentation/cubits/check_out_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../authentication/presentation/auth_cubit/states.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../shared_components/custom_button.dart';
import '../../../shared_components/custom_input.dart';

class SetAddressForRegisteredUserScreen extends StatelessWidget {
  const SetAddressForRegisteredUserScreen({
    super.key,
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
            key: CheckOutCubit.get(context).addressForRegisteredUserFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipOval(
                      child: Image.asset(
                    ImagePaths.APP_LOGO,
                    width: 200,
                    height: 200,
                  )),
                ),
                // const SizedBox(
                //   height: 16,
                // ),
                // CustomInput(
                //   hintText: "First Name",
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Enter your first name';
                //     }
                //   },
                //  // onSaved: (v) =>
                //      // AuthCubit.get(context).registerFormInput.firstName = v,
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // CustomInput(
                //   hintText: "Last Name",
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Enter your last name';
                //     }
                //   },
                // //  onSaved: (v) =>
                //   //    AuthCubit.get(context).registerFormInput.lastName = v,
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                const Text(
                  "Billing Address",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff313846)),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Address 1",
                  textInputType: TextInputType.streetAddress,
                  validator: (value) {
                    if (value == null || value.length < 4) {
                      return 'Enter an address of at least 4 characters';
                    }
                  },
                  // onSaved: (v) =>
                  // CheckOutCubit.get(context).guestFormInput.address = v,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff95989A))),
                  child: DropdownSearch<String>(
                    asyncItems: (String filter) async {
                      // var res =
                      // searchAdsCubit.getJobCategories();
                      return ["ss"];
                    },
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff878787),
                            ),
                            hintText: "City")),
                    dropdownButtonProps: const DropdownButtonProps(
                        icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff696C6E),
                    )),
                    popupProps: PopupProps.menu(
                        itemBuilder: (context, String sort, bool) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "City",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff878787)),
                        ),
                      );
                    }),
                    dropdownBuilder: (context, sort) {
                      return const Text(
                        "City",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            color: Color(0xff878787)),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Postal Code",
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff95989A))),
                  child: DropdownSearch<String>(
                    asyncItems: (String filter) async {
                      // var res =
                      // searchAdsCubit.getJobCategories();
                      return ["ss"];
                    },
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff878787),
                            ),
                            hintText: "Country")),
                    dropdownButtonProps: const DropdownButtonProps(
                        icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff696C6E),
                    )),
                    popupProps: PopupProps.menu(
                        itemBuilder: (context, String sort, bool) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Country",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff878787)),
                        ),
                      );
                    }),
                    dropdownBuilder: (context, sort) {
                      return const Text(
                        "Country",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            color: Color(0xff878787)),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff95989A))),
                  child: DropdownSearch<String>(
                    asyncItems: (String filter) async {
                      // var res =
                      // searchAdsCubit.getJobCategories();
                      return ["ss"];
                    },
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff878787),
                            ),
                            hintText: "Region / State")),
                    dropdownButtonProps: const DropdownButtonProps(
                        icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff696C6E),
                    )),
                    popupProps: PopupProps.menu(
                        itemBuilder: (context, String sort, bool) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Region / State",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff878787)),
                        ),
                      );
                    }),
                    dropdownBuilder: (context, sort) {
                      return const Text(
                        "Region / State",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            color: Color(0xff878787)),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(value: true, onChanged: (check) {}),
                    const SizedBox(
                      width: 8,
                    ),
                    const Expanded(
                      child: Text(
                        "My delivery and billing addresses are the same.",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: Color(0xff747982)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return CustomButton(
                        text: "Confirm",
                        isLoading: state is RegisterLoadingState,
                        action: () {
                          AuthCubit.get(context).register();
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
