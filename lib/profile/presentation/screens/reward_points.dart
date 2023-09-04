import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/fonts/font_sizes.dart';

class RewardPointsScreen extends StatelessWidget {
  const RewardPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "MY ACCOUNT"),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Text(
                "YOUR REWARD POINTS",
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
              const SizedBox(height: 24,),
              const Center(
                child: Text("Your total number of reward points is: 3",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff313846), fontSize: FontSizes.FONT_SIZE_15,
                    fontWeight: FontWeight.bold
                ),),
              ),
              const SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffDDDDDD),
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
                            "Date Added",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "10 / 7 / 2022",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,color: Color(0xff947979)),
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
                            "Description",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "--",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,color: Color(0xff947979)),
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
                            "Points",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "3",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,color: Color(0xff947979)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
