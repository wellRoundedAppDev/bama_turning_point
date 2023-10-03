import 'package:classic_eccomerce/cart/data/models/cart_item.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/wish_list/data/models/get_wishlist_response.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../shared_components/app_snackbar.dart';

class WishListItemWidget extends StatelessWidget {
  WishlistItem? wishlistItem;
  WishListItemWidget({Key? key, required this.wishlistItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListCubit, WishListStates>(
      listener: (context, state) {},
      builder: (context, state) {
        WishListCubit wishListCubit = WishListCubit.get(context);
        int? selectedProductId = wishListCubit.selectedProductId;
        return Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffDDDDDD), width: 1)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  wishlistItem?.thumb,
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
              Container(
                height: 700,
                color: const Color(0xffDDDDDD),
                width: 1,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff015963),
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
                        BlocConsumer<CartCubit,CartStates>(
                          listener: (context,state){},
                          builder: (context,state){
                            return GestureDetector(
                              onTap: () {
                                WishListCubit.get(context)
                                    .setSelectedProductId(int.tryParse(
                                    wishlistItem?.productId ?? "") ??
                                    0);

                                if (wishlistItem?.productId == null) {
                                  showAppSnackBar(content: "Error occured");
                                  return;
                                }

                                CartCubit.get(context).addItemToCart(CartItem(
                                    id: wishlistItem?.productId ?? "",
                                    name: wishlistItem?.name ?? "",
                                    price: double.tryParse(
                                        wishlistItem?.price ?? "") ??
                                        0));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                color: const Color(0xff36BFB1),
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
                                          wishlistItem?.productId ?? ""));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: const Color(0xffE7284D),
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
              )
            ],
          ),
        );
      },
    );
  }
}
