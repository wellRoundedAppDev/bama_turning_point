import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/categories/presentation/screens/categories_screen.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/home/presentation/screens/home_screen.dart';
import 'package:classic_eccomerce/wish_list/presentation/screens/wish_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_to_background/move_to_background.dart';
import '../../../account/presentation/screens/my_account_screen.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../core/constants/colors/colors.dart';
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
              MoveToBackground.moveTaskToBack();
              return false;
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
                            (navBarCurrentIndex == 0)
                                ? Image.asset(
                                    IconPaths.PROFILE,
                                    width: 30,
                                    height: 30,
                                  )
                                : Image.asset(
                                    IconPaths.PROFILE,
                                    width: 30,
                                    height: 30,
                                  ),
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
                                                  right: 16,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    decoration: const BoxDecoration(
                                                        color: AppColors
                                                            .APP_MAIN_COLOR,
                                                        shape: BoxShape.circle),
                                                    child: Center(
                                                      child: Text(
                                                        itemsCount.toString(),
                                                        style: const TextStyle(
                                                            fontSize: FontSizes
                                                                .FONT_SIZE_10,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                        ],
                                      );
                              },
                            ),
                            (navBarCurrentIndex == 2)
                                ? Image.asset(
                                    IconPaths.CATEGORIES_NAV_ICON,
                                    width: 30,
                                    height: 30,
                                  )
                                : Image.asset(
                                    IconPaths.CATEGORIES_NAV_ICON,
                                    width: 30,
                                    height: 30,
                                  ),
                            (navBarCurrentIndex == 3)
                                ? Image.asset(
                                    IconPaths.FAV_ICON,
                                    width: 30,
                                    height: 30,
                                  )
                                : Image.asset(
                                    IconPaths.FAV_ICON,
                                    width: 30,
                                    height: 30,
                                  ),
                            (navBarCurrentIndex == 4)
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
                            appCubit.changeNavBarIndex(index);
                          }),
                    ),
                    body: (navBarCurrentIndex == 4)
                        ? const HomeScreen()
                        : (navBarCurrentIndex == 3)
                            ? const WishListScreen()
                            : (navBarCurrentIndex == 2)
                                ? CategoriesScreen(
                                    showBackButton: false,
                                  )
                                : (navBarCurrentIndex == 1)
                                    ? CartScreen()
                                    : const MyAccountScreen())),
          );
        },
      ),
    );
  }
}
