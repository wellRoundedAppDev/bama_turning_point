import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/fonts/font_sizes.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "My Account"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "MY ACCOUNT",
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_20,
                        color: Color(0xff313846),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 40,
                    height: 3,
                    color: const Color(0xff015963),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        color: const Color(0xffF5F5F5),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              IconPaths.EDIT_ICON,
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Edit your account information",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: Color(0xff313846)),
                      )
                    ],
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: const Color(0xffF5F5F5),
                    child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              IconPaths.ADDRESS_BOOK_ICON,
                              width: 32,
                              height: 32,
                            ),
                          ),
                    ),
                  ),
                          const Text(
                            "Modify your address book entries",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 24,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "MY Orders",
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_20,
                        color: Color(0xff313846),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 40,
                    height: 3,
                    color: const Color(0xff015963),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            color: const Color(0xffF5F5F5),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  IconPaths.ORDER_HISTORY_ICON,
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "View your order history",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            color: const Color(0xffF5F5F5),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  IconPaths.REWARD_POINTS_ICON,
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "Your Reward Points",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          )
                        ],
                      )
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "MY AFFILIATE ACCOUNT",
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_20,
                        color: Color(0xff313846),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 40,
                    height: 3,
                    color: const Color(0xff015963),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: const Color(0xffF5F5F5),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          IconPaths.GROUPS_ICON,
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Register for an affiliate account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Color(0xff313846)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
