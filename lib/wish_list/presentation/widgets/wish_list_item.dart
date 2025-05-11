import 'package:classic_eccomerce/cart/data/models/cart_item.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/wish_list/data/models/get_wishlist_response.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../product_details/presentation/screens/product_details_screen.dart';

class WishListItemWidget extends StatelessWidget {
  WishlistItem? wishlistItem;
  WishListItemWidget({Key? key, required this.wishlistItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListCubit, WishListStates>(
      listener: (context, state) {},
      builder: (context, state) {
        print(wishlistItem?.thumb);
        WishListCubit wishListCubit = WishListCubit.get(context);
        int? selectedProductId = wishListCubit.selectedProductId;
        return Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffDDDDDD), width: 1)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Material(
                                  child: ProductDetailsScreen(
                                      selectedProductId: int.tryParse(
                                              wishlistItem?.productId ?? "") ??
                                          0),
                                )));
                  },
                  child: Image.network(
                    wishlistItem?.thumb??"",
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.2,
                    fit: BoxFit.cover,
                    errorBuilder: (context, object, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.error,
                          size: MediaQuery.of(context).size.width * 0.25,
                          color: AppColors.APP_MAIN_COLOR,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 700,
                color: const Color(0xffDDDDDD),
                width: 1,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wishlistItem?.name ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: Color(0xff333333),
                            fontWeight: FontWeight.bold),
                      ),
                      wishlistItem?.price == null
                          ? Container()
                          : const SizedBox(
                              height: 3,
                            ),
                      wishlistItem?.price == null
                          ? Container()
                          : Text(
                              wishlistItem?.price ?? "",
                              //  wishlistItem?.price ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  color: AppColors.APP_MAIN_COLOR,
                                  fontWeight: FontWeight.bold),
                            ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Stock : ",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_12,
                                color: Color(0xff313846)),
                          ),
                          Expanded(
                            child: Text(
                              wishlistItem?.stock ?? "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_12,
                                  color: Color(0xff2EAF23)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          BlocConsumer<CartCubit, CartStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return (state is ItemAddedToCartLoadingState &&
                                      int.tryParse(
                                              wishlistItem?.productId ?? "") ==
                                          wishListCubit.selectedProductId)
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(),
                                    )
                                  : (CartCubit.get(context).isItemInCart(
                                          wishlistItem?.productId ?? ""))
                                      ? Container()
                                      : GestureDetector(
                                          onTap: () {
                                            wishListCubit.setSelectedProductId(
                                                int.tryParse(
                                                    wishlistItem?.productId ??
                                                        ""));
                                            CartCubit.get(context).addItemToCart(
                                                CartItem(
                                                    productId:
                                                        wishlistItem?.productId ??
                                                            "",
                                                    name:
                                                        wishlistItem?.name ?? "",

                                                    imagePath:
                                                        wishlistItem?.thumb,
                                                    price: double.tryParse(
                                                            wishlistItem?.price
                                                                    ?.replaceAll(
                                                                        "\$",
                                                                        "") ??
                                                                "") ??
                                                        0));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            color: AppColors.APP_MAIN_COLOR,
                                            child: Image.asset(
                                              IconPaths.CART,
                                              width: 18,
                                              height: 18,
                                            ),
                                          ),
                                        );
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          (state is DeleteItemFromWishListLoadingState &&
                                  selectedProductId ==
                                      int.tryParse(wishlistItem?.productId ?? ""))
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator())
                              : GestureDetector(
                                  onTap: () {
                                    WishListCubit.get(context)
                                        .deleteItemFromWishList(int.tryParse(
                                            wishlistItem?.productId ?? ""),wishlistItem?.sourceId);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    color: AppColors.GREY_LABEL_COLOR_1,
                                    child: const Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
