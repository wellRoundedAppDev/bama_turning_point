import 'package:classic_eccomerce/categories/presentation/screens/categories_screen.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/home/presentation/screens/home_screen.dart';
import 'package:classic_eccomerce/wish_list/presentation/screens/wish_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../account/presentation/screens/my_account_screen.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../core/constants/colors/colors.dart';
import '../cubits/app_cubit/cubit.dart';
import '../cubits/app_cubit/states.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          int navBarCurrentIndex = appCubit.currentNavbarIndex;

          return SafeArea(
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
                          (navBarCurrentIndex == 1)
                              ? Image.asset(
                                  IconPaths.CART,
                                  width: 30,
                                  height: 30,
                                )
                              : Image.asset(
                                  IconPaths.CART,
                                  width: 30,
                                  height: 30,
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
                              ? const CategoriesScreen()
                              : (navBarCurrentIndex == 1)
                                  ? const CartScreen()
                                  :  const MyAccountScreen()));
        },
      ),
    );
  }
}
