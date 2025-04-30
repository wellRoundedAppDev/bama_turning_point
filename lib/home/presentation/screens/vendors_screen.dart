import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/models/get_categories_response.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_families.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/home/data/models/get_banners_response.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/states.dart';
import 'package:classic_eccomerce/home/presentation/cubits/search_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/vendors_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/vendors_cubit/states.dart';
import 'package:classic_eccomerce/home/presentation/screens/search_and_filter_screen.dart';
import 'package:classic_eccomerce/home/presentation/widgets/brands_overview.dart';
import 'package:classic_eccomerce/home/presentation/widgets/categories_overview.dart';
import 'package:classic_eccomerce/home/presentation/widgets/filter_drawer.dart';
import 'package:classic_eccomerce/home/presentation/widgets/products_overview.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/notifications/presentation/screens/notifications_screen.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:classic_eccomerce/shared_components/search_app_bar_custom_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import '../../../cart/presentation/cubits/cart_cubit/states.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../categories/data/models/get_categories_paginated_response.dart';
import '../../../shared_components/custom_app_bar.dart';
import '../../data/models/product.dart';
import '../widgets/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => VendorsCubit()..setVendors(),
        child: SafeArea(
          child: Scaffold(
            appBar: CustomAppBar.renderAppBar(
                title:   "",
                cartCubit: CartCubit.get(context)),
            body: BlocConsumer<VendorsCubit, VendorStates>(
              listener: (context, state) {},
              builder: (context, state) {
                VendorsCubit vendorsCubit = VendorsCubit.get(context);
                // List<BannerAd>? bannerAds = homeCubit.banners;
                // List<BannerAd>? bannerAds = homeCubit.banners;
                //
                // List<Category2>? categories = homeCubit.categoriesOverview;
                //
                // var featuredProducts = homeCubit.featuredProductsOverview;
                // var newArrivals = homeCubit.newArrivalsProductsOverview;
                // var bestSellers = homeCubit.bestSellersProductsOverview;
                //
                // var brands = homeCubit.brands;
                //
                //
                // var productsOverview = homeCubit.productsOverview;

                var vendors = vendorsCubit.vendors;

                return (state is VendorsLoadingState)
                    ? const Center(
                  child: CircularProgressIndicator(),
                ):
                    state is VendorsNetworkConnectionFailedState?

                    Padding(padding: const EdgeInsets.all(16),
                    child: NoNetworkRefreshPage(refresh: (){
                      vendorsCubit.setVendors();
                    }),
                    )

                    : RefreshIndicator(
                  onRefresh: () async {
                    await vendorsCubit.setVendors();
                  },
                  child:  GridView.builder(
                    shrinkWrap: true,
                    padding:
                    const EdgeInsets
                        .symmetric(
                        vertical: 16,
                        horizontal:
                        16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisExtent:
                        MediaQuery.of(
                            context)
                            .size
                            .height *
                            0.14,

                        mainAxisSpacing:
                        0,
                        crossAxisSpacing:
                        16),
                    itemCount: vendors?.length??0,
                    itemBuilder:
                        (BuildContext
                    context,
                        int index) {

                      var vendor = vendors?[index];

                      var vendorId = vendor?.id;
                      var vendorName = vendor?.supplierName;

                      return InkWell(
                        onTap: () {
                          // print(category?.categoryId);
                          // categoriesCubit
                          //     .setAllProductsInCategory(category);
                        },
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .start,
                          children: [
                            Image.asset(
                              ImagePaths
                                  .APP_LOGO,
                              height: MediaQuery.of(context)
                                  .size
                                  .height *
                                  0.08,
                            ),
                            const SizedBox(
                              height: 0,
                            ),
                            Text(
                              vendorName??"",
                              style: const TextStyle(
                                  color: AppColors
                                      .GREY_LABEL_COLOR,
                                  fontSize: FontSizes
                                      .FONT_SIZE_16,
                                  fontWeight:
                                  FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ));
  }
}
