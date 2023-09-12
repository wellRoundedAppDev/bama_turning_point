import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:classic_eccomerce/product_details/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';

class ProductsOverview extends StatelessWidget {
  var products;
  String productListTitle;

  ProductsOverview(
      {super.key, required this.products, required this.productListTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productListTitle,
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
                    color: const Color(0xff015963),
                  )
                ],
              )),
              InkWell(
                onTap: () {
                  HomeCubit homeCubit = HomeCubit.get(context);
                  homeCubit.navigateToViewAllProductsScreen(productListTitle);
                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         child: const ProductsInCategoryScreen(),
                  //         type: PageTransitionType.leftToRight));
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      color: Color(0xff8D929D)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = products[index];
                  String? productTitle = product.name;
                  num? productPrice = product.price;

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProductDetailsScreen()));
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  "",
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
                              Positioned(
                                  bottom: 8,
                                  right: 8,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.7)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.favorite_border_rounded,
                                          color: Colors.black,
                                        ),
                                      )))
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            productTitle ?? "-",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Color(0xff333333),
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Flexible(
                                  child: Text(
                                "\$${productPrice.toString() ?? "-"}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0xff015963),
                                    fontWeight: FontWeight.bold),
                              )),
                              // const SizedBox(
                              //   width: 8,
                              // ),
                              // Flexible(
                              //     flex: 2,
                              //     child: Text(
                              //       "\$17.96",
                              //       textAlign: TextAlign.left,
                              //       overflow: TextOverflow.ellipsis,
                              //       maxLines: 1,
                              //       style: TextStyle(
                              //         decoration: TextDecoration.lineThrough,
                              //         color: const Color(0xff333333)
                              //             .withOpacity(0.5),
                              //       ),
                              //     )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: products.length),
          ),
        ],
      ),
    );
  }
}
