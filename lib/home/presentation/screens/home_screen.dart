import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_families.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/home/data/models/get_banners_response.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/widgets/categories_overview.dart';
import 'package:classic_eccomerce/home/presentation/widgets/products_overview.dart';
import 'package:classic_eccomerce/shared_components/search_app_bar_custom_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: SafeArea(
        child: Scaffold(
          drawer: const HomeDrawer(),
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.16,
            backgroundColor: AppColors.APP_BAR_COLOR,
            leading: Container(),
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(16),
              child: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Scaffold.of(context).openDrawer();
                            },
                            child: const Icon(
                              Icons.menu_sharp,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "NORTH GRASS",
                            style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_18,
                                color: Colors.white,
                                fontFamily: FontFamilies.JOST_BOld),
                          ),
                          Image.asset(
                            IconPaths.CART,
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                          height: 45,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SearchAppBarCustomInput(
                                isFilled: true,
                                filledColor: const Color(0xff5A606B),
                                hintText: "TYPE HERE",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.left,
                                hintTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSizes.FONT_SIZE_14,
                                    fontFamily: FontFamilies.OPEN_SANS),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                    ],
                  );
                }
              ),
            ),
          ),
          body: BlocConsumer(
            listener: (context,state){},
            builder: (context,state){
              HomeCubit homeCubit = HomeCubit.get(context);
              List<BannerAd>? bannerAds = homeCubit.banners;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.cover,
                  children: [
                    Image.network(
                      bannerAds?[0]..
                      ],
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 24,
                      ),
                      itemCount: 7,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return (index == 0)
                            ? const CategoriesOverview()
                            : Container(
                            color: Colors.white,
                            child: ProductsOverview(
                              index: index,
                            ));
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
