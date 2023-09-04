import 'package:classic_eccomerce/profile/presentation/screens/address_book_entries/add_address_screen.dart';
import 'package:classic_eccomerce/profile/presentation/screens/address_book_entries/edit_address_screen.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/constants/fonts/font_sizes.dart';

class AddressBookEntriesScreen extends StatelessWidget {
  const AddressBookEntriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const AddAddressScreen(),
                  type: PageTransitionType.leftToRight));
        },
        child: Container(
          height: 60,
          color: const Color(0xffF2F1F1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
            child: Row(
              children: [
                const Text(
                  "ADD ADDRESS",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_16,
                      color: Color(0xff313846)),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: CustomAppBar.renderAppBar(title: "My ACCOUNT"),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ADDRESS BOOK ENTRIES",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: const Color(0xffB6BBC6),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            "Full Name : ",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "Ahmed Ibrahim",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: FontSizes.FONT_SIZE_14),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address : ",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "Iraq",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: FontSizes.FONT_SIZE_14),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            "Post Code : ",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "00000",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: FontSizes.FONT_SIZE_14),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            "City : ",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "Baghdad",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: FontSizes.FONT_SIZE_14),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            "Country : ",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "Baghdad",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: FontSizes.FONT_SIZE_14),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: 35,
                      child: CustomButton(
                        text: "Edit",
                        action: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const EditAddressScreen(),
                                  type: PageTransitionType.leftToRight));
                        },
                        color: const Color(0xff313846),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.22,
                    height: 35,
                    child: CustomButton(text: "Delete", action: () {}),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    ));
  }
}
