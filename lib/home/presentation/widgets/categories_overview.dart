import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/presentation/screens/categories_screen.dart';
import 'package:classic_eccomerce/categories/presentation/screens/products_in_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../categories/data/models/get_categories_response.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesOverview extends StatelessWidget {
  List<Category> categories;
  CategoriesOverview({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(),
      child: Builder(builder: (context) {
        CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                           AppLocalizations.of(context)!.groups,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: FontSizes.FONT_SIZE_18,
                              color: AppColors.GREY_LABEL_COLOR,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 40,
                          height: 3,
                          color: AppColors.APP_MAIN_COLOR,
                        )
                      ],
                    )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: BlocProvider.value(
                                    value: CartCubit.get(context),
                                    child: CategoriesScreen()),
                                type: PageTransitionType.leftToRight));
                      },
                      child:  Text(
                        AppLocalizations.of(context)!.view_all,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: AppColors.DARK_KOHLY_COLOR),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,

                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Category category = categories[index];
                      String? categoryName = category.name;
                      String? categoryImageUrl = category.originalImage;
                      return Row(
                        children: [
                          (index == 0)?const SizedBox(width: 16,):Container(),
                
                          GestureDetector(
                            onTap: () {
                              categoriesCubit.setAllProductsInCategory(category);
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: BlocProvider.value(
                                          value: categoriesCubit,
                                          child: BlocProvider.value(
                                              value: CartCubit.get(context),
                                              child:
                                                  const ProductsInCategoryScreen())),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  color: AppColors.SIMON_CONTAINER_COLOR,
                                  borderRadius: BorderRadius.all(Radius.circular(18))),
                              height: MediaQuery.of(context).size.height * 0.2,

                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    categoryName ?? "-",
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: AppColors.APP_ORANGE_LABEL_COLOR,
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSizes.FONT_SIZE_14),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        categoryImageUrl ?? "",
                                        errorBuilder:
                                            (context, object, stackTrace) {
                                          return const Icon(
                                            Icons.error,
                                            size: 55,
                                            color: AppColors.APP_MAIN_COLOR,
                                          );
                                        },
                                        width: MediaQuery.of(context).size.width * 0.17,
                                        height: MediaQuery.of(context).size.height * 0.08,
                                        fit: BoxFit.cover,
                                      )),

                                ],
                              ),
                            ),
                          ),
                          (index == categories.length - 1)?const SizedBox(width: 16,):Container(),
                
                        ],
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
      }),
    );
  }
}
