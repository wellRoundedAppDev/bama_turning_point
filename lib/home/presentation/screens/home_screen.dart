import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/models/get_categories_response.dart';
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
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/notifications/presentation/screens/notifications_screen.dart';
import 'package:classic_eccomerce/shared_components/search_app_bar_custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
              toolbarHeight: MediaQuery.of(context).size.height * 0.12,
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
                  String firstName = MyApp.navKey.currentState?.context.read<AuthCubit>().loginResponse?.loginData?.firstname??"";
                  return
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();

                        },
                        child: SvgPicture.asset(IconPaths.ACCOUNT_ICON,
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const SizedBox(width: 8,),

                       Expanded(
                        child: Text(firstName??"",
                        style: const TextStyle(fontSize: FontSizes.FONT_SIZE_16,color: Colors.white,
                        
                        ),
                        ),
                      ),

                      Center(
                          child: Image.asset(
                            ImagePaths.APP_LOGO,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.2,

                          )),
                      // IconButton(
                      //   onPressed: () {
                      //     // ContactUsApi.contactUs();
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) =>
                      //     //             const NotificationsScreen()));
                      //   },
                      //   icon: const Icon(
                      //     Icons.notifications,
                      //     color: Colors.white,
                      //     size: 30,
                      //   ),
                      // ),



                      // const SizedBox(width: 16,),

                      Expanded(child: Container()),

                      GestureDetector(
                        onTap: () {
                        },
                        child: SvgPicture.asset(IconPaths.NOTIFICATION_ICON,
                          width: 25,
                          height: 25,
                        ),
                      ),


                      // GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           PageTransition(
                      //               child: BlocProvider.value(
                      //                   value: CartCubit.get(context),
                      //                   child: CartScreen(
                      //                     showBackButton: true,
                      //                   )),
                      //               type: PageTransitionType.leftToRight));
                      //     },
                      //     child: BlocConsumer<CartCubit, CartStates>(
                      //       listener: (context, state) {},
                      //       builder: (context, state) {
                      //         num itemsCount = CartCubit.get(context)
                      //             .numberOfItemsInCart;
                      //
                      //         return Stack(
                      //           children: [
                      //             Container(
                      //               color: Colors.transparent,
                      //               height: 30,
                      //               width: 30,
                      //             ),
                      //             Center(
                      //               child: Image.asset(
                      //                 IconPaths.CART,
                      //                 width: 25,
                      //                 height: 25,
                      //               ),
                      //             ),
                      //             (itemsCount == 0)
                      //                 ? Container()
                      //                 : Positioned(
                      //               bottom: 0,
                      //               right: 1,
                      //               child: Container(
                      //                 padding:
                      //                 const EdgeInsets.all(3),
                      //                 decoration: const BoxDecoration(
                      //                     color: Colors.yellow,
                      //                     shape: BoxShape.circle),
                      //                 child: Center(
                      //                   child: Text(
                      //                     itemsCount.toString(),
                      //                     style: const TextStyle(
                      //                         fontSize: FontSizes
                      //                             .FONT_SIZE_8,
                      //                         color: Colors.black),
                      //                   ),
                      //                 ),
                      //               ),
                      //             )
                      //           ],
                      //         );
                      //       },
                      //     )),
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
                                itemCount: 2,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  String productListTitle = (index == 1)
                                      ? AppLocalizations.of(context)!
                                          .new_arrivals
                                      : "";
                                  // (
                                  //
                                  //     index == 4)
                                  //         ? AppLocalizations.of(context)!
                                  //             .new_arrivals
                                  //         : AppLocalizations.of(context)!
                                  // .offers;

                                  var products =
                                      (index == 1) ? newArrivals : "";
                                  // : (index == 4)
                                  //     ? newArrivals
                                  //     : bestSellers;

                                  return
                                    // (index == 0)
                                    //   ? BrandsOverview(brands: brands ?? [])
                                    //   :
                                  (index == 0)
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
