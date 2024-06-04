import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/models/get_categories_response.dart';
import 'package:classic_eccomerce/contact_us/data/data_sources/remote_data_sources/contact_us_api.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_families.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/states.dart';
import 'package:classic_eccomerce/home/presentation/cubits/search_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/screens/search_and_filter_screen.dart';
import 'package:classic_eccomerce/home/presentation/widgets/brands_overview.dart';
import 'package:classic_eccomerce/home/presentation/widgets/categories_overview.dart';
import 'package:classic_eccomerce/home/presentation/widgets/products_overview.dart';
import 'package:classic_eccomerce/notifications/presentation/screens/notifications_screen.dart';
import 'package:classic_eccomerce/shared_components/search_app_bar_custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../cart/presentation/cubits/cart_cubit/states.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../widgets/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              toolbarHeight: MediaQuery.of(context).size.height * 0.17,
              leading: Container(),
              flexibleSpace: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  AppColors.APP_BAR_COLOR_GRAD_ONE,
                  AppColors.APP_BAR_COLOR_GRAD_TWO
                ], stops: [
                  0.1,
                  0.9
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                          Expanded(child: Container()),
                          Center(
                              child: Image.asset(
                            ImagePaths.APP_LOGO_2,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.05,
                          )),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {
                             // ContactUsApi.contactUs();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationsScreen()));
                            },
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: BlocProvider.value(
                                            value: CartCubit.get(context),
                                            child: CartScreen(
                                              showBackButton: true,
                                            )),
                                        type: PageTransitionType.leftToRight));
                              },
                              child: BlocConsumer<CartCubit, CartStates>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  num itemsCount = CartCubit.get(context)
                                      .numberOfItemsInCart;

                                  return Stack(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        height: 30,
                                        width: 30,
                                      ),
                                      Center(
                                        child: Image.asset(
                                          IconPaths.CART,
                                          width: 25,
                                          height: 25,
                                        ),
                                      ),
                                      (itemsCount == 0)
                                          ? Container()
                                          : Positioned(
                                              bottom: 0,
                                              right: 1,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: const BoxDecoration(
                                                    color: AppColors
                                                        .APP_MAIN_COLOR,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Text(
                                                    itemsCount.toString(),
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_8,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            )
                                    ],
                                  );
                                },
                              )),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                          height: 45,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SearchAppBarCustomInput(
                              filledColor: AppColors.APP_BAR_SEARCH_FIELD,
                              hintText:
                                  AppLocalizations.of(context)!.search_here,
                              textAlign: TextAlign.start,
                              isFilled: true,
                              readOnly: true,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: BlocProvider.value(
                                            value: CartCubit.get(context),
                                            child: BlocProvider(
                                                create: (context) =>
                                                    SearchCubit()
                                                      ..setSearchResults(""),
                                                child:
                                                    const SearchAndFilterScreen())),
                                        type: PageTransitionType.fade));
                              },
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
                          )),
                      // const SizedBox(height: 4,)
                    ],
                  );
                }),
              ),
            ),
            body: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                HomeCubit homeCubit = HomeCubit.get(context);
                // List<BannerAd>? bannerAds = homeCubit.banners;
                List<String>? bannerAds = homeCubit.banners;

                List<Category>? categories = homeCubit.categoriesOverview;

                var featuredProducts = homeCubit.featuredProductsOverview;
                var newArrivals = homeCubit.newArrivalsProductsOverview;
                var bestSellers = homeCubit.bestSellersProductsOverview;

                var brands = homeCubit.brands;

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
                              CarouselSlider(
                                options: CarouselOptions(
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    enlargeCenterPage: true,
                                    enableInfiniteScroll: false,
                                    initialPage: 0,
                                    viewportFraction: 1,
                                    autoPlay: true,
                                    onPageChanged: (index, reason) {}),
                                items: bannerAds
                                    .map(
                                      (e) => Image.asset(
                                        //   e.imageOriginal ?? "",
                                        e,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                        // errorBuilder:
                                        //     (context, object, stackTrace) {
                                        //   return const Center(
                                        //     child: Icon(
                                        //       Icons.error,
                                        //       size: 150,
                                        //       color: AppColors.APP_MAIN_COLOR,
                                        //     ),
                                        //   );
                                        // },
                                      ),
                                    )
                                    .toList(),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 16,
                                ),
                                itemCount: 5,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  String productListTitle = (index == 2)
                                      ? AppLocalizations.of(context)!
                                          .featured_products
                                      : (index == 4)
                                          ? AppLocalizations.of(context)!
                                              .new_arrivals
                                          : AppLocalizations.of(context)!
                                              .offers;

                                  var products = (index == 2)
                                      ? featuredProducts
                                      : (index == 4)
                                          ? newArrivals
                                          : bestSellers;

                                  return (index == 0)
                                      ? BrandsOverview(brands: brands ?? [])
                                      : (index == 1)
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
