import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductComparisonScreen extends StatelessWidget {
  const ProductComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "PRODUCT COMPARISON"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xffDDDDDD), width: 1)),
                      child: Image.asset(
                        "assets/images/product_dummy.png",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff36BFB1),
                    ),
                    child: Image.asset(IconPaths.COMPARE_ICON_2),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xffDDDDDD), width: 1)),
                      child: Image.asset(
                        "assets/images/product_dummy.png",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Product Name 1",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontWeight: FontWeight.bold,
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_14,
                              color: Color(0XFF757A82)),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            "Product Name 2",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontWeight: FontWeight.bold,
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE5E5E5),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "\$7,450.00",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Price",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_14,
                              color: Color(0XFF757A82)),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            "\$7,450.00",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE5E5E5),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "6",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Modal",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_14,
                              color: Color(0XFF757A82)),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            "6",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE5E5E5),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "In stock",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff1D9F40),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Availability",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_14,
                              color: Color(0XFF757A82)),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            "Out of stock",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffE7284D),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE5E5E5),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "0.00kg",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_14,
                              color: Color(0XFF757A82)),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            "0.00kg",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE5E5E5),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "0.00cm x 0.00cm",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Dimensions",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_14,
                              color: Color(0XFF757A82)),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            "0.00cm x 0.00cm",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff313846),
                                fontSize: FontSizes.FONT_SIZE_14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE5E5E5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              color: const Color(0xff36BFB1),
                              child: Image.asset(
                                IconPaths.CART,
                                width: 18,
                                height: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              color: const Color(0xffE7284D),
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text(
                          "Action",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_14,
                              color: Color(0XFF757A82)),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              color: const Color(0xff36BFB1),
                              child: Image.asset(
                                IconPaths.CART,
                                width: 18,
                                height: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              color: const Color(0xffE7284D),
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
