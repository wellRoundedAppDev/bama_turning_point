import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/login_screen.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/categories/presentation/screens/categories_screen.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/home/presentation/screens/home_screen.dart';
import 'package:classic_eccomerce/used/presentation/screens/used_section_main_screen.dart';
import 'package:classic_eccomerce/wish_list/presentation/screens/wish_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../account/presentation/screens/my_account_screen.dart';
import '../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../complain/presentation/screens/complain_screen.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../main.dart';
import '../../../wish_list/presentation/cubits/wish_list_cubit/cubit.dart';
import '../cubits/app_cubit/cubit.dart';
import '../cubits/app_cubit/states.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: BlocConsumer<AppCubit, CheckOutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          int navBarCurrentIndex = appCubit.currentNavbarIndex;

          return WillPopScope(
            onWillPop: () async {
              //MoveToBackground.moveTaskToBack();
              return true;
            },
            child: SafeArea(
                child: Scaffold(
                    bottomNavigationBar: Directionality(
                      textDirection: TextDirection.rtl,
                      child: CurvedNavigationBar(
                          height: 70,
                          color: AppColors.NAV_BAR_COLOR,
                          buttonBackgroundColor: AppColors.APP_MAIN_COLOR,
                          backgroundColor: Colors.transparent,
                          items: <Widget>[
                            (navBarCurrentIndex == 2)
                                ? Image.asset(
                                    IconPaths.COMPLAIN,
                                    width: 30,
                                    height: 30,
                                  )
                                : Image.asset(
                                    IconPaths.COMPLAIN,
                                    width: 30,
                                    height: 30,
                                  ),
                            // (navBarCurrentIndex == 1)
                            //     ? SvgPicture.asset(
                            //         IconPaths.USED,
                            //         width: 30,
                            //         height: 30,
                            //   color: Colors.white,
                            //       )
                            //     : SvgPicture.asset(
                            //         IconPaths.USED,
                            //         width: 30,
                            //         height: 30,
                            //   color: Colors.white,
                            //
                            //
                            // ),
                            BlocConsumer<CartCubit, CartStates>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                num itemsCount =
                                    CartCubit.get(context).numberOfItemsInCart;
                                return (navBarCurrentIndex == 1)
                                    ? Image.asset(
                                        IconPaths.CART,
                                        width: 30,
                                        height: 30,
                                      )
                                    : Stack(
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                          ),
                                          Center(
                                            child: Image.asset(
                                              IconPaths.CART,
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                          (itemsCount == 0)
                                              ? Container()
                                              : Positioned(
                                                  bottom: 16,
                                                  right: 40,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.yellow,
                                                            shape: BoxShape
                                                                .circle),
                                                    child: Center(
                                                      child: Text(
                                                        itemsCount.toString(),
                                                        style: const TextStyle(
                                                            fontSize: FontSizes
                                                                .FONT_SIZE_10,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                        ],
                                      );
                              },
                            ),
                            // (navBarCurrentIndex == 3)
                            //     ? Image.asset(
                            //         IconPaths.CATEGORIES_NAV_ICON,
                            //         width: 30,
                            //         height: 30,
                            //       )
                            //     : Image.asset(
                            //         IconPaths.CATEGORIES_NAV_ICON,
                            //         width: 30,
                            //         height: 30,
                            //       ),
                            // (navBarCurrentIndex == 4)
                            //     ? Image.asset(
                            //         IconPaths.FAV_ICON,
                            //         width: 30,
                            //         height: 30,
                            //       )
                            //     : Image.asset(
                            //         IconPaths.FAV_ICON,
                            //         width: 30,
                            //         height: 30,
                            //       ),
                            (navBarCurrentIndex == 2)
                                ? Image.asset(
                                    IconPaths.HOME_NAV_ICON,
                                    width: 30,
                                    height: 30,
                                  )
                                : Image.asset(
                                    IconPaths.HOME_NAV_ICON,
                                    width: 30,
                                    height: 30,
                                  ),
                          ],
                          index: appCubit.currentNavbarIndex,
                          onTap: (index) {
                            appCubit.changeNavBarIndex(index, context);
                          }),
                    ),
                    body: (navBarCurrentIndex == 2)
                        ? const HomeScreen()
                        // : (navBarCurrentIndex == 4)
                        //     ? const WishListScreen()
                        //     : (navBarCurrentIndex == 3)
                        //         ? CategoriesScreen(
                        //             showBackButton: false,
                        //           )
                        : (navBarCurrentIndex == 1)
                            ? CartScreen()
                            : BlocConsumer<AuthCubit, AuthStates>(
                                builder: (context, state) {
                                  bool? isUserLoggedIn = AuthCubit.get(context).isUserLoggedIn;
                                  return isUserLoggedIn == true
                                        ? const ComplainsScreen()
                                        : SignInScreen();
                                },
                                listener: (context, state) {},
                              ))),
          );
        },
      ),
    );
  }
}
