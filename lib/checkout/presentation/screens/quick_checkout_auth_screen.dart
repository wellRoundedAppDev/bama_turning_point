import 'package:classic_eccomerce/authentication/presentation/screens/guest_screen.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/login_screen.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/sign_up_screen.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../authentication/presentation/screens/sign_up_new_screen.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_app_bar.dart';
import '../cubits/check_out_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuickCheckoutAuthScreen extends StatefulWidget {
  const QuickCheckoutAuthScreen({super.key});

  @override
  State<QuickCheckoutAuthScreen> createState() =>
      _QuickCheckoutAuthScreenState();
}

class _QuickCheckoutAuthScreenState extends State<QuickCheckoutAuthScreen>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutCubit()..initCheckOutAuthScreen(this),
      child: Builder(builder: (context) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar.renderAppBar(
              title: "Quick Checkout", showCartIcon: false),
          body: Column(
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xff605050)))),
                child: TabBar(
                    indicatorWeight: 4,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                    controller: CheckOutCubit.get(context).tabController,
                    labelStyle: const TextStyle(
                        color: AppColors.APP_MAIN_COLOR,
                        fontSize: FontSizes.FONT_SIZE_16),
                    dividerColor: Colors.grey,
                    labelColor: AppColors.APP_MAIN_COLOR,
                    unselectedLabelColor: const Color(0xff313846),
                    tabs:  [
                      Tab(
                        child: Text(
                          AppLocalizations.of(context)!.guest,
                          style: const TextStyle(fontSize: FontSizes.FONT_SIZE_16),
                        ),
                      ),
                      Tab(
                          child: Text(
                        AppLocalizations.of(context)!.login,
                        style: const TextStyle(fontSize: FontSizes.FONT_SIZE_16),
                      )),
                      Tab(
                          child: Text(
                            AppLocalizations.of(context)!.sign_up,
                        style: const TextStyle(fontSize: FontSizes.FONT_SIZE_16),
                      )),

                    ]),
              ),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: CheckOutCubit.get(context).tabController,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: GuestScreen(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SignInScreen(
                          isCheckingOut: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SignUpScreen(
                          showBackButton: false,
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      }),
    );
  }
}
