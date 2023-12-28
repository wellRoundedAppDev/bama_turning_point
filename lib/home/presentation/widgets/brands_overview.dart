import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/cubit.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/get_brands_api.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/products_apis.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/screens/view_all_products_screen.dart';
import 'package:classic_eccomerce/product_details/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../data/models/get_brands_response.dart';
import '../../data/models/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrandsOverview extends StatelessWidget {
  List<Brand> brands;

  BrandsOverview(
      {super.key, required this.brands,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          AppLocalizations.of(context)!.brands,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
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
                          color: AppColors.APP_MAIN_COLOR,
                        )
                      ],
                    )),
                // InkWell(
                //   onTap: () {
                //     // HomeCubit homeCubit = HomeCubit.get(context);
                //     // homeCubit.navigateToViewAllProductsScreen(productListTitle,CartCubit.get(context));
                //     // Navigator.push(
                //     //     context,
                //     //     PageTransition(
                //     //         child: const ProductsInCategoryScreen(),
                //     //         type: PageTransitionType.leftToRight));
                //   },
                //   child:  Text(
                //     AppLocalizations.of(context)!.view_all,
                //     style: const TextStyle(
                //         fontSize: FontSizes.FONT_SIZE_14,
                //         color: Color(0xff8D929D)),
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var brand = brands[index];
                  var brandImagePath = brand.originalImage;
                  var brandName = brand.name;
                  return Row(
                    children: [
                      (index == 0)?const SizedBox(width: 16,):Container(),
                      InkWell(
                        onTap: () {
                          HomeCubit homeCubit = HomeCubit.get(context);
                          homeCubit.setSelectedBrand(brand);
                          homeCubit.navigateToViewAllProductsScreen("",CartCubit.get(context),isBrands: true,);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  brandImagePath??"",
                                  height:
                                  MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width,

                                  errorBuilder: (context, object, stackTrace) {
                                    return const Icon(
                                      Icons.error,
                                      size: 150,
                                      color: AppColors.APP_MAIN_COLOR,
                                    );
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                brandName ?? "-",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: FontSizes.FONT_SIZE_14,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Row(
                              //   children: [
                              //     Flexible(
                              //         child: Text(
                              //           priceFormatted??"",
                              //           //"\$${productPrice.toString() ?? "-"}",
                              //           maxLines: 1,
                              //           overflow: TextOverflow.ellipsis,
                              //           style: const TextStyle(
                              //               color: AppColors.APP_MAIN_COLOR,
                              //               fontWeight: FontWeight.bold),
                              //         )),
                              //     // const SizedBox(
                              //     //   width: 8,
                              //     // ),
                              //     // Flexible(
                              //     //     flex: 2,
                              //     //     child: Text(
                              //     //       "\$17.96",
                              //     //       textAlign: TextAlign.left,
                              //     //       overflow: TextOverflow.ellipsis,
                              //     //       maxLines: 1,
                              //     //       style: TextStyle(
                              //     //         decoration: TextDecoration.lineThrough,
                              //     //         color: const Color(0xff333333)
                              //     //             .withOpacity(0.5),
                              //     //       ),
                              //     //     )),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ),
                      (index == brands.length - 1)?const SizedBox(width: 16,):Container(),

                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                itemCount: brands.length),
          ),
        ],
      ),
    );
  }
}
