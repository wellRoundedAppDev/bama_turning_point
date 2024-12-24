import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/screens/cart_screen.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../account/presentation/cubits/account_cubit/cubit.dart';
import '../account/presentation/cubits/account_cubit/states.dart';
import '../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../core/constants/colors/colors.dart';
import '../core/constants/paths/icon_paths.dart';
import '../core/constants/paths/image_paths.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

BuildContext context = MyApp.navKey.currentState!.context;

class CustomAppBar {
  static renderAppBar(
      {required String title,
      bool showBackButton = true,
      bool showCartIcon = true,
      bool showLogoutIcon = false,
      CartCubit? cartCubit}) {
    return AppBar(
      toolbarHeight: 65,
      leading: Container(),
      flexibleSpace: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.APP_BAR_COLOR_GRAD_ONE,
          AppColors.APP_BAR_COLOR_GRAD_TWO
        ], stops: [
          0.05,
          0.95
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (showLogoutIcon)
                ? GestureDetector(
                    onTap: () {
                      AuthCubit authCubit = AuthCubit.get(context);

                      showDialog(
                          context: context,
                          builder: (context) {
                            return BlocProvider.value(
                                value: authCubit,
                                child: AlertDialog(
                                  title: Text(AppLocalizations.of(context)!
                                      .are_you_sure_you_want_to_logout),
                                  actions: [
                                    BlocConsumer<AuthCubit, AuthStates>(
                                      listener: (context, state) {},
                                      builder: (context, state) {
                                        return CustomButton(
                                            isLoading:
                                                state is LogoutLoadingState,
                                            text: AppLocalizations.of(context)!
                                                .yes,
                                            action: () {
                                              authCubit.logOut(cartCubit);
                                              Navigator.pop(context);
                                            });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    CustomButton(
                                        text: AppLocalizations.of(context)!.no,
                                        action: () {
                                          Navigator.pop(context);
                                        })
                                  ],
                                ));
                          });
                    },
                    child: Image.asset(
                      IconPaths.LOGOUT_ICON,
                      width: 25,
                      height: 25,
                    ),
                  )
                : Container(),
            (showBackButton)
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(MyApp.navKey.currentState!.context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ))
                : Container(),
            Expanded(
              child: Image.asset(
                ImagePaths.APP_LOGO_2,
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            (showCartIcon)
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                          MyApp.navKey.currentState!.context,
                          PageTransition(
                              child: BlocProvider.value(
                                  value: cartCubit!,
                                  child: CartScreen(
                                    showBackButton: true,
                                  )),
                              type: PageTransitionType.leftToRight));
                    },
                    child: BlocConsumer<CartCubit, CartStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        num itemsCount =
                            CartCubit.get(context).numberOfItemsInCart;

                        return Stack(
                          children: [
                            Container(
                              color: Colors.transparent,
                              height: 30,
                              width: 30,
                            ),
                            Center(
                              child: Image.asset(
                                IconPaths.CART,
                                width: 25,
                                height: 25,
                              ),
                            ),
                            (itemsCount == 0)
                                ? Container()
                                : Positioned(
                                    bottom: 0,
                                    right: 1,
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          itemsCount.toString(),
                                          style: const TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_8,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
