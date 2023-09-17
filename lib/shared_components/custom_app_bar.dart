import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/screens/cart_screen.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../core/constants/paths/icon_paths.dart';

class CustomAppBar {
  static renderAppBar(
      {required String title,
      bool showBackButton = true,
      bool showCartIcon = true,
      CartCubit? cartCubit}) {
    return AppBar(
      toolbarHeight: 65,
      backgroundColor: const Color(0xff101216),
      leading: Container(),
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
              child: Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizes.FONT_SIZE_20,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            (showCartIcon)
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(MyApp.navKey.currentState!.context,
                      PageTransition(child:  BlocProvider.value(

                          value: cartCubit!,
                          child: const CartScreen()), type: PageTransitionType.leftToRight)
                      );
                    },
                    child: Image.asset(
                      IconPaths.CART,
                      width: 25,
                      height: 25,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
