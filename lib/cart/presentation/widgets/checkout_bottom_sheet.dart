import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/check_out_cubit.dart';
import 'package:classic_eccomerce/checkout/presentation/screens/quick_checkout_auth_screen.dart';
import 'package:classic_eccomerce/checkout/presentation/screens/set_address_for_registered_users_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../checkout/presentation/screens/quick_checkout_main_screen.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';

class CheckOutBottomSheet extends StatelessWidget {
  const CheckOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: const Color(0xff313846),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 16,
                bottom: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: BlocConsumer<CartCubit, CartStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        CartCubit cartCubit = CartCubit.get(context);
                        return Text(
                          " : ${cartCubit.totalPrice.toStringAsFixed(2)}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: FontSizes.FONT_SIZE_12,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 8,
                top: 8,
                bottom: 8,
              ),
              child: CustomButton(
                text: "Checkout",
                height: MediaQuery.of(context).size.height,
                textFontSize: FontSizes.FONT_SIZE_14,
                action: () {
                  if (AuthCubit.get(context).isUserLoggedIn) {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: BlocProvider.value(
                                value: CartCubit.get(context),
                                child: BlocProvider(
                                    create: (context) =>
                                        CheckOutCubit(),
                                    child: const SetAddressForRegisteredUserScreen())),
                            type: PageTransitionType.leftToRight));
                    return;
                  }
                  Navigator.push(
                      context,
                      PageTransition(
                          child: BlocProvider.value(
                              value: CartCubit.get(context),
                              child: const QuickCheckoutAuthScreen()),
                          type: PageTransitionType.leftToRight));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
