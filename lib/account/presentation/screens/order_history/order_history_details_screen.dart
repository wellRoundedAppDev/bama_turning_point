import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/fonts/font_sizes.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "MY ACCOUNT"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "ORDER HISTORY",
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
                            "Order ID",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "#293",
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "Date Added",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "28/08/2022",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "Payment Method",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "Cash on delivery",
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "Shipping Method",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "Flat Shipping Rate",
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Payment Address ",
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
                            "Full Name",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "Ahmed Ibrahim",
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "Address",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "Iraq",
                              textAlign: TextAlign.right,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "City",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "--",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "Country",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "--",
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "Region",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "-",
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Shipping Address",
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
                            "Full Name",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "Ahmed Ibrahim",
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "Address",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "Iraq",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "City",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              "--",
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "Country",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "--",
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
                            "Region",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "--",
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: Color(0xff947979)),
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
