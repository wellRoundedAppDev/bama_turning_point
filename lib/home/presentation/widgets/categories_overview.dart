import 'package:classic_eccomerce/categories/presentation/screens/categories_screen.dart';
import 'package:classic_eccomerce/categories/presentation/screens/filter_category.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../categories/data/models/GetCategoriesResponse.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';

class CategoriesOverview extends StatelessWidget {
  List<Category> categories;
  CategoriesOverview({super.key, required this.categories});

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
                  const SizedBox(
                    height: 5,
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
                          child: const CategoriesScreen(),
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
                  Category category = categories[index];
                  String? categoryName = category.name;
                  String? categoryImageUrl = category.originalImage;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const FilterCategoryScreen(),
                              type: PageTransitionType.leftToRight));
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                categoryImageUrl ?? "",
                                errorBuilder: (context, object, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    size: 150,
                                    color: AppColors.APP_MAIN_COLOR,
                                  );
                                },
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            categoryName ?? "-",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.bold,
                                fontSize: FontSizes.FONT_SIZE_12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: categories.length),
          ),
        ],
      ),
    );
  }
}
