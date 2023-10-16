import 'package:classic_eccomerce/cart/data/models/cart_item.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/widgets/checkout_bottom_sheet.dart';
import 'package:classic_eccomerce/cart/presentation/widgets/cart_item_widget.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/custom_input.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/fonts/font_sizes.dart';

class CartScreen extends StatelessWidget {
  bool showBackButton;
  CartScreen({Key? key, this.showBackButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CartCubit.get(context)..loadCartItems(),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CartCubit cartCubit = CartCubit.get(context);
          List<CartItem> cartItems = cartCubit.cartItems.entries
              .map((e) => CartItem(
                  productId: e.key,
                  quantity: e.value['quantity'],
                  name: e.value['name'],
                  price: e.value['price'],
                  cartId: e.value['cartId'],
                  imagePath: e.value['imagePath']))
              .toList();
          return SafeArea(
              child: Scaffold(
            appBar: CustomAppBar.renderAppBar(
                title: "Shopping Cart",
                showBackButton: showBackButton,
                showCartIcon: false),
            body: (state is LoadCartLoadingState)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (state is LoadCartNetworkConnectionFailedState)
                    ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: NoNetworkRefreshPage(refresh: () {
                          cartCubit.loadCartItems();
                        }),
                      )
                    : Stack(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                                right: 16, left: 16, bottom: 16, top: 24),
                            itemBuilder: (context, index) {
                              CartItem? cartItem;
                              if (index < cartItems.length) {
                                cartItem = cartItems[index];
                              }
                              if ((index == cartItems.length)) {
                                return cartItems.isEmpty
                                    ? Container()
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 5,
                                                  color:
                                                      const Color(0xffB6BBC6),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  ExpansionTile(
                                                      trailing: Container(
                                                        width: 0,
                                                      ),
                                                      title: Row(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xff313846)),
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: const Icon(
                                                              Icons.add,
                                                              color: Color(
                                                                  0xff313846),
                                                              size: 16,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          const Text(
                                                            "Use Coupon Code",
                                                            style: TextStyle(
                                                                fontSize: FontSizes
                                                                    .FONT_SIZE_14,
                                                                color: Color(
                                                                    0xff313846)),
                                                          ),
                                                        ],
                                                      ),
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          color: const Color(
                                                              0xffF7F9FF),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 1,
                                                                color: const Color(
                                                                    0xffB6BBC6),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        16.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      "Enter your coupon here",
                                                                      style: TextStyle(
                                                                          fontSize: FontSizes
                                                                              .FONT_SIZE_16,
                                                                          color:
                                                                              Color(0xff878787)),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 8,
                                                                    ),
                                                                    CustomInput(
                                                                      hintText:
                                                                          "Enter your coupon here",
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          16,
                                                                    ),
                                                                    CustomButton(
                                                                        text:
                                                                            "Apply Coupon",
                                                                        action:
                                                                            () {})
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ]),
                                                  Container(
                                                    height: 1,
                                                    color:
                                                        const Color(0xffB6BBC6),
                                                  ),
                                                  ExpansionTile(
                                                      trailing: Container(
                                                        width: 0,
                                                      ),
                                                      title: Row(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xff313846)),
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: const Icon(
                                                              Icons.add,
                                                              color: Color(
                                                                  0xff313846),
                                                              size: 16,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          const Text(
                                                            "Estimate Shipping & Taxes",
                                                            style: TextStyle(
                                                                fontSize: FontSizes
                                                                    .FONT_SIZE_14,
                                                                color: Color(
                                                                    0xff313846)),
                                                          ),
                                                        ],
                                                      ),
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          color: const Color(
                                                              0xffF7F9FF),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 1,
                                                                color: const Color(
                                                                    0xffB6BBC6),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        16.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              16,
                                                                          right:
                                                                              8),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                              border: Border.all(color: const Color(0xff95989A))),
                                                                      child: DropdownSearch<
                                                                          String>(
                                                                        asyncItems:
                                                                            (String
                                                                                filter) async {
                                                                          // var res =
                                                                          // searchAdsCubit.getJobCategories();
                                                                          return [
                                                                            "ss"
                                                                          ];
                                                                        },
                                                                        dropdownDecoratorProps: const DropDownDecoratorProps(
                                                                            dropdownSearchDecoration: InputDecoration(
                                                                                border: InputBorder.none,
                                                                                hintStyle: TextStyle(
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontSize: FontSizes.FONT_SIZE_16,
                                                                                  color: Color(0xff878787),
                                                                                ),
                                                                                hintText: "Country")),
                                                                        dropdownButtonProps:
                                                                            const DropdownButtonProps(
                                                                                icon: Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down,
                                                                          color:
                                                                              Color(0xff858585),
                                                                        )),
                                                                        popupProps: PopupProps.menu(itemBuilder: (context,
                                                                            String
                                                                                sort,
                                                                            bool) {
                                                                          return const Padding(
                                                                            padding:
                                                                                EdgeInsets.all(16.0),
                                                                            child:
                                                                                Text(
                                                                              "Country",
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.w300,
                                                                                fontSize: FontSizes.FONT_SIZE_16,
                                                                                color: Color(0xff878787),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                                        dropdownBuilder:
                                                                            (context,
                                                                                sort) {
                                                                          return const Text(
                                                                            "Country",
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w300,
                                                                              fontSize: FontSizes.FONT_SIZE_16,
                                                                              color: Color(0xff878787),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          16,
                                                                    ),
                                                                    Container(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              16,
                                                                          right:
                                                                              8),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                              border: Border.all(color: const Color(0xff95989A))),
                                                                      child: DropdownSearch<
                                                                          String>(
                                                                        asyncItems:
                                                                            (String
                                                                                filter) async {
                                                                          // var res =
                                                                          // searchAdsCubit.getJobCategories();
                                                                          return [
                                                                            "ss"
                                                                          ];
                                                                        },
                                                                        dropdownDecoratorProps: const DropDownDecoratorProps(
                                                                            dropdownSearchDecoration: InputDecoration(
                                                                                border: InputBorder.none,
                                                                                hintStyle: TextStyle(
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontSize: FontSizes.FONT_SIZE_16,
                                                                                  color: Color(0xff878787),
                                                                                ),
                                                                                hintText: "Region / State")),
                                                                        dropdownButtonProps:
                                                                            const DropdownButtonProps(
                                                                                icon: Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down,
                                                                          color:
                                                                              Color(0xff858585),
                                                                        )),
                                                                        popupProps: PopupProps.menu(itemBuilder: (context,
                                                                            String
                                                                                sort,
                                                                            bool) {
                                                                          return const Padding(
                                                                            padding:
                                                                                EdgeInsets.all(16.0),
                                                                            child:
                                                                                Text(
                                                                              "Region / State",
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.w300,
                                                                                fontSize: FontSizes.FONT_SIZE_16,
                                                                                color: Color(0xff878787),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                                        dropdownBuilder:
                                                                            (context,
                                                                                sort) {
                                                                          return const Text(
                                                                            "Region / State",
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w300,
                                                                              fontSize: FontSizes.FONT_SIZE_16,
                                                                              color: Color(0xff878787),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          16,
                                                                    ),
                                                                    CustomInput(
                                                                        hintText:
                                                                            "Post Code"),
                                                                    const SizedBox(
                                                                      height:
                                                                          16,
                                                                    ),
                                                                    CustomButton(
                                                                        text:
                                                                            "Get Quotes",
                                                                        action:
                                                                            () {})
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ]),
                                                  Container(
                                                    height: 1,
                                                    color:
                                                        const Color(0xffB6BBC6),
                                                  ),
                                                  ExpansionTile(
                                                      trailing: Container(
                                                        width: 0,
                                                      ),
                                                      title: Row(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xff313846)),
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: const Icon(
                                                              Icons.add,
                                                              color: Color(
                                                                  0xff313846),
                                                              size: 16,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          const Text(
                                                            "Use Gift Certificate",
                                                            style: TextStyle(
                                                                fontSize: FontSizes
                                                                    .FONT_SIZE_14,
                                                                color: Color(
                                                                    0xff313846)),
                                                          ),
                                                        ],
                                                      ),
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          color: const Color(
                                                              0xffF7F9FF),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 1,
                                                                color: const Color(
                                                                    0xffB6BBC6),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        16.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      "Enter your gift certificate code here",
                                                                      style: TextStyle(
                                                                          fontSize: FontSizes
                                                                              .FONT_SIZE_16,
                                                                          color:
                                                                              Color(0xff878787)),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 8,
                                                                    ),
                                                                    CustomInput(
                                                                      hintText:
                                                                          "Enter your gift certificate code here",
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          16,
                                                                    ),
                                                                    CustomButton(
                                                                        text:
                                                                            "Apply gift certificate",
                                                                        action:
                                                                            () {})
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ]),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            const CheckOutBottomSheet(),
                                          ],
                                        ));
                              }
                              else {
                                return CartItemWidget(
                                  cartItem: cartItem!,
                                );
                              }
                            },
                            itemCount: cartItems.length + 1,
                          ),
                          (state is UpdateCartItemQuantityLoadingState)
                              ? const Positioned(
                                  top: 0,
                                  left: 0,
                                  bottom: 0,
                                  right: 0,
                                  child: Center(
                                    child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: CircularProgressIndicator()),
                                  ),
                                )
                              : Container()
                        ],
                      ),
          ));
        },
      ),
    );
  }
}
