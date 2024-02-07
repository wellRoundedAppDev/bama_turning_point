import 'package:carousel_slider/carousel_slider.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/helpers/remove_html_tags_from_string.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/cubit.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/states.dart';
import 'package:classic_eccomerce/product_details/presentation/widgets/product_details_bottom_sheet.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../shared_components/no_network_refresh_page.dart';
import '../../data/models/get_product_details_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsScreen extends StatelessWidget {
  int selectedProductId;
  ProductDetailsScreen({
    super.key,
    required this.selectedProductId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(
        selectedProductId: selectedProductId,
      )..setProductDetails(),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductDetailsCubit productDetailsCubit =
              ProductDetailsCubit.get(context);
          ProductDetails? productDetails =
              productDetailsCubit.selectedProductDetails;
          String? productImagePath = productDetails?.originalImage;
          String? productName = productDetails?.name;
          num? productPrice = productDetails?.price;
          String? priceFormatted = productDetails?.priceFormated;
          num? productPriceExcludingTaxes = productDetails?.priceExcludingTax;
          List<Option>? options = productDetails?.options;
          // Option? firstOption;
          // int? firstOptionProductId;
          //
          // if (options != null && options.isNotEmpty) {
          //   firstOption = options.first;
          //   firstOptionProductId = firstOption.productOptionId;
          // }

          bool isThereOptions = (options != null && options.isNotEmpty);
          String? priceExcludingTaxesFormatted =
              productDetails?.priceExcludingTaxFormated;
          num? productRating = productDetails?.rating;
          String? stockStatus = productDetails?.stockStatus;
          String? description = productDetails?.description;
          List<String>? originalImageUrls = productDetails?.originalImages;
          return (state is GetProductDetailsLoadingState)
              ? const Material(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : (state is GetProductDetailsNetworkConnectionFailedState)
                  ? Material(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: NoNetworkRefreshPage(
                          refresh: () {
                            productDetailsCubit.setProductDetails();
                          },
                        ),
                      ),
                    )
                  : SafeArea(
                      child: Scaffold(
                          backgroundColor: Colors.white,
                          bottomSheet: const ProductDetailsBottomSheet(),
                          appBar: CustomAppBar.renderAppBar(
                              title: productName ?? "",
                              cartCubit: CartCubit.get(context)),
                          body: RefreshIndicator(
                            onRefresh: () async {
                              await productDetailsCubit.setProductDetails();
                            },
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.1),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Stack(
                                            children: [
                                              ((originalImageUrls?.length ??
                                                          0) ==
                                                      0)
                                                  ? Image.network(
                                                      productImagePath ?? "",
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                          object, stackTrace) {
                                                        return const Center(
                                                          child: Icon(
                                                            Icons.error,
                                                            size: 150,
                                                            color: AppColors
                                                                .APP_MAIN_COLOR,
                                                          ),
                                                        );
                                                      },
                                                    )
                                                  : CarouselSlider(
                                                      options: CarouselOptions(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                          enlargeCenterPage:
                                                              true,
                                                          enableInfiniteScroll:
                                                              true,
                                                          initialPage: 0,
                                                          autoPlay: true,
                                                          viewportFraction: 1,
                                                          onPageChanged:
                                                              (index, reason) {
                                                            productDetailsCubit
                                                                .setSliderCurrentIndex(
                                                                    index);
                                                          }),
                                                      items: originalImageUrls
                                                          ?.map(
                                                            (e) =>
                                                                Image.network(
                                                              e ?? "",
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              errorBuilder:
                                                                  (context,
                                                                      object,
                                                                      stackTrace) {
                                                                return const Center(
                                                                  child: Icon(
                                                                    Icons.error,
                                                                    size: 150,
                                                                    color: AppColors
                                                                        .APP_MAIN_COLOR,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                              // Image.network(
                                              //   productImagePath??"",
                                              //   errorBuilder:
                                              //       (context, object, stackTrace) {
                                              //     return const Center(
                                              //       child: Icon(
                                              //         Icons.error,
                                              //         size: 150,
                                              //         color: AppColors.APP_MAIN_COLOR,
                                              //       ),
                                              //     );
                                              //   },
                                              //   width: MediaQuery.of(context)
                                              //       .size
                                              //       .width,
                                              //   height: MediaQuery.of(context)
                                              //           .size
                                              //           .height *
                                              //       0.3,
                                              //   fit: BoxFit.cover,
                                              // ),
                                              ((originalImageUrls?.length ??
                                                          0) ==
                                                      0)
                                                  ? Container()
                                                  : Positioned(
                                                      bottom: 16,
                                                      right:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.42,
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.42,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: const Color(
                                                                  0xff191616)
                                                              .withOpacity(0.6),
                                                        ),
                                                        child: Center(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: BlocConsumer<
                                                              ProductDetailsCubit,
                                                              ProductDetailsStates>(
                                                            listener: (context,
                                                                state) {},
                                                            builder: (context,
                                                                state) {
                                                              return Text(
                                                                '${productDetailsCubit.slideCurrentIndex + 1}/${originalImageUrls?.length}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        FontSizes
                                                                            .FONT_SIZE_12),
                                                              );
                                                            },
                                                          ),
                                                        )),
                                                      ),
                                                    )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  productName ?? "-",
                                                  style: const TextStyle(
                                                      fontSize: FontSizes
                                                          .FONT_SIZE_14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff333333)),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  priceFormatted ?? "",
                                                  //   "\$$productPrice",
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .APP_MAIN_COLOR,
                                                      fontSize: FontSizes
                                                          .FONT_SIZE_18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Ex Tax: $priceExcludingTaxesFormatted",
                                                        style: const TextStyle(
                                                            fontSize: FontSizes
                                                                .FONT_SIZE_14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xff999999)),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        (1 <=
                                                                (productRating ??
                                                                    0))
                                                            ? const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .black,
                                                              )
                                                            : const Icon(
                                                                Icons
                                                                    .star_outline,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        (2 <=
                                                                (productRating ??
                                                                    0))
                                                            ? const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .black,
                                                              )
                                                            : const Icon(
                                                                Icons
                                                                    .star_outline,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        (3 <=
                                                                (productRating ??
                                                                    0))
                                                            ? const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .black,
                                                              )
                                                            : const Icon(
                                                                Icons
                                                                    .star_outline,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        (4 <=
                                                                (productRating ??
                                                                    0))
                                                            ? const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .black,
                                                              )
                                                            : const Icon(
                                                                Icons
                                                                    .star_outline,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        (5 <=
                                                                (productRating ??
                                                                    0))
                                                            ? const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .black,
                                                              )
                                                            : const Icon(
                                                                Icons
                                                                    .star_outline,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                (isThereOptions == false)
                                                    ? Container()
                                                    : const SizedBox(
                                                        height: 16,
                                                      ),
                                                ...(options
                                                        ?.map<Widget>((option) {
                                                      int? productOptionId =
                                                          option
                                                              .productOptionId;
                                                      String? optionName =
                                                          option.optionName;
                                                      return Padding(
                                                        padding:
                                                             EdgeInsets
                                                                .only(
                                                                bottom: (productOptionId == options.last.productOptionId)?0:16),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              optionName ?? "",
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      FontSizes
                                                                          .FONT_SIZE_14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xff333333)),
                                                            ),
                                                            const SizedBox(
                                                              width: 8,
                                                            ),
                                                            Expanded(
                                                              child: SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.04,
                                                                child: ListView
                                                                    .separated(
                                                                        scrollDirection:
                                                                            Axis
                                                                                .horizontal,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          var productOptionValue =
                                                                              option.optionValues?[index];
                                                                          var productOptionImage =
                                                                              productOptionValue?.optionImageUrl;
                                                                          int?
                                                                              productOptionValueId =
                                                                              productOptionValue?.productOptionValueId;
                                                                          if (kDebugMode) {
                                                                            print(productDetailsCubit.selectedOption['option']);
                                                                            print(productDetailsCubit.selectedOption['option'][option.productOptionId?.toString()]);
                                                                          }
                                                                          bool
                                                                              isOptionSelected =
                                                                              productDetailsCubit.selectedOption['option']?[productOptionId?.toString()] == productOptionValueId.toString();

                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              productDetailsCubit.setOption(option, productOptionValue);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                                  width: 35,
                                                                              height: 30,
                                                                              decoration: BoxDecoration(
                                                                                  border: Border.all(color: AppColors.APP_MAIN_COLOR, width: (isOptionSelected == true) ? 2 : 0), borderRadius: BorderRadius.circular(100)),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(300),
                                                                                child: Image.network(
                                                                                  productOptionImage ?? "",
                                                                                  fit: BoxFit.cover,
                                                                                  errorBuilder: (context, object, stackTrace) {
                                                                                    return const Center(
                                                                                      child: Icon(
                                                                                        Icons.error,
                                                                                        size: 30,
                                                                                        color: AppColors.APP_MAIN_COLOR,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                        separatorBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return const SizedBox(
                                                                            width:
                                                                                8,
                                                                          );
                                                                        },
                                                                        itemCount:
                                                                            option.optionValues?.length ??
                                                                                0),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    })?.toList()) ??
                                                    []
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          const Divider(
                                            thickness: 2,
                                            color: Color(0xffE5E5E5),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${AppLocalizations.of(context)!.stock}:  ",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xff313846)),
                                                    ),
                                                    Text(
                                                      stockStatus ?? "",
                                                      style: TextStyle(
                                                          color: Color(
                                                              (stockStatus ==
                                                                      "Out Of Stock")
                                                                  ? 0xffE7284D
                                                                  : 0xff1D9F40)),
                                                    ),
                                                  ],
                                                ),

                                                // const SizedBox(
                                                //   height: 16,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     const Text(
                                                //       "Size : ",
                                                //       style: TextStyle(
                                                //           fontWeight:
                                                //               FontWeight.bold,
                                                //           fontSize: FontSizes
                                                //               .FONT_SIZE_14,
                                                //           color: Color(
                                                //               0xfff313846)),
                                                //     ),
                                                //     Container(
                                                //       decoration:
                                                //           BoxDecoration(
                                                //               border:
                                                //                   Border.all(
                                                //                 color: const Color(
                                                //                     0xffD0D0D0),
                                                //                 width: 1,
                                                //               ),
                                                //               borderRadius:
                                                //                   BorderRadius
                                                //                       .circular(
                                                //                           2)),
                                                //       child: const Padding(
                                                //         padding: EdgeInsets
                                                //             .symmetric(
                                                //                 horizontal:
                                                //                     8.0,
                                                //                 vertical: 5),
                                                //         child: Text(
                                                //           "xs",
                                                //           style: TextStyle(
                                                //               fontSize: FontSizes
                                                //                   .FONT_SIZE_14,
                                                //               fontWeight:
                                                //                   FontWeight
                                                //                       .w500,
                                                //               color: Color(
                                                //                   0xff313846)),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 8,
                                                //     ),
                                                //     Container(
                                                //       decoration:
                                                //           BoxDecoration(
                                                //               border:
                                                //                   Border.all(
                                                //                 color: const Color(
                                                //                     0xffD0D0D0),
                                                //                 width: 1,
                                                //               ),
                                                //               borderRadius:
                                                //                   BorderRadius
                                                //                       .circular(
                                                //                           2)),
                                                //       child: const Padding(
                                                //         padding: EdgeInsets
                                                //             .symmetric(
                                                //                 horizontal:
                                                //                     8.0,
                                                //                 vertical: 5),
                                                //         child: Text(
                                                //           "sm",
                                                //           style: TextStyle(
                                                //               fontSize: FontSizes
                                                //                   .FONT_SIZE_14,
                                                //               fontWeight:
                                                //                   FontWeight
                                                //                       .w500,
                                                //               color: Color(
                                                //                   0xff313846)),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 8,
                                                //     ),
                                                //     Container(
                                                //       decoration:
                                                //           BoxDecoration(
                                                //               border:
                                                //                   Border.all(
                                                //                 color: const Color(
                                                //                     0xffD0D0D0),
                                                //                 width: 1,
                                                //               ),
                                                //               borderRadius:
                                                //                   BorderRadius
                                                //                       .circular(
                                                //                           2)),
                                                //       child: const Padding(
                                                //         padding: EdgeInsets
                                                //             .symmetric(
                                                //                 horizontal:
                                                //                     8.0,
                                                //                 vertical: 5),
                                                //         child: Text(
                                                //           "lg",
                                                //           style: TextStyle(
                                                //               fontSize: FontSizes
                                                //                   .FONT_SIZE_14,
                                                //               fontWeight:
                                                //                   FontWeight
                                                //                       .w500,
                                                //               color: Color(
                                                //                   0xff313846)),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 8,
                                                //     ),
                                                //     Container(
                                                //       decoration:
                                                //           BoxDecoration(
                                                //               border:
                                                //                   Border.all(
                                                //                 color: const Color(
                                                //                     0xffD0D0D0),
                                                //                 width: 1,
                                                //               ),
                                                //               borderRadius:
                                                //                   BorderRadius
                                                //                       .circular(
                                                //                           2)),
                                                //       child: const Padding(
                                                //         padding: EdgeInsets
                                                //             .symmetric(
                                                //                 horizontal:
                                                //                     8.0,
                                                //                 vertical: 5),
                                                //         child: Text(
                                                //           "lg",
                                                //           style: TextStyle(
                                                //               fontSize: FontSizes
                                                //                   .FONT_SIZE_14,
                                                //               fontWeight:
                                                //                   FontWeight
                                                //                       .w500,
                                                //               color: Color(
                                                //                   0xff313846)),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 8,
                                                //     ),
                                                //     Container(
                                                //       decoration:
                                                //           BoxDecoration(
                                                //               border:
                                                //                   Border.all(
                                                //                 color: const Color(
                                                //                     0xffD0D0D0),
                                                //                 width: 1,
                                                //               ),
                                                //               borderRadius:
                                                //                   BorderRadius
                                                //                       .circular(
                                                //                           2)),
                                                //       child: const Padding(
                                                //         padding: EdgeInsets
                                                //             .symmetric(
                                                //                 horizontal:
                                                //                     8.0,
                                                //                 vertical: 5),
                                                //         child: Text(
                                                //           "lg",
                                                //           style: TextStyle(
                                                //               fontSize: FontSizes
                                                //                   .FONT_SIZE_14,
                                                //               fontWeight:
                                                //                   FontWeight
                                                //                       .w500,
                                                //               color: Color(
                                                //                   0xff313846)),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                                // BlocConsumer<CartCubit,
                                                //     CartStates>(
                                                //   listener:
                                                //       (context, state) {},
                                                //   builder: (context, state) {
                                                //     CartCubit cartCubit =
                                                //         CartCubit.get(
                                                //             context);
                                                //     bool isProductInCart = cartCubit
                                                //         .cartItems
                                                //         .containsKey(
                                                //             selectedProductId
                                                //                 .toString());
                                                //
                                                //     int quantity = 0;
                                                //     if (isProductInCart) {
                                                //       quantity = cartCubit
                                                //                   .cartItems[
                                                //               selectedProductId
                                                //                   .toString()]
                                                //           ['quantity'];
                                                //     }
                                                //     // return (isProductInCart)
                                                //     //     ? Column(
                                                //     //         crossAxisAlignment:
                                                //     //             CrossAxisAlignment
                                                //     //                 .start,
                                                //     //         children: [
                                                //     //           const SizedBox(
                                                //     //             height: 20,
                                                //     //           ),
                                                //               // Row(
                                                //               //   children: [
                                                //               //     const Text(
                                                //               //       "QTY",
                                                //               //       style: TextStyle(
                                                //               //           fontSize: FontSizes
                                                //               //               .FONT_SIZE_16,
                                                //               //           color: Color(
                                                //               //               0xff313846),
                                                //               //           fontWeight:
                                                //               //               FontWeight.bold),
                                                //               //     ),
                                                //               //     const SizedBox(
                                                //               //       width: 16,
                                                //               //     ),
                                                //               //     Container(
                                                //               //       width: MediaQuery.of(context)
                                                //               //               .size
                                                //               //               .width *
                                                //               //           0.25,
                                                //               //       height:
                                                //               //           25,
                                                //               //       decoration:
                                                //               //           BoxDecoration(
                                                //               //               border: Border.all(color: const Color(0xffD0D0D0))),
                                                //               //       child:
                                                //               //           Row(
                                                //               //         children: [
                                                //               //           Flexible(
                                                //               //               flex: 1,
                                                //               //               child: GestureDetector(
                                                //               //                 onTap: () {
                                                //               //                   cartCubit.decreaseProductQuantity(selectedProductId.toString(),0);
                                                //               //                 },
                                                //               //                 child: const Icon(
                                                //               //                   Icons.remove,
                                                //               //                   color: Color(0xff313846),
                                                //               //                 ),
                                                //               //               )),
                                                //               //           Container(
                                                //               //             height:
                                                //               //                 MediaQuery.of(context).size.height,
                                                //               //             width:
                                                //               //                 1,
                                                //               //             color:
                                                //               //                 const Color(0xffD0D0D0),
                                                //               //           ),
                                                //               //           Flexible(
                                                //               //               flex: 2,
                                                //               //               child: Center(
                                                //               //                 child: Text(
                                                //               //                   quantity.toString(),
                                                //               //                   style: const TextStyle(fontSize: FontSizes.FONT_SIZE_12, color: Color(0xff313846), fontWeight: FontWeight.bold),
                                                //               //                 ),
                                                //               //               )),
                                                //               //           Container(
                                                //               //             height:
                                                //               //                 MediaQuery.of(context).size.height,
                                                //               //             width:
                                                //               //                 1,
                                                //               //             color:
                                                //               //                 const Color(0xffD0D0D0),
                                                //               //           ),
                                                //               //           Flexible(
                                                //               //               flex: 1,
                                                //               //               child: Center(
                                                //               //                   child: GestureDetector(
                                                //               //                 onTap: () {
                                                //               //                   cartCubit.increaseProductQuantity(selectedProductId.toString(),0);
                                                //               //                 },
                                                //               //                 child: const Icon(
                                                //               //                   Icons.add,
                                                //               //                   color: Color(0xff313846),
                                                //               //                 ),
                                                //               //               ))),
                                                //               //         ],
                                                //               //       ),
                                                //               //     ),
                                                //               //   ],
                                                //               // )
                                                //            // ],
                                                //          // )
                                                //        // : Container();
                                                //   },
                                                // )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          const Divider(
                                            thickness: 2,
                                            color: Color(0xffE5E5E5),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          (description?.isEmpty == true)
                                              ? Container()
                                              : Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .description,
                                                        style: const TextStyle(
                                                            fontSize: FontSizes
                                                                .FONT_SIZE_16,
                                                            color: Color(
                                                                0xff313846),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        removeHTMLTags(
                                                            description ?? ""),
                                                        style: const TextStyle(
                                                            fontSize: FontSizes
                                                                .FONT_SIZE_14,
                                                            color: Color(
                                                                0xff71757E)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          // const SizedBox(
                                          //   height: 8,
                                          // ),
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.symmetric(
                                          //           horizontal: 16.0),
                                          //   child: Container(
                                          //     padding:
                                          //         const EdgeInsets.symmetric(
                                          //             horizontal: 16,
                                          //             vertical: 8),
                                          //     color: const Color(0xffF5F5F5),
                                          //     child: Row(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment.start,
                                          //       children: [
                                          //         Text(
                                          //           productRating
                                          //                   .toString() ??
                                          //               "",
                                          //           style: const TextStyle(
                                          //               color:
                                          //                   Color(0xff313846),
                                          //               fontWeight:
                                          //                   FontWeight.bold,
                                          //               fontSize: FontSizes
                                          //                   .FONT_SIZE_16),
                                          //         ),
                                          //         const SizedBox(
                                          //           width: 16,
                                          //         ),
                                          //         Row(
                                          //           children: [
                                          //             ((productRating ?? 0) >=
                                          //                     1)
                                          //                 ? const Icon(
                                          //                     Icons.star,
                                          //                     color: Color(
                                          //                         0xffFFAB16),
                                          //                   )
                                          //                 : const Icon(
                                          //                     Icons
                                          //                         .star_outline_sharp,
                                          //                     color: Color(
                                          //                         0xffFFAB16),
                                          //                   ),
                                          //             ((productRating ?? 0) >=
                                          //                     2)
                                          //                 ? const Icon(
                                          //                     Icons.star,
                                          //                     color: Color(
                                          //                         0xffFFAB16),
                                          //                   )
                                          //                 : const Icon(
                                          //                     Icons
                                          //                         .star_outline_sharp,
                                          //                     color: Color(
                                          //                         0xffFFAB16)),
                                          //             ((productRating ?? 0) >=
                                          //                     3)
                                          //                 ? const Icon(
                                          //                     Icons.star,
                                          //                     color: Color(
                                          //                         0xffFFAB16),
                                          //                   )
                                          //                 : const Icon(
                                          //                     Icons
                                          //                         .star_outline_sharp,
                                          //                     color: Color(
                                          //                         0xffFFAB16)),
                                          //             ((productRating ?? 0) >=
                                          //                     4)
                                          //                 ? const Icon(
                                          //                     Icons.star,
                                          //                     color: Color(
                                          //                         0xffFFAB16),
                                          //                   )
                                          //                 : const Icon(
                                          //                     Icons
                                          //                         .star_outline_sharp,
                                          //                     color: Color(
                                          //                         0xffFFAB16)),
                                          //             ((productRating ?? 0) >=
                                          //                     5)
                                          //                 ? const Icon(
                                          //                     Icons.star,
                                          //                     color: Color(
                                          //                         0xffFFAB16),
                                          //                   )
                                          //                 : const Icon(
                                          //                     Icons
                                          //                         .star_outline_sharp,
                                          //                     color: Color(
                                          //                         0xffFFAB16))
                                          //           ],
                                          //         )
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),
                                          // const SizedBox(
                                          //   height: 16,
                                          // ),
                                          //   ListView.separated(
                                          //       separatorBuilder:
                                          //           (context, index) => Column(
                                          //                 children: [
                                          //                   (index == 2)
                                          //                       ? Container()
                                          //                       : const Divider(
                                          //                           thickness:
                                          //                               1,
                                          //                           color: Color(
                                          //                               0xffE5E5E5),
                                          //                         ),
                                          //                 ],
                                          //               ),
                                          //       shrinkWrap: true,
                                          //       physics:
                                          //           const NeverScrollableScrollPhysics(),
                                          //       itemCount: 3,
                                          //       itemBuilder: (context, index) {
                                          //         return const Padding(
                                          //           padding:
                                          //               EdgeInsets.symmetric(
                                          //                   horizontal: 16.0,
                                          //                   vertical: 8),
                                          //           child: Comment(),
                                          //         );
                                          //       }),
                                          //   Padding(
                                          //     padding: const EdgeInsets.only(
                                          //         top: 8.0),
                                          //     child: Container(
                                          //       height: 1,
                                          //       color: const Color(0xffE5E5E5),
                                          //     ),
                                          //   )
                                          //
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )));
        },
      ),
    );
  }
}
