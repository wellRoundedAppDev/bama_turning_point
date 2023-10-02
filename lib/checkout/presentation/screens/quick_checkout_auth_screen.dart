import 'package:classic_eccomerce/authentication/presentation/screens/guest_screen.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/login_screen.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/sign_up_screen.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_app_bar.dart';
import '../cubits/check_out_cubit.dart';

class QuickCheckoutAuthScreen extends StatefulWidget {
  const QuickCheckoutAuthScreen({super.key});

  @override
  State<QuickCheckoutAuthScreen> createState() => _QuickCheckoutAuthScreenState();
}

class _QuickCheckoutAuthScreenState extends State<QuickCheckoutAuthScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  CheckOutCubit()..initCheckOutAuthScreen(this),
      child: Builder(
        builder: (context) {
          return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
            appBar: CustomAppBar.renderAppBar(title: "Quick Checkout",showCartIcon: false),
            body: Column(
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Color(0xff605050)))),
                  child: TabBar(
                      indicatorWeight: 4,
                      indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                      controller: CheckOutCubit.get(context).tabController,
                      labelStyle: const TextStyle(
                          color: Color(0xff36BFB1), fontSize: FontSizes.FONT_SIZE_16),
                      dividerColor: Colors.grey,
                      labelColor: const Color(0xff36BFB1),
                      unselectedLabelColor: const Color(0xff313846),
                      tabs: const [
                        Tab(
                            child: Text(
                          "SIGN IN",
                          style: TextStyle(fontSize: FontSizes.FONT_SIZE_16),
                        )),
                        Tab(
                            child: Text(
                          "SIGN UP",
                          style: TextStyle(fontSize: FontSizes.FONT_SIZE_16),
                        )),
                        Tab(
                          child: Text(
                            "GUEST",
                            style: TextStyle(fontSize: FontSizes.FONT_SIZE_16),
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: CheckOutCubit.get(context).tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SignInScreen(),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SignUpScreen(),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: GuestScreen(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
        }
      ),
    );
  }
}
