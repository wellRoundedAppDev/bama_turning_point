import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/cubit.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/home/data/models/product.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import '../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../main.dart';
import '../../../product_details/presentation/screens/product_details_screen.dart';
import '../../data/models/get_categories_paginated_response.dart';
import '../../data/models/get_categories_response.dart';
import '../../data/models/get_products_in_category_response.dart';
import '../cubits/categories_cubit/states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsInCategoryScreen extends StatelessWidget {
  const ProductsInCategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<CategoriesCubit, CategoriesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
        List<ProductInCategory>? products = categoriesCubit.products;
        Category2? selectedCategory = categoriesCubit.selectedCategory;
        String? selectedCategoryName = selectedCategory?.groupName;
         return Scaffold(
             appBar: CustomAppBar.renderAppBar(
                 title: "", cartCubit: CartCubit.get(context)),

             body: (state is GetProductsInCategoryLoadingState)
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : (state is GetProductsInCategoryFailedNetworkConnectionState)
                ? Padding(
              padding: const EdgeInsets.all(16),
              child: NoNetworkRefreshPage(
                refresh: () {
                  categoriesCubit
                      .setAllProductsInCategory(selectedCategory);

                  //  homeCubit.setCategories();
                },
              ),
            )
                : RefreshIndicator(
              onRefresh: () async {
                await categoriesCubit
                    .setAllProductsInCategory(selectedCategory);
              },
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8,),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent:
                  MediaQuery.of(context).size.height * 0.35,
                ),
                itemCount: products?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  ProductInCategory? product = products?[index];
                  int? productId = product?.id;
                  String? productName = product?.productName;
                  String? productImageUrl =

                      product?.files == null || product?.files?.isEmpty == true? null:
                  ApiUrls.BASE_URL +
                      (product?.files?.first?.fileUrl??"");
                  String? priceFormatted = "${product?.minorUnitPrice?.toString() ??""} ${AppLocalizations.of(context)!.iraqi_dinar_initials}";

                  int? productType = product?.source;
                  // String? productImageUrl = product?.grandUnitName;
                  // String? priceFormatted =
                  //     product?.middleUnitPrice.toString();

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: BlocProvider.value(
                                value: CartCubit.get(context),
                                child: ProductDetailsScreen(
                                  selectedProductId:
                                  productId ?? -1,

                                ),
                              ),
                              type:
                              PageTransitionType.leftToRight));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                    AppColors.GREY_BORDER_COLOR,
                                    width: 2),
                                borderRadius:
                                const BorderRadius.all(
                                  Radius.circular(12),
                                )),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      productImageUrl ?? "",
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.18,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width,
                                      errorBuilder: (context, object,
                                          stackTrace) {
                                        return  Icon(
                                          Icons.error,
                                          size: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.18,
                                          color: AppColors
                                              .APP_MAIN_COLOR,
                                        );
                                      },
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                BlocConsumer<WishListCubit,
                                    WishListStates>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    bool isItemInWishList = (WishListCubit
                                        .get(context)
                                        .wishListItems
                                        ?.where((element) =>
                                    element
                                        .productId ==
                                        productId
                                            ?.toString()))
                                        ?.isNotEmpty ==
                                        true;
                                    return Positioned(
                                        bottom: 4,
                                        right: 4,
                                        child: GestureDetector(
                                          onTap: (){
                                            if (isItemInWishList) {
                                              WishListCubit.get(context)
                                                  .deleteItemFromWishList(
                                                  productId ?? 0,
                                                  productType ?? 0);
                                            } else {
                                              WishListCubit.get(context)
                                                  .addItemToWishlist(
                                                  productId ?? 0,
                                                  productType ?? 0);
                                            }
                                          },
                                          child: Container(
                                              decoration:
                                              BoxDecoration(
                                                  shape: BoxShape
                                                      .circle,
                                                  color: Colors
                                                      .white
                                                      .withOpacity(
                                                      0.7)),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(2.0),
                                                child:
                                                (isItemInWishList ==
                                                    true)
                                                    ? const Icon(
                                                  Icons
                                                      .favorite,
                                                  color: Colors
                                                      .red,
                                                )
                                                    : const Icon(
                                                  Icons
                                                      .favorite_border_rounded,
                                                  color: Colors
                                                      .black,
                                                ),
                                              )),
                                        ));
                                  },
                                )
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            productName ?? "-",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: AppColors.GREY_LABEL_COLOR,
                                fontSize: FontSizes.FONT_SIZE_16,
                                fontWeight: FontWeight.bold),
                          ),
                          // const SizedBox(
                          //   height: 8,
                          // ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.star,
                          //       weight: MediaQuery.of(context)
                          //           .size
                          //           .width *
                          //           0.01,
                          //       color: AppColors.STAR_COLOR,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       weight: MediaQuery.of(context)
                          //           .size
                          //           .width *
                          //           0.01,
                          //       color: AppColors.STAR_COLOR,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       weight: MediaQuery.of(context)
                          //           .size
                          //           .width *
                          //           0.01,
                          //       color: AppColors.STAR_COLOR,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       weight: MediaQuery.of(context)
                          //           .size
                          //           .width *
                          //           0.01,
                          //       color: AppColors.STAR_COLOR,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       weight: MediaQuery.of(context)
                          //           .size
                          //           .width *
                          //           0.01,
                          //       color: AppColors.STAR_COLOR,
                          //     ),
                          //   ],
                          // ),
                          Text(
                            priceFormatted ?? "-",

                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: AppColors.APP_PRICE_COLOR,
                                fontWeight: FontWeight.bold,
                                fontSize: FontSizes.FONT_SIZE_16),
                          )
                          // Row(
                          //   children: [
                          //     Flexible(
                          //         child: Text(
                          //           priceFormatted ?? "",
                          //           //"\$${productPrice.toString() ?? "-"}",
                          //           maxLines: 1,
                          //           overflow: TextOverflow.ellipsis,
                          //           style: const TextStyle(
                          //               color: AppColors.APP_MAIN_COLOR,
                          //               fontWeight: FontWeight.bold),
                          //         )),
                          //     // const SizedBox(
                          //     //   width: 8,
                          //     // ),
                          //     // Flexible(
                          //     //     flex: 2,
                          //     //     child: Text(
                          //     //       "\$17.96",
                          //     //       textAlign: TextAlign.left,
                          //     //       overflow: TextOverflow.ellipsis,
                          //     //       maxLines: 1,
                          //     //       style: TextStyle(
                          //     //         decoration: TextDecoration.lineThrough,
                          //     //         color: const Color(0xff333333)
                          //     //             .withOpacity(0.5),
                          //     //       ),
                          //     //     )),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ));
      },
        ),
    );
  }
}
