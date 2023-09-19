import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../checkout/presentation/screens/quick_checkout_main_screen.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_input.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(
                hintText: "Phone Number",
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
                          hintText: "Gender")),
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
                        "Gender",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            color: Color(0xff878787)),
                      ),
                    );
                  }),
                  dropdownBuilder: (context, sort) {
                    return const Text(
                      "Gender",
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
                hintText: "First Name",
              ),
              const SizedBox(
                height: 16,
              ),
              CustomInput(hintText: "Last Name"),
              const SizedBox(
                height: 16,
              ),
              CustomInput(
                hintText: "Password",
              ),
              const SizedBox(
                height: 16,
              ),
              CustomInput(
                hintText: "Confirm Password",
              ),
              const SizedBox(
                height: 24,
              ),
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
                height: 21,
              ),

              CustomButton(text: "Sign up", action: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const QuickCheckoutMainScreen(),
                        type: PageTransitionType.leftToRight));
              })
            ],
          ),
        ),
      ),
    ));
  }
}
