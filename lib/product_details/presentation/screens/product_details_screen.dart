import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/home/presentation/widgets/products_overview.dart';
import 'package:classic_eccomerce/product_details/presentation/widgets/comment.dart';
import 'package:classic_eccomerce/product_details/presentation/widgets/product_details_bottom_sheet.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomSheet: const ProductDetailsBottomSheet(),
            appBar: CustomAppBar.renderAppBar(title: "Product Name"),
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                "assets/images/product_dummy.png",
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 16,
                                right: MediaQuery.of(context).size.width * 0.42,
                                left: MediaQuery.of(context).size.width * 0.42,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff191616)
                                        .withOpacity(0.6),
                                  ),
                                  child: const Center(
                                      child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      '1/3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: FontSizes.FONT_SIZE_12),
                                    ),
                                  )),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Artificial Trees",
                                  style: TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff333333)),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "\$59.7",
                                  style: TextStyle(
                                      color: Color(0xff015963),
                                      fontSize: FontSizes.FONT_SIZE_18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Ex Tax: \$7,450.00",
                                      style: TextStyle(
                                          fontSize: FontSizes.FONT_SIZE_14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff999999)),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.star_border_outlined,
                                          color: Colors.black,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            thickness: 2,
                            color: Color(0xffE5E5E5),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Stock :  ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff313846)),
                                    ),
                                    Text(
                                      "In Stock",
                                      style:
                                          TextStyle(color: Color(0xff1D9F40)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Size : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontSizes.FONT_SIZE_14,
                                          color: Color(0xfff313846)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffD0D0D0),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 5),
                                        child: Text(
                                          "xs",
                                          style: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff313846)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffD0D0D0),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 5),
                                        child: Text(
                                          "sm",
                                          style: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff313846)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffD0D0D0),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 5),
                                        child: Text(
                                          "lg",
                                          style: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff313846)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffD0D0D0),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 5),
                                        child: Text(
                                          "lg",
                                          style: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff313846)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffD0D0D0),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 5),
                                        child: Text(
                                          "lg",
                                          style: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff313846)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "QTY",
                                      style: TextStyle(
                                          fontSize: FontSizes.FONT_SIZE_16,
                                          color: Color(0xff313846),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffD0D0D0))),
                                      child: Row(
                                        children: [
                                          const Flexible(
                                              flex: 1,
                                              child: Icon(
                                                Icons.remove,
                                                color: Color(0xff313846),
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: 1,
                                            color: const Color(0xffD0D0D0),
                                          ),
                                          const Flexible(
                                              flex: 2,
                                              child: Center(
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(
                                                      fontSize: FontSizes
                                                          .FONT_SIZE_12,
                                                      color: Color(0xff313846),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )),
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: 1,
                                            color: const Color(0xffD0D0D0),
                                          ),
                                          const Flexible(
                                              flex: 1,
                                              child: Center(
                                                  child: Icon(
                                                Icons.add,
                                                color: Color(0xff313846),
                                              ))),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            thickness: 2,
                            color: Color(0xffE5E5E5),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_16,
                                      color: Color(0xff313846),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tincidunt, sapien nec tempus condimentum, lectus justo pretium nisl, id fringilla tortor massa vitae mi",
                                  style: TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_14,
                                      color: Color(0xff71757E)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            thickness: 2,
                            color: Color(0xffE5E5E5),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              color: const Color(0xffF5F5F5),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                        color: Color(0xff313846),
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSizes.FONT_SIZE_16),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffFFAB16),
                                      ),
                                      Icon(Icons.star,
                                          color: Color(0xffFFAB16)),
                                      Icon(Icons.star,
                                          color: Color(0xffFFAB16)),
                                      Icon(Icons.star,
                                          color: Color(0xffFFAB16)),
                                      Icon(Icons.star, color: Color(0xffFFAB16))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Column(
                                    children: [
                                      Divider(
                                        thickness: 1,
                                        color: Color(0xffE5E5E5),
                                      ),
                                    ],
                                  ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: Comment(),
                                );
                              }),
                          const Divider(
                            thickness: 2,
                            color: Color(0xffE5E5E5),
                          ),
                        ],
                      ),
                    ),
                    ProductsOverview(products: [], productListTitle: '',)
                  ],
                ),
              ),
            )));
  }
}
