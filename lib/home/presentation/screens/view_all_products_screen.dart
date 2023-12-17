import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/home/data/models/product.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../product_details/presentation/screens/product_details_screen.dart';
import '../cubits/home_cubit/cubit.dart';
import '../cubits/home_cubit/states.dart';

class ViewAllProductsScreen extends StatelessWidget {
  String productTitle;
  ViewAllProductsScreen({Key? key, required this.productTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(
          title: productTitle, cartCubit: CartCubit.get(context)),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          List<Product>? products = homeCubit.allProducts;
          return (state is FetchingAllProductsLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is FetchingAllProductsNetworkConnectionFailedState)
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: NoNetworkRefreshPage(
                        refresh: () {
                          homeCubit.loadViewAllProductsScreen(productTitle);

                          //  homeCubit.setCategories();
                        },
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        await homeCubit.loadViewAllProductsScreen(productTitle);
                      },
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent:
                              MediaQuery.of(context).size.height * 0.32,
                        ),
                        itemCount: products?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          Product? product = products?[index];
                          int? productId = product?.productId?.toInt();
                          String? productName = product?.name;
                          String? productImageUrl = product?.productImagePath;
                          String? priceFormatted = product?.priceFormatted;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: BlocProvider.value(
                                        value: CartCubit.get(context),
                                        child: ProductDetailsScreen(
                                          selectedProductId: productId ?? -1,
                                        ),
                                      ),
                                      type: PageTransitionType.leftToRight));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      productImageUrl ?? "",
                                      errorBuilder:
                                          (context, object, stackTrace) {
                                        return const Icon(
                                          Icons.error,
                                          size: 150,
                                          color: AppColors.APP_MAIN_COLOR,
                                        );
                                      },
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    productName ?? "-",
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        color: Color(0xff313846),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
        },
      ),
    ));
  }
}
