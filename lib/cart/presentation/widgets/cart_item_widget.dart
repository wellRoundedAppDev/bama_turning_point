import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/product_details/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_settings/app_settings_cubit/app_settings_cubit.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../main.dart';
import '../../data/models/cart_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartItemWidget extends StatelessWidget {
  CartItem cartItem;
  CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                            selectedProductId:
                                int.tryParse(cartItem.productId) ?? 0)));
              },
              child: Image.network(
                cartItem.imagePath,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
                errorBuilder: (context, object, stackTrace) {
                  return Icon(
                    Icons.error,
                    size: MediaQuery.of(context).size.width * 0.25,
                    color: AppColors.APP_MAIN_COLOR,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  cartItem.price.toString().replaceAllMapped(
                          new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                          (Match m) => "${m[1]},") +
                      ((MyApp.navKey.currentState?.context
                      .read<AppSettingsCubit>()
                      .currencyCode ??
                      "") ==
                      "USD"
                      ?
                  AppLocalizations.of(context)!.dollar:
                  AppLocalizations.of(context)!.dinar),
                  // "\$${cartItem.price.toString()}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      color: AppColors.APP_MAIN_COLOR,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 25,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffD0D0D0))),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  CartCubit.get(context)
                                      .decreaseProductQuantity(
                                          cartItem.productId,
                                          cartItem.cartId ?? 0);
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: AppColors.DELETE_BUTTON_COLOR,
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: 1,
                            color: const Color(0xffD0D0D0),
                          ),
                          Flexible(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  cartItem.quantity.toString(),
                                  style: const TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_12,
                                      color: Color(0xff313846),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: 1,
                            color: const Color(0xffD0D0D0),
                          ),
                          Flexible(
                              flex: 1,
                              child: Center(
                                  child: InkWell(
                                onTap: () {
                                  CartCubit.get(context)
                                      .increaseProductQuantity(
                                          cartItem.productId,
                                          cartItem.cartId ?? 0);
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Color(0xff313846),
                                ),
                              ))),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   width: 16,
                    // ),
                    // Container(
                    //   width: 25,
                    //   height: 25,
                    //   padding: const EdgeInsets.all(5.0),
                    //   color: const Color(0xff36BFB1),
                    //   child: Center(
                    //       child: Image.asset(
                    //     IconPaths.COMPARE_ICON,
                    //     color: Colors.white,
                    //   )),
                    // ),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        CartCubit.get(context).deleteProductFromSalesCart(
                            cartItem.productId, cartItem.cartId ?? 0);
                      },
                      child: BlocConsumer<CartCubit, CartStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return (state is ItemDeletedFromCartLoadingState &&
                                  cartItem.productId ==
                                      CartCubit.get(context)
                                          .selectedCartProductId)
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator())
                              : Container(
                                  width: 25,
                                  height: 25,
                                  color: AppColors.APP_SECONDARY_COLOR,
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
