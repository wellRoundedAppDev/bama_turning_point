import 'package:classic_eccomerce/cart/data/models/cart_item.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/screens/cart_screen.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';
import '../../data/models/get_product_details_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: AppColors.APP_PURPLE,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                BlocConsumer<WishListCubit, WishListStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    int productId =
                        ProductDetailsCubit.get(context).selectedProductId;

                    bool isProductInWishList = WishListCubit.get(context)
                            .wishListItems
                            ?.where((element) =>
                                element.productId == productId.toString())
                            .isNotEmpty ==
                        true;

                    return GestureDetector(
                      onTap: () {
                        if (isProductInWishList == false) {
                          WishListCubit.get(context)
                              .addItemToWishlist(productId);
                        } else {
                          WishListCubit.get(context)
                              .deleteItemFromWishList(productId);
                        }
                      },
                      child: (state is AddItemToFavoritesLoadingState ||
                              state is DeleteItemFromWishListLoadingState)
                          ? const SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : (isProductInWishList == true)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                )
                              : Image.asset(
                                  IconPaths.FAV_ICON,
                                  width: 30,
                                  height: 30,
                                ),
                    );
                  },
                ),
                // const SizedBox(
                //   width: 20,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         PageTransition(
                //             child: const ProductComparisonScreen(),
                //             type: PageTransitionType.leftToRight));
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.all(5),
                //     decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Colors.white,
                //           width: 2,
                //         ),
                //         borderRadius: BorderRadius.circular(100)),
                //     child: Image.asset(
                //       IconPaths.COMPARE_ICON_2,
                //       width: 20,
                //       height: 20,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8, bottom: 8),
              child: BlocConsumer<CartCubit, CartStates>(
                listener: (context, child) {},
                builder: (context, child) {
                  return CustomButton(
                    text: AppLocalizations.of(context)!.buy_now,
                    color: const Color(0xff2EAF23),
                    height: MediaQuery.of(context).size.height,
                    textFontSize: FontSizes.FONT_SIZE_14,
                    action: () async {
                      ProductDetailsCubit productDetailsCubit =
                          ProductDetailsCubit.get(context);
                      ProductDetails? selectedProductDetails =
                          ProductDetailsCubit.get(context)
                              .selectedProductDetails;
                      CartCubit cartCubit = CartCubit.get(context);
                      bool isProductInCart = cartCubit.cartItems.containsKey(
                          productDetailsCubit.selectedProductId.toString());

                      if (isProductInCart == false) {
                        var success = await cartCubit.addItemToCart(CartItem(
                            productId:
                                selectedProductDetails?.productId?.toString() ??
                                    "",
                            option: productDetailsCubit.selectedOption,
                            name: selectedProductDetails?.name ?? "",
                            imagePath: selectedProductDetails?.originalImage
                                    .toString() ??
                                "",
                            price: selectedProductDetails?.price?.toDouble() ??
                                -1));

                        if (success == true) {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: BlocProvider.value(
                                      value: cartCubit,
                                      child: CartScreen(
                                        showBackButton: true,
                                      )),
                                  type: PageTransitionType.leftToRight));
                        }

                        return;
                      }
                      Navigator.push(
                          context,
                          PageTransition(
                              child: BlocProvider.value(
                                  value: cartCubit,
                                  child: CartScreen(
                                    showBackButton: true,
                                  )),
                              type: PageTransitionType.leftToRight));
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, right: 8, bottom: 8, left: 8),
              child: BlocConsumer<CartCubit, CartStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  ProductDetailsCubit productDetailsCubit =
                      ProductDetailsCubit.get(context);
                  CartCubit cartCubit = CartCubit.get(context);
                  bool isProductInCart = cartCubit.cartItems.containsKey(
                      productDetailsCubit.selectedProductId.toString());

                  return (isProductInCart)
                      ? Center(
                          child: Text(
                            AppLocalizations.of(context)!.added_to_cart,
                            style: const TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : (state is ItemAddedToCartLoadingState)
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : CustomButton(
                              text: AppLocalizations.of(context)!.add_to_cart,
                              height: MediaQuery.of(context).size.height,
                              textFontSize: FontSizes.FONT_SIZE_14,
                              action: () {
                                CartCubit cartCubit = CartCubit.get(context);
                                ProductDetails? selectedProductDetails =
                                    ProductDetailsCubit.get(context)
                                        .selectedProductDetails;

                                cartCubit.addItemToCart(CartItem(
                                    productId: selectedProductDetails?.productId
                                            ?.toString() ??
                                        "",
                                    option: productDetailsCubit.selectedOption,
                                    name: selectedProductDetails?.name ?? "",
                                    imagePath: selectedProductDetails
                                            ?.originalImage
                                            .toString() ??
                                        "",
                                    price: selectedProductDetails?.price
                                            ?.toDouble() ??
                                        -1));
                              },
                            );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
