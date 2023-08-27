import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../products_in_category/presentation/screens/products_in_category_screen.dart';

class CategoriesOverview extends StatelessWidget {
  const CategoriesOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Shop By Category",
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_20,
                        color: Color(0xff313846),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 40,
                    height: 3,
                    color: const Color(0xff015963),
                  )
                ],
              )),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const ProductsInCategoryScreen(),
                          type: PageTransitionType.leftToRight));
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      color: Color(0xff8D929D)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/product_dummy.png",
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              )),
                          const Text(
                            "design departmeent",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.bold,
                                fontSize: FontSizes.FONT_SIZE_12),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: 6),
          ),
        ],
      ),
    );
  }
}
