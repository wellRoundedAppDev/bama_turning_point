import 'package:classic_eccomerce/cart/data/models/cart_item.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/cubit.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/states.dart';
import 'package:classic_eccomerce/product_details/presentation/screens/product_comparison_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';
import '../../data/models/get_product_details_response.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: const Color(0xff313846),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                BlocConsumer<ProductDetailsCubit, ProductDetailsStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        int productId =
                            ProductDetailsCubit.get(context).selectedProductId;
                        ProductDetailsCubit.get(context)
                            .addItemToWishlist(productId);
                      },
                      child: (state is AddItemToFavoritesLoadingState)
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Image.asset(
                              IconPaths.FAV_ICON,
                              width: 30,
                              height: 30,
                            ),
                    );
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const ProductComparisonScreen(),
                            type: PageTransitionType.leftToRight));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(
                      IconPaths.COMPARE_ICON_2,
                      width: 20,
                      height: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8, bottom: 8),
              child: CustomButton(
                text: "Buy Now",
                color: const Color(0xff2EAF23),
                height: MediaQuery.of(context).size.height,
                textFontSize: FontSizes.FONT_SIZE_14,
                action: () {},
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                right: 8,
                bottom: 8,
              ),
              child: BlocConsumer<CartCubit, CartStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  ProductDetailsCubit productDetailsCubit =
                      ProductDetailsCubit.get(context);
                  CartCubit cartCubit = CartCubit.get(context);
                  bool isProductInCart = cartCubit.cartItems.containsKey(
                      productDetailsCubit.selectedProductId.toString());

                  return (isProductInCart)
                      ? const Center(
                          child: Text(
                            "Added to cart",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : CustomButton(
                          text: "Add to cart",
                          height: MediaQuery.of(context).size.height,
                          textFontSize: FontSizes.FONT_SIZE_14,
                          action: () {
                            CartCubit cartCubit = CartCubit.get(context);
                            ProductDetails? selectedProductDetails =
                                ProductDetailsCubit.get(context)
                                    .selectedProductDetails;
                            cartCubit.addItemToCart(CartItem(
                                id: selectedProductDetails?.productId
                                        ?.toString() ??
                                    "",
                                name: selectedProductDetails?.name ?? "",
                                imagePath: selectedProductDetails?.originalImage
                                        .toString() ??
                                    "",
                                price:
                                    selectedProductDetails?.price?.toDouble() ??
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
