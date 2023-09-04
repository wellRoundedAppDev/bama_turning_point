import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared_components/custom_input.dart';

class EditAccountInformationScreen extends StatelessWidget {
  const EditAccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: CustomAppBar.renderAppBar(title: "My Account"),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
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
              const SizedBox(height: 16,),
              CustomInput(hintText: "First Name",),
              const SizedBox(height: 16,),
              CustomInput(hintText: "Last Name",),
              const SizedBox(height: 16,),
              CustomInput(hintText: "E-mail"),
              const SizedBox(height: 16,),
              CustomInput(hintText: "Telephone",),
              const SizedBox(height: 16,),
              Container(
               padding:   const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff95989A))
                ),
                child: DropdownSearch<String>(
                  asyncItems: (String filter) async {
                    // var res =
                    // searchAdsCubit.getJobCategories();
                    return ["ss"];
                  },
                  dropdownDecoratorProps:
                  const DropDownDecoratorProps(
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
                            style: TextStyle(fontSize: FontSizes.FONT_SIZE_16,color: Color(0xff878787)),
                          ),
                        );
                      }),
                  dropdownBuilder: (context, sort) {
                    return  const Text(
                      "Gender",
                      style: TextStyle(fontSize: FontSizes.FONT_SIZE_16,color: Color(0xff878787)),
                    );
                  },),
              ),
              const SizedBox(height: 16,),
              CustomButton(text: "Save", action: (){})
            ],
          ),
        ),
      ),
    ));
  }
}
