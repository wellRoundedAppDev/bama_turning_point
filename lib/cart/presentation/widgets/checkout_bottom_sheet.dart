import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/screens/quick_checkout_screen_auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';

class CheckOutBottomSheet extends StatefulWidget {
  const CheckOutBottomSheet({super.key});

  @override
  State<CheckOutBottomSheet> createState() => _CheckOutBottomSheetState();
}

class _CheckOutBottomSheetState extends State<CheckOutBottomSheet> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: const Color(0xff313846),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 16,
                bottom: 16,
              ),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      " : 1478",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_12,
                        color: Colors.white,
                      ),
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
                  Navigator.push(context, PageTransition(child: BlocProvider.value(
                      value: CartCubit.get(context)..initCheckOut(this),
                      child: const QuickCheckoutAuthScreen()), type: PageTransitionType.leftToRight));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
