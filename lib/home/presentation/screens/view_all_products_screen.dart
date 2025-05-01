import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/home/data/models/product.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../categories/data/models/get_products_in_category_response.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../product_details/presentation/screens/product_details_screen.dart';
import '../cubits/home_cubit/cubit.dart';
import '../cubits/home_cubit/states.dart';

class ViewAllProductsScreen extends StatelessWidget {
  String productTitle;
  bool isBrands;
  ViewAllProductsScreen(
      {Key? key, required this.productTitle, this.isBrands = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(
          title: productTitle, cartCubit: CartCubit.get(context)),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          List<Products>? products = homeCubit.allProducts;

          return (state is FetchingAllProductsLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is FetchingAllProductsNetworkConnectionFailedState)
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: NoNetworkRefreshPage(
                        refresh: () {
                          homeCubit.loadViewAllProductsScreen(productTitle,
                              isBrands: isBrands);

                          //  homeCubit.setCategories();
                        },
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        await homeCubit.loadViewAllProductsScreen(productTitle,
                            isBrands: isBrands);
                      },
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent:
                              MediaQuery.of(context).size.height * 0.43,
                        ),
                        itemCount: products?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          Products? product = products?[index];
                          int? productId = product?.id?.toInt();
                          String? productName = product?.productName;
                          String? productImageUrl = product?.minorUnitName;
                          String? priceFormatted = product?.grandUnitPrice.toString();

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: BlocProvider.value(
                                        value: CartCubit.get(context),
                                        child: ProductDetailsScreen(
                                          selectedProductId: productId ?? -1,
                                        ),
                                      ),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.GREY_BORDER_COLOR,
                                            width: 2),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        )),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            productImageUrl ?? "",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.18,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            errorBuilder:
                                                (context, object, stackTrace) {
                                              return const Icon(
                                                Icons.error,
                                                size: 150,
                                                color: AppColors.APP_MAIN_COLOR,
                                              );
                                            },
                                            fit: BoxFit.cover,
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
                                                            element.productId ==
                                                            productId
                                                                ?.toString()))
                                                    ?.isNotEmpty ==
                                                true;
                                            return Positioned(
                                                bottom: 4,
                                                right: 4,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white
                                                            .withOpacity(0.7)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
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
                                                    )));
                                          },
                                        )
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    productTitle ?? "-",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: AppColors.GREY_LABEL_COLOR,
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        weight:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        color: AppColors.STAR_COLOR,
                                      ),
                                      Icon(
                                        Icons.star,
                                        weight:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        color: AppColors.STAR_COLOR,
                                      ),
                                      Icon(
                                        Icons.star,
                                        weight:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        color: AppColors.STAR_COLOR,
                                      ),
                                      Icon(
                                        Icons.star,
                                        weight:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        color: AppColors.STAR_COLOR,
                                      ),
                                      Icon(
                                        Icons.star,
                                        weight:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        color: AppColors.STAR_COLOR,
                                      ),
                                    ],
                                  ),
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
                    );
        },
      ),
    ));
  }
}
