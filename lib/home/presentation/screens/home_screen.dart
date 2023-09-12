import 'package:classic_eccomerce/categories/data/models/GetCategoriesResponse.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_families.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/states.dart';
import 'package:classic_eccomerce/home/presentation/widgets/banners_slider.dart';
import 'package:classic_eccomerce/home/presentation/widgets/categories_overview.dart';
import 'package:classic_eccomerce/home/presentation/widgets/products_overview.dart';
import 'package:classic_eccomerce/shared_components/search_app_bar_custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/get_slide_shows_response.dart';
import '../widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..init(),
        child: SafeArea(
          child: Scaffold(
            drawer: const HomeDrawer(),
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.16,
              backgroundColor: AppColors.APP_BAR_COLOR,
              leading: Container(),
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(16),
                child: Builder(builder: (context) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
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
                }),
              ),
            ),
            body: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                HomeCubit homeCubit = HomeCubit.get(context);
                List<BannerAd>? bannerAds = homeCubit.banners;
                List<Category>? categories = homeCubit.categoriesOverview;

                var featuredProducts = homeCubit.featuredProductsOverview;
                var newArrivals = homeCubit.newArrivalsProductsOverview;
                var bestSellers = homeCubit.bestSellersProductsOverview;

                return (state is FetchingHomeScreenLoadingState)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                         await homeCubit.init();
                        },
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: BannersSlider(
                                  bannerAds: bannerAds ?? [],
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 24,
                                ),
                                itemCount: 4,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  String productListTitle = (index == 1)
                                      ? "Featured Products"
                                      : (index == 2)
                                          ? "New Arrivals"
                                          : "Bestsellers";

                                  var products = (index == 1)
                                      ? featuredProducts
                                      : (index == 2)
                                          ? newArrivals
                                          : bestSellers;

                                  return (index == 0)
                                      ? CategoriesOverview(
                                          categories: categories ?? [],
                                        )
                                      : Container(
                                          color: Colors.white,
                                          child: ProductsOverview(
                                              products: products ?? [],
                                              productListTitle:
                                                  productListTitle));
                                },
                              ),
                            ])),
                      );
              },
            ),
          ),
        ));
  }
}
