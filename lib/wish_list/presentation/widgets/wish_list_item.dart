import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.start,
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
                const Text(
                  "\$59.52",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      color: Color(0xff015963),
                      fontWeight: FontWeight.bold),
                ),
                const Row(
                  children: [
                    Text(
                      "Stock : ",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_12,
                          color: Color(0xff313846)),
                    ),
                    Expanded(
                      child: Text(
                        "In Stock",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_12,
                            color: Color(0xff2EAF23)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
