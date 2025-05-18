import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:classic_eccomerce/vendors/presentation/screens/all_products_in_vendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../shared_components/custom_app_bar.dart';
import '../cubit/vendor_cubit.dart';
import '../cubit/vendor_states.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => VendorsCubit()..setVendors(),
        child: SafeArea(
          child: Scaffold(
            appBar: CustomAppBar.renderAppBar(
                title: "", cartCubit: CartCubit.get(context)),
            body: BlocConsumer<VendorsCubit, VendorsStates>(
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
                      )
                    : state is VendorsNetworkConnectionFailedState
                        ? Padding(
                            padding: const EdgeInsets.all(16),
                            child: NoNetworkRefreshPage(refresh: () {
                              vendorsCubit.setVendors();
                            }),
                          )
                        : RefreshIndicator(
                            onRefresh: () async {
                              await vendorsCubit.setVendors();
                            },
                            child: GridView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisExtent:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      mainAxisSpacing: 0,
                                      crossAxisSpacing: 16),
                              itemCount: vendors?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                var vendor = vendors?[index];

                                var vendorId = vendor?.id;
                                var vendorName = vendor?.supplierName;
                                var imageUrl = ApiUrls.BASE_URL + (vendor?.imageUrl??"");

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.leftToRight,
                                            child:
                                                ViewAllProductsByVendorScreen(

                                                    vendorId:
                                                        vendorId?.toInt() ??
                                                            0,

                                                )));
                                    // print(category?.categoryId);
                                    // categoriesCubit
                                    //     .setAllProductsInCategory(category);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipOval(
                                        child: Image.network(
                                          imageUrl,
                                          // height:
                                          //     MediaQuery.of(context).size.height *
                                          //         0.08,
                                          // width: MediaQuery.of(context).size.width *
                                          //     0.17,

                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.08,

                                          width:
                                          MediaQuery.of(context)
                                              .size.width
                                          ,

                                          fit: BoxFit.cover,

                                          errorBuilder: (context,
                                              object, stackTrace) {
                                            return Icon(
                                              Icons.error,
                                              size:
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.08,
                                              color: AppColors
                                                  .APP_MAIN_COLOR,
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 0,
                                      ),
                                      Text(
                                        vendorName ?? "",
                                        style: const TextStyle(
                                            color: AppColors.GREY_LABEL_COLOR,
                                            fontSize: FontSizes.FONT_SIZE_16,
                                            fontWeight: FontWeight.bold),
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
