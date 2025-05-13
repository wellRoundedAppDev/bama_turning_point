import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/models/get_categories_response.dart';
import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/states.dart';
import 'package:classic_eccomerce/categories/presentation/screens/products_in_category_screen.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import '../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../main.dart';
import '../../data/models/get_categories_paginated_response.dart';

class CategoriesScreen extends StatelessWidget {
  bool showBackButton;
   CategoriesScreen({Key? key,this.showBackButton = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..setCategories(),
      child: SafeArea(
          child: Scaffold(
            appBar: CustomAppBar.renderAppBar(
                title: "", cartCubit: CartCubit.get(context)),
        body: BlocConsumer<CategoriesCubit, CategoriesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
            List<Category2>? categories = categoriesCubit.categories;

           // ScrollController scrollController = categoriesCubit.categoriesScrollController;
            return (state is GetCategoriesLoadingState)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (state is GetCategoriesNetworkFailedState)
                    ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: NoNetworkRefreshPage(
                          refresh: () {
                            categoriesCubit.setCategories();
                          },
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          categoriesCubit.setCategories();
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                            //    controller: scrollController,
                                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent:
                                      MediaQuery.of(context).size.height * 0.2,
                                      mainAxisSpacing: 24,
                                      crossAxisSpacing: 16
                                ),
                                itemCount: categories?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  Category2? category = categories?[index];
                                  num? categoryId = category?.id;
                                  String? categoryName = category?.groupName;
                                  String? imageUrl = ApiUrls.BASE_URL + (category?.fileUrl??"");
                                  return InkWell(
                                    onTap: () {
                                      categoriesCubit
                                          .setAllProductsInCategory(category);
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: BlocProvider.value(
                                                value: categoriesCubit,
                                                child:
                                                    BlocProvider.value(
                                                        value: CartCubit.get(context),
                                                        child
                                                        : const ProductsInCategoryScreen()),
                                              ),
                                              type: PageTransitionType.leftToRight));
                                    },
                                    child:                           Container(
                              
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
                                                imageUrl ?? "",
                                                errorBuilder:
                                                    (context, object, stackTrace) {
                                                  return  Icon(
                                                    Icons.error,
                                                    size: MediaQuery.of(context).size.height * 0.08,
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
                              
                                  );
                                },
                              ),
                            ),

                            // (state is GetMoreCategoriesLoadingState)
                            //     ? Container(
                            //   padding: const EdgeInsets.all(16),
                            //   child: const Center(
                            //     child: CircularProgressIndicator(),
                            //   ),
                            // )
                            //     : (state
                            // is GetMoreCategoriesNetworkFailedState)
                            //     ? Padding(
                            //   padding: const EdgeInsets.all(16.0),
                            //   child: NoNetworkRefreshPage(
                            //     refresh: () {
                            //       categoriesCubit.addMoreCategories();
                            //     },
                            //   ),
                            // )
                            //     : Container()
                          ],
                        ),
                      );
          },
        ),
      )),
    );
  }
}
