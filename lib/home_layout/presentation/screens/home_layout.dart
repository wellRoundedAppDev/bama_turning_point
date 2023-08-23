import 'package:classic_eccomerce/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/paths/icon_paths.dart';
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
                  appBar: AppBar(
                      toolbarHeight: MediaQuery.of(context).size.height * 0.08,
                      flexibleSpace: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Row(
                          children: [],
                        ),
                      )),
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: const Color(0xffFEF5F5),
                    onTap: (int index) {
                      appCubit.changeNavBarIndex(index);
                    },
                    currentIndex: navBarCurrentIndex,
                    items: [
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            IconPaths.HOME,
                            color: (navBarCurrentIndex == 0)
                                ? AppColors.APP_MAIN_COLOR
                                : null,
                          ),
                          label: "الرئيسية"),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            IconPaths.CART,
                            color: (navBarCurrentIndex == 1)
                                ? AppColors.APP_MAIN_COLOR
                                : null,
                          ),
                          label: "السلة"),
                    ],
                  ),
                  body: (navBarCurrentIndex == 0)
                      ? const HomeScreen()
                      : const CartScreen()));
        },
      ),
    );
  }
}
