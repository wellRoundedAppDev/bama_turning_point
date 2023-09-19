import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/models/get_categories_response.dart';
import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/states.dart';
import 'package:classic_eccomerce/categories/presentation/screens/products_in_category_screen.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../core/constants/colors/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..setCategories(),
      child: SafeArea(
          child: Scaffold(
        appBar: CustomAppBar.renderAppBar(
          title: "Categories",
          cartCubit: CartCubit.get(context)
        ),
        body: BlocConsumer<CategoriesCubit, CategoriesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
            List<Category>? categories = categoriesCubit.categories;
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
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent:
                                MediaQuery.of(context).size.height * 0.3,
                          ),
                          itemCount: categories?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            Category? category = categories?[index];
                            num? categoryId = category?.categoryId;
                            String? categoryName = category?.name;
                            String? imageUrl = category?.originalImage;
                            return InkWell(
                              onTap: () {
                                print(category?.categoryId);
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
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        imageUrl ?? "",
                                        errorBuilder:
                                            (context, object, stackTrace) {
                                          return const Icon(
                                            Icons.error,
                                            size: 150,
                                            color: AppColors.APP_MAIN_COLOR,
                                          );
                                        },
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      categoryName ?? "-",
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: FontSizes.FONT_SIZE_16,
                                          color: Color(0xff313846),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
          },
        ),
      )),
    );
  }
}
