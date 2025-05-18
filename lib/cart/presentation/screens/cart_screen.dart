import 'package:classic_eccomerce/cart/data/models/cart_item.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/widgets/checkout_bottom_sheet.dart';
import 'package:classic_eccomerce/cart/presentation/widgets/cart_item_widget.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../home/presentation/widgets/home_drawer.dart';
import '../../../main.dart';
import '../../../notifications/presentation/screens/notifications_screen.dart';

class CartScreen extends StatelessWidget {
  bool showBackButton;
  CartScreen({Key? key, this.showBackButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CartCubit.get(context),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CartCubit cartCubit = CartCubit.get(context);

          List<CartItem> cartItems = cartCubit.cartItems.entries
              .map((e) => CartItem(
                  productId: e.key,
                  quantity: e.value['quantity'],
                  name: e.value['name'],
                  price: e.value['price']?.toDouble(),
                  priceFormatted: e.value['priceFormatted'],
                  // option: e.value['option'],
                  cartId: e.value['cartId'],
                  imagePath: e.value['imagePath']))
              .toList();

          return SafeArea(
              child: Scaffold(
            drawer: const HomeDrawer(),
            appBar: showBackButton == false
                ? AppBar(
                    toolbarHeight: MediaQuery.of(context).size.height * 0.1,
                    leading: Container(),
                    flexibleSpace: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            AppColors.APP_BAR_COLOR_GRAD_ONE,
                            AppColors.APP_BAR_COLOR_GRAD_TWO
                          ],
                              stops: [
                            0.1,
                            0.9
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Builder(builder: (context) {
                        String firstName = MyApp.navKey.currentState?.context
                                .read<AuthCubit>()
                                .loginResponse
                                ?.loginData
                                ?.firstname ??
                            "";
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // GestureDetector(
                            //   onTap: () {
                            //     Scaffold.of(context).openDrawer();
                            //   },
                            //   child: SvgPicture.asset(
                            //     IconPaths.ACCOUNT_ICON,
                            //     width: 25,
                            //     height: 25,
                            //   ),
                            // ),
                            // const SizedBox(
                            //   width: 8,
                            // ),

                            Expanded(
                              child: Text(
                                firstName ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: FontSizes.FONT_SIZE_16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Center(
                                child: Image.asset(
                              ImagePaths.APP_LOGO,
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.22,
                            )),
                            // IconButton(
                            //   onPressed: () {
                            //     // ContactUsApi.contactUs();
                            //     // Navigator.push(
                            //     //     context,
                            //     //     MaterialPageRoute(
                            //     //         builder: (context) =>
                            //     //             const NotificationsScreen()));
                            //   },
                            //   icon: const Icon(
                            //     Icons.notifications,
                            //     color: Colors.white,
                            //     size: 30,
                            //   ),
                            // ),

                            // const SizedBox(width: 16,),

                            // const Expanded(
                            //   child: Text("1575\$"??"",
                            //     overflow: TextOverflow.ellipsis,
                            //     textAlign: TextAlign.end,
                            //     style: TextStyle(fontSize: FontSizes.FONT_SIZE_16,color: Colors.white,
                            //
                            //         fontWeight:FontWeight.bold
                            //     ),
                            //   ),
                            // ),
                            //
                            // const SizedBox(width: 16,),

                            Expanded(child: Container()),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.leftToRight,
                                        child: const NotificationsScreen()));
                              },
                              child: SvgPicture.asset(
                                IconPaths.NOTIFICATION_ICON,
                                width: 25,
                                height: 25,
                              ),
                            ),

                            // GestureDetector(
                            //     onTap: () {
                            //       Navigator.push(
                            //           context,
                            //           PageTransition(
                            //               child: BlocProvider.value(
                            //                   value: CartCubit.get(context),
                            //                   child: CartScreen(
                            //                     showBackButton: true,
                            //                   )),
                            //               type: PageTransitionType.leftToRight));
                            //     },
                            //     child: BlocConsumer<CartCubit, CartStates>(
                            //       listener: (context, state) {},
                            //       builder: (context, state) {
                            //         num itemsCount = CartCubit.get(context)
                            //             .numberOfItemsInCart;
                            //
                            //         return Stack(
                            //           children: [
                            //             Container(
                            //               color: Colors.transparent,
                            //               height: 30,
                            //               width: 30,
                            //             ),
                            //             Center(
                            //               child: Image.asset(
                            //                 IconPaths.CART,
                            //                 width: 25,
                            //                 height: 25,
                            //               ),
                            //             ),
                            //             (itemsCount == 0)
                            //                 ? Container()
                            //                 : Positioned(
                            //               bottom: 0,
                            //               right: 1,
                            //               child: Container(
                            //                 padding:
                            //                 const EdgeInsets.all(3),
                            //                 decoration: const BoxDecoration(
                            //                     color: Colors.yellow,
                            //                     shape: BoxShape.circle),
                            //                 child: Center(
                            //                   child: Text(
                            //                     itemsCount.toString(),
                            //                     style: const TextStyle(
                            //                         fontSize: FontSizes
                            //                             .FONT_SIZE_8,
                            //                         color: Colors.black),
                            //                   ),
                            //                 ),
                            //               ),
                            //             )
                            //           ],
                            //         );
                            //       },
                            //     )),
                          ],
                        );
                      }),
                    ),
                  )
                : CustomAppBar.renderAppBar(
                    title: 'Products Result',
                    showCartIcon: false,
                    showBackButton: showBackButton),
            bottomNavigationBar: (cartItems.isEmpty)
                ? Container(
                    height: 0,
                  )
                : const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CheckOutBottomSheet(),
                  ),
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
                        fit: StackFit.expand,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                                right: 16, left: 16, bottom: 16, top: 24),
                            itemBuilder: (context, index) {
                              CartItem? cartItem = cartItems[index];

                              return CartItemWidget(
                                cartItem: cartItem,
                              );
                              //}
                            },
                            itemCount: cartItems.length,
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
