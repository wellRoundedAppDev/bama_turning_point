import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_families.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/home/presentation/widgets/categories_overview.dart';
import 'package:classic_eccomerce/home/presentation/widgets/products_overview.dart';
import 'package:classic_eccomerce/shared_components/search_app_bar_custom_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
            Image.asset(
              "assets/images/discount_banner.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 24,
                ),
                itemCount: 7,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return (index == 0)?const CategoriesOverview():
                   ProductsOverview(index: index,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
