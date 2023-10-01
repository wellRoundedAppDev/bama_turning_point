import 'package:classic_eccomerce/account/presentation/screens/change_password_screen.dart';
import 'package:classic_eccomerce/account/presentation/screens/register_for_affiliate_account_screen.dart';
import 'package:classic_eccomerce/account/presentation/screens/reward_points.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/login_screen.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import 'address_book_entries/address_book_entries_screen.dart';
import 'edit_account_info_screen.dart';
import 'order_history/order_history_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = AuthCubit.get(context);
        bool isUserLoggedIn = authCubit.isUserLoggedIn;
        return (isUserLoggedIn == false)? Scaffold(
          body: SignInScreen(),
        ):Scaffold(
          appBar: CustomAppBar.renderAppBar(
            cartCubit: CartCubit.get(context),
              title: "My Account", showBackButton: false),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "MY ACCOUNT",
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_20,
                            color: Color(0xff313846),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 40,
                        height: 3,
                        color: const Color(0xff015963),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child:
                                          const EditAccountInformationScreen(),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              color: const Color(0xffF5F5F5),
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(
                                    IconPaths.EDIT_ICON,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "Edit your account information",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          )
                        ],
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const AddressBookEntriesScreen(),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              color: const Color(0xffF5F5F5),
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(
                                    IconPaths.ADDRESS_BOOK_ICON,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "Modify your address book entries",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          )
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const ChangePasswordScreen(),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              color: const Color(0xffF5F5F5),
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(
                                    IconPaths.LOCK,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "Change your password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          )
                        ],
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const AddressBookEntriesScreen(),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              color: const Color(0xffF5F5F5),
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(
                                    IconPaths.HEART_PLUS,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "Modify your wish list",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          )
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "MY Orders",
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_20,
                            color: Color(0xff313846),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 40,
                        height: 3,
                        color: const Color(0xff015963),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const OrderHistoryScreen(),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              color: const Color(0xffF5F5F5),
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(
                                    IconPaths.ORDER_HISTORY_ICON,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "View your order history",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          )
                        ],
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const RewardPointsScreen(),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              color: const Color(0xffF5F5F5),
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(
                                    IconPaths.REWARD_POINTS_ICON,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "Your Reward Points",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff313846)),
                          )
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "MY AFFILIATE ACCOUNT",
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_20,
                            color: Color(0xff313846),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 40,
                        height: 3,
                        color: const Color(0xff015963),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child:
                                      const RegisterForAffiliateAccountScreen(),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          color: const Color(0xffF5F5F5),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                IconPaths.GROUPS_ICON,
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Register for an affiliate account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: Color(0xff313846)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
