import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/widgets/home_drawer.dart';
import 'package:classic_eccomerce/notifications/presentation/screens/notifications_screen.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../authentication/presentation/screens/login_screen.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../home_filter/presentaion/widget/filter_drawer.dart';
import '../../../main.dart';
import '../../../shared_components/app_no_products.dart';
import '../../data/models/get_wishlist_response.dart';
import '../widgets/wish_list_item.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = AuthCubit.get(context);
        bool isUserLoggedIn = authCubit.isUserLoggedIn;
        return (isUserLoggedIn == false)
            ? SignInScreen()
            : BlocProvider.value(
                value: WishListCubit.get(context)..init(CartCubit.get(context)),
                child: BlocConsumer<WishListCubit, WishListStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    WishListCubit wishListCubit = WishListCubit.get(context);
                    List<WishlistItem>? wishListItems =
                        wishListCubit.wishListItems??[];
                    return SafeArea(
                        child: Scaffold(
                      appBar: AppBar(
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
                            String firstName = MyApp
                                    .navKey.currentState?.context
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
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
                                            type:
                                                PageTransitionType.leftToRight,
                                            child:
                                                const NotificationsScreen()));
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
                      ),
                      body: (state is GetWishListLoadingState)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : (state is GetWishListNetworkConnectionFailedState)
                              ? Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: NoNetworkRefreshPage(refresh: () {
                                    wishListCubit.setWishListItems();
                                  }),
                                )
                              :wishListItems!.isNotEmpty &&  wishListItems!=null ?  RefreshIndicator(
                                  onRefresh: () async {
                                    await wishListCubit.setWishListItems();
                                  },
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(
                                        right: 16,
                                        left: 16,
                                        bottom: 16,
                                        top: 24),
                                    itemBuilder: (context, index) {
                                      WishlistItem? wishlistItem =
                                          wishListItems?[index];
                                      return WishListItemWidget(
                                          wishlistItem: wishlistItem);
                                    },
                                    itemCount: wishListItems?.length ?? 0,
                                  ),
                                ):AppNoProductsWidget(
                        title:
                        AppLocalizations.of(context)!.there_isnt_products,
                        subTitle: AppLocalizations.of(context)!
                            .add_products_to_favourite  ,
                      ),
                    ));
                  },
                ),
              );
      },
    );
  }
}
