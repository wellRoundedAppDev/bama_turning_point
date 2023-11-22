import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/home/data/models/search_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../product_details/presentation/screens/product_details_screen.dart';

class FilteredProduct extends StatelessWidget {
  SearchItem? searchItem;
  FilteredProduct({Key? key, required this.searchItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: BlocProvider.value(
                  value: CartCubit.get(context),
                  child: ProductDetailsScreen(
                    selectedProductId: searchItem?.id?.toInt() ?? -1,
                  ),
                ),
                type: PageTransitionType.leftToRight));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffDDDDDD), width: 1)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                searchItem?.originalImage ?? '',
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 700,
              color: const Color(0xffDDDDDD),
              width: 1,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            searchItem?.name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: FontSizes.FONT_SIZE_14,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$${searchItem?.price}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: FontSizes.FONT_SIZE_15,
                                color: AppColors.APP_MAIN_COLOR,
                                fontWeight: FontWeight.bold),
                          ),
                          // Row(
                          //   children: [
                          //      Flexible(
                          //       child: Text(
                          //         "\$${searchItem.price}",
                          //         maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //         style: const TextStyle(
                          //             fontSize: FontSizes.FONT_SIZE_15,
                          //             color: Color(0xff015963),
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //     ),
                          //     // const SizedBox(
                          //     //   width: 16,
                          //     // ),
                          //     // Flexible(
                          //     //     flex: 2,
                          //     //     child: Text(
                          //     //       "\$17.96",
                          //     //       textAlign: TextAlign.left,
                          //     //       overflow: TextOverflow.ellipsis,
                          //     //       maxLines: 1,
                          //     //       style: TextStyle(
                          //     //         fontSize: FontSizes.FONT_SIZE_14,
                          //     //         decoration: TextDecoration.lineThrough,
                          //     //         color: const Color(0xff333333).withOpacity(0.5),
                          //     //       ),
                          //     //     )),
                          //   ],
                          // ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                ((searchItem?.rating ?? 0) >= 1)
                                    ? Icons.star
                                    : Icons.star_outline_sharp,
                                color: Colors.black,
                                size: 16,
                              ),
                              Icon(
                                ((searchItem?.rating ?? 0) >= 2)
                                    ? Icons.star
                                    : Icons.star_outline_sharp,
                                color: Colors.black,
                                size: 16,
                              ),
                              Icon(
                                ((searchItem?.rating ?? 0) >= 3)
                                    ? Icons.star
                                    : Icons.star_outline_sharp,
                                color: Colors.black,
                                size: 16,
                              ),
                              Icon(
                                ((searchItem?.rating ?? 0) >= 4)
                                    ? Icons.star
                                    : Icons.star_outline_sharp,
                                color: Colors.black,
                                size: 16,
                              ),
                              Icon(
                                ((searchItem?.rating ?? 0) >= 5)
                                    ? Icons.star
                                    : Icons.star_outline_sharp,
                                color: Colors.black,
                                size: 16,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Image.asset(IconPaths.CART,width: 15,height: 15,color: Colors.black,),
                    //       const SizedBox(width: 12,),
                    //       Image.asset(IconPaths.FAV_ICON,width: 15,height: 15,color: Colors.black,),
                    //       const SizedBox(width: 8,),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
