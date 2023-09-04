import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/fonts/font_sizes.dart';
import '../../../../shared_components/custom_app_bar.dart';
import '../../../../shared_components/custom_button.dart';
import '../../../../shared_components/custom_input.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "My ACCOUNT"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit ADDRESS",
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
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CustomInput(
                      hintText: "First Name",
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    CustomInput(
                      hintText: "Last Name",
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    CustomInput(
                      hintText: "Address 1",
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    CustomInput(
                      hintText: "Address 2",
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      height: 21,
                    ),
                    CustomInput(
                      hintText: "Post Code",
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      height: 21,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      height: 16,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Default Address",
                          style: TextStyle(
                              color: Color(0xff747982),
                              fontSize: FontSizes.FONT_SIZE_16),
                        ),
                        Expanded(
                          child: RadioListTile(
                            value: 1,
                            groupValue: 1,
                            onChanged: (check) {},
                            title: const Text(
                              "Yes",
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_16,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        Expanded(
                            child: RadioListTile(
                          value: 1,
                          groupValue: 1,
                          onChanged: (check) {},
                          title: const Text(
                            "No",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_16,
                                fontWeight: FontWeight.w300),
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      text: "Save",
                      action: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
