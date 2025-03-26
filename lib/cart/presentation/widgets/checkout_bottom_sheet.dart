import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/check_out_cubit.dart';
import 'package:classic_eccomerce/checkout/presentation/screens/quick_checkout_auth_screen.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../checkout/presentation/screens/set_address_for_registered_user_screen.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckOutBottomSheet extends StatelessWidget {
  const CheckOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: AppColors.APP_SECONDARY_COLOR,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.total,
                    style: const TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: BlocConsumer<CartCubit, CartStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        AppSettingsCubit appSettingsCubit =
                            AppSettingsCubit.get(context);
                        CartCubit cartCubit = CartCubit.get(context);
                        String currencySymbol =
                            AppLocalizations.of(context)!.dinar;
                        return Text(
                          ": ${cartCubit.totalPrice.toStringAsFixed(2).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}$currencySymbol",
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
              padding:
                  const EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 8),
              child: CustomButton(
                text: AppLocalizations.of(context)!.checkout,
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
                                    create: (context) => CheckOutCubit()
                                      ..setRegisteredUserPaymentAddresses(),
                                    child:
                                        const SetBillingAddressForRegisteredUserScreen())),
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
