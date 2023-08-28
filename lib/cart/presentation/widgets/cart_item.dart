import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffDDDDDD), width: 1)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/product_dummy.png",
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.2,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 700,
            color: const Color(0xffDDDDDD),
            width: 1,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Product Name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "\$59.52",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      color: Color(0xff015963),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 25,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffD0D0D0))),
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
                            height: MediaQuery.of(context).size.height,
                            width: 1,
                            color: const Color(0xffD0D0D0),
                          ),
                          const Flexible(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_12,
                                      color: Color(0xff313846),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height,
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
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      padding: const EdgeInsets.all(5.0),
                      color: const Color(0xff36BFB1),
                      child: Center(
                          child: Image.asset(
                        IconPaths.COMPARE_ICON,
                        color: Colors.white,
                      )),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      color: const Color(0xffE7284D),
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
