import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/products_in_category/presentation/screens/products_in_category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 24,
        ),
        itemCount: 9,
        scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                        child: Text(
                      "ملابس",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: FontSizes.FONT_SIZE_18),
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, PageTransition(
                            child:
                            const ProductsInCategoryScreen(),
                            type: PageTransitionType.leftToRight));
                      },
                      child: const Row(
                        children: [
                          Text(
                            "المزيد",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: AppColors.APP_MAIN_COLOR),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.APP_MAIN_COLOR,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,

                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(
                              context)
                              .size
                              .width *
                              0.35,
                          child: ClipRRect(

                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              children: [
                                Positioned(
                                  top:0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Image.asset(
                                    "assets/images/shirt.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    height: 32,
                                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff4E4E4E)
                                          .withOpacity(0.26),
                                      backgroundBlendMode: BlendMode.srcOver,
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8)),
                                    ),
                                    child: const Text(
                                      "T-shirt",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: FontSizes.FONT_SIZE_12,
                                          color: Colors.white),
                                    ),
                                  ),
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
                )
              ],
            );
          },
      ),
    );
  }
}
