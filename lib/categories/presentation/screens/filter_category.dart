import 'package:classic_eccomerce/categories/presentation/widgets/filtered_product.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_families.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../shared_components/search_app_bar_custom_input.dart';

class FilterCategoryScreen extends StatelessWidget {
  const FilterCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          toolbarHeight: MediaQuery.of(context).size.height * 0.16,
          backgroundColor: AppColors.APP_BAR_COLOR,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu_sharp,
                      size: 25,
                      color: Colors.white,
                    ),
                    const Text(
                      "NORTH GRASS",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_18,
                          color: Colors.white,
                          fontFamily: FontFamilies.JOST_BOld),
                    ),
                    Image.asset(
                      IconPaths.CART,
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                    height: 45,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SearchAppBarCustomInput(
                          isFilled: true,
                          filledColor: const Color(0xff5A606B),
                          hintText: "TYPE HERE",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          hintTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: FontSizes.FONT_SIZE_14,
                              fontFamily: FontFamilies.OPEN_SANS),
                          suffixIcon: const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 30,
              color: AppColors.APP_BAR_COLOR,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "artificial trees",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff015963)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const FilteredProduct();
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
