import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:classic_eccomerce/product_details/presentation/screens/product_details_screen.dart';
import 'package:classic_eccomerce/wish_list/data/models/get_wishlist_response.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../data/models/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsOverview extends StatelessWidget {
  var products;
  String productListTitle;

  ProductsOverview(
      {super.key, required this.products, required this.productListTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
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
                      productListTitle,
                      maxLines: 1,
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
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
                      color: AppColors.APP_MAIN_COLOR,
                    )
                  ],
                )),
                InkWell(
                  onTap: () {
                    HomeCubit homeCubit = HomeCubit.get(context);
                    homeCubit.navigateToViewAllProductsScreen(
                        productListTitle, CartCubit.get(context));
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         child: const ProductsInCategoryScreen(),
                    //         type: PageTransitionType.leftToRight));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.view_all,
                    style: const TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Color(0xff8D929D)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Product product = products[index];
                  int? productId = product.productId?.toInt();
                  String? productTitle = product.name;
                  num? productPrice = product.price;
                  String? priceFormatted = product.priceFormatted;
                  String? productImagePath = (product.productImagePath ?? "");
                  String stockStatus = product.stockStatus ?? "";

                  print("Stock status $stockStatus");
                  return Row(
                    children: [
                      (index == 0)
                          ? const SizedBox(
                              width: 16,
                            )
                          : Container(),
                       InkWell(
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            productImagePath ?? "",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
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
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      productTitle ?? "-",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: FontSizes.FONT_SIZE_14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                            child: Text(
                                          priceFormatted ?? "",
                                          //"\$${productPrice.toString() ?? "-"}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: AppColors.APP_MAIN_COLOR,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        // const SizedBox(
                                        //   width: 8,
                                        // ),
                                        // Flexible(
                                        //     flex: 2,
                                        //     child: Text(
                                        //       "\$17.96",
                                        //       textAlign: TextAlign.left,
                                        //       overflow: TextOverflow.ellipsis,
                                        //       maxLines: 1,
                                        //       style: TextStyle(
                                        //         decoration: TextDecoration.lineThrough,
                                        //         color: const Color(0xff333333)
                                        //             .withOpacity(0.5),
                                        //       ),
                                        //     )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                      (index == products.length - 1)
                          ? const SizedBox(
                              width: 16,
                            )
                          : Container(),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: products.length),
          ),
        ],
      ),
    );
  }
}
