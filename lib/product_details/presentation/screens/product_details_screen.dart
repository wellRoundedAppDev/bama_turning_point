import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/remove_html_tags_from_string.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/cubit.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/states.dart';
import 'package:classic_eccomerce/product_details/presentation/widgets/product_details_bottom_sheet.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../shared_components/no_network_refresh_page.dart';
import '../../data/models/get_product_details_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsScreen extends StatelessWidget {
  // Product product;
  int selectedProductId;
  bool isCompany;

  ProductDetailsScreen({
    super.key,
    required this.selectedProductId,
     this.isCompany = true,
    //required this.product
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(
          selectedProductId: selectedProductId, isCompany: isCompany)
        ..setProductDetails(),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductDetailsCubit productDetailsCubit =
              ProductDetailsCubit.get(context);
          ProductModel? productDetails =
              productDetailsCubit.selectedProductDetails;
          // String? productImagePath = productDetails?.files?[0].fileUrl;
          String? productName = productDetails?.productName;
          num? productPrice = productDetails?.minorUnitPrice;
          String? priceFormatted =
          productDetails?.source == 2?

              productDetails?.price?.toString() :

          productDetails?.minorUnitPrice.toString();
          num? productPriceExcludingTaxes = productDetails?.minorUnitPrice;
          List<ProductColor>? colorProduct = productDetails?.colors;
          List<ProductSize>? sizeProduct = productDetails?.sizes;

          // List<Option>? options = productDetails?.options;
          // Option? firstOption;
          // int? firstOptionProductId;
          //
          // if (options != null && options.isNotEmpty) {
          //   firstOption = options.first;
          //   firstOptionProductId = firstOption.productOptionId;
          // }

          // bool isThereOptions = (options != null && options.isNotEmpty);
          String? priceExcludingTaxesFormatted =
              productDetails?.grandUnitPrice.toString();
          num? productRating = productDetails?.ratingCount;
          String? description = productDetails?.notes;
          List<ProductFile>? originalImageUrls = productDetails?.files;
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
                                                  ? Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Image.network(
                                                        "",
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        fit: BoxFit.contain,
                                                        errorBuilder: (context,
                                                            object,
                                                            stackTrace) {
                                                          return Icon(
                                                            Icons.error,
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.18,
                                                            color: AppColors
                                                                .APP_MAIN_COLOR,
                                                          );
                                                        },
                                                      ),
                                                    )
                                                  : ((originalImageUrls
                                                                  ?.length ??
                                                              0) ==
                                                          1)
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    content:
                                                                        Stack(
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          "${ApiUrls.BASE_URL}${originalImageUrls?[0].fileUrl}" ??"",
                                                                          height: MediaQuery.of(context)
                                                                              .size
                                                                              .height,
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          errorBuilder: (context,
                                                                              object,
                                                                              stackTrace) {
                                                                            return const Center(
                                                                              child: Icon(
                                                                                Icons.error,
                                                                                size: 200,
                                                                                color: AppColors.APP_MAIN_COLOR,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                        Positioned(
                                                                          top:
                                                                              8,
                                                                          left:
                                                                              4,
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.cancel,
                                                                              color: AppColors.APP_MAIN_COLOR,
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                });
                                                          },
                                                          child: Image.network(
                                                            "${ApiUrls.BASE_URL}${originalImageUrls?[0].fileUrl}" ??
                                                                "",
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.4,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            fit: BoxFit.contain,
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
                                                      : CarouselSlider(
                                                          options:
                                                              CarouselOptions(
                                                                  height: MediaQuery.of(context)
                                                                          .size
                                                                          .height *
                                                                      0.3,
                                                                  enlargeCenterPage:
                                                                      true,
                                                                  enableInfiniteScroll:
                                                                      true,
                                                                  initialPage:
                                                                      0,
                                                                  autoPlay:
                                                                      true,
                                                                  viewportFraction:
                                                                      1,
                                                                  onPageChanged:
                                                                      (index,
                                                                          reason) {
                                                                    productDetailsCubit
                                                                        .setSliderCurrentIndex(
                                                                            index);
                                                                  }),
                                                          items:
                                                              originalImageUrls
                                                                  ?.map(
                                                                    (e) =>
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return AlertDialog(
                                                                                insetPadding: EdgeInsets.zero,
                                                                                content: Stack(
                                                                                  children: [
                                                                                    Image.network(
                                                                                      e.fileUrl ?? "",
                                                                                      height: MediaQuery.of(context).size.height,
                                                                                      width: MediaQuery.of(context).size.width,
                                                                                      errorBuilder: (context, object, stackTrace) {
                                                                                        return const Center(
                                                                                          child: Icon(
                                                                                            Icons.error,
                                                                                            size: 200,
                                                                                            color: AppColors.APP_MAIN_COLOR,
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                    Positioned(
                                                                                      top: 8,
                                                                                      left: 4,
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: const Icon(
                                                                                          Icons.cancel,
                                                                                          color: AppColors.APP_MAIN_COLOR,
                                                                                          size: 50,
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            });
                                                                      },
                                                                      child: Image
                                                                          .network(
                                                                        e.fileUrl ??
                                                                            "",
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        errorBuilder: (context,
                                                                            object,
                                                                            stackTrace) {
                                                                          return const Center(
                                                                            child:
                                                                                Icon(
                                                                              Icons.error,
                                                                              size: 150,
                                                                              color: AppColors.APP_MAIN_COLOR,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  )
                                                                  .toList(),
                                                        ),
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
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
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
                                                          color: Color(
                                                              0xff333333)),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      "${priceFormatted  ?? ""} ${AppLocalizations.of(context)!.dinar}",

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

                                                    // (isThereOptions == false)
                                                    //     ? Container()
                                                    //     : const SizedBox(
                                                    //         height: 16,
                                                    //       ),
                                                    // (isThereOptions == false)
                                                    //     ? Container()
                                                    //     : Text(
                                                    //         AppLocalizations.of(
                                                    //                 context)!
                                                    //             .select_from_the_available_options,
                                                    //         style: const TextStyle(
                                                    //             fontWeight:
                                                    //                 FontWeight.bold,
                                                    //             color: Color(
                                                    //                 0xff313846)),
                                                    //       ),
                                                    // (isThereOptions == false)
                                                    //     ? Container()
                                                    //     : const SizedBox(
                                                    //         height: 4,
                                                    //       ),
                                                    // ...(options?.map<Widget>(
                                                    //         (optionItem) {
                                                    //       int? productOptionId =
                                                    //           optionItem
                                                    //               .productOptionId;
                                                    //       String? optionName =
                                                    //           optionItem.optionName;
                                                    //       return Padding(
                                                    //         padding: EdgeInsets.only(
                                                    //             bottom: (productOptionId ==
                                                    //                     options.last
                                                    //                         .productOptionId)
                                                    //                 ? 0
                                                    //                 : 16),
                                                    //         child: Row(
                                                    //           children: [
                                                    //             //todo replace original
                                                    //             // Text(
                                                    //             //   optionName ?? "",
                                                    //             //   style: const TextStyle(
                                                    //             //       fontSize:
                                                    //             //           FontSizes
                                                    //             //               .FONT_SIZE_14,
                                                    //             //       fontWeight:
                                                    //             //           FontWeight
                                                    //             //               .bold,
                                                    //             //       color: Color(
                                                    //             //           0xff333333)),
                                                    //             // ),
                                                    //             // const SizedBox(
                                                    //             //   width: 8,
                                                    //             // ),
                                                    //
                                                    //             //todo original circles
                                                    //             // Expanded(
                                                    //             //   child: SizedBox(
                                                    //             //     height: MediaQuery.of(
                                                    //             //                 context)
                                                    //             //             .size
                                                    //             //             .height *
                                                    //             //         0.04,
                                                    //             //     child: ListView
                                                    //             //         .separated(
                                                    //             //             scrollDirection:
                                                    //             //                 Axis
                                                    //             //                     .horizontal,
                                                    //             //             itemBuilder:
                                                    //             //                 (context,
                                                    //             //                     index) {
                                                    //             //               var productOptionValue =
                                                    //             //                   option.optionValues?[index];
                                                    //             //               var productOptionImage =
                                                    //             //                   productOptionValue?.optionImageUrl;
                                                    //             //               var productOptionName =
                                                    //             //                   productOptionValue?.name;
                                                    //             //               int?
                                                    //             //                   productOptionValueId =
                                                    //             //                   productOptionValue?.productOptionValueId;
                                                    //             //               if (kDebugMode) {
                                                    //             //                 print(productDetailsCubit.selectedOption['option']);
                                                    //             //                 print(productDetailsCubit.selectedOption['option'][option.productOptionId?.toString()]);
                                                    //             //               }
                                                    //             //               bool
                                                    //             //                   isOptionSelected =
                                                    //             //                   productDetailsCubit.selectedOption['option']?[productOptionId?.toString()] == productOptionValueId.toString();
                                                    //             //
                                                    //             //               return GestureDetector(
                                                    //             //                 onTap:
                                                    //             //                     () {
                                                    //             //                   productDetailsCubit.setOption(option, productOptionValue);
                                                    //             //                 },
                                                    //             //                 child:
                                                    //             //                     Container(
                                                    //             //                   width: 35,
                                                    //             //                   height: 30,
                                                    //             //                   decoration: BoxDecoration(border: Border.all(color: AppColors.APP_MAIN_COLOR, width: (isOptionSelected == true) ? 2 : 0), borderRadius: BorderRadius.circular((productOptionImage == null) ? 0 : 100)),
                                                    //             //                   child: (productOptionImage == null)
                                                    //             //                       ? Center(child: Text(productOptionName ?? ""))
                                                    //             //                       : ClipRRect(
                                                    //             //                           borderRadius: BorderRadius.circular(100),
                                                    //             //                           child: Image.network(
                                                    //             //                             productOptionImage ?? "",
                                                    //             //                             fit: BoxFit.cover,
                                                    //             //                             errorBuilder: (context, object, stackTrace) {
                                                    //             //                               return const Center(
                                                    //             //                                 child: Icon(
                                                    //             //                                   Icons.error,
                                                    //             //                                   size: 30,
                                                    //             //                                   color: AppColors.APP_MAIN_COLOR,
                                                    //             //                                 ),
                                                    //             //                               );
                                                    //             //                             },
                                                    //             //                           ),
                                                    //             //                         ),
                                                    //             //                 ),
                                                    //             //               );
                                                    //             //             },
                                                    //             //             separatorBuilder:
                                                    //             //                 (context,
                                                    //             //                     index) {
                                                    //             //               return const SizedBox(
                                                    //             //                 width:
                                                    //             //                     8,
                                                    //             //               );
                                                    //             //             },
                                                    //             //             itemCount:
                                                    //             //                 option.optionValues?.length ??
                                                    //             //                     0),
                                                    //             //   ),
                                                    //             // )
                                                    //
                                                    //             Expanded(
                                                    //               child: Container(
                                                    //                 padding:
                                                    //                     const EdgeInsets
                                                    //                         .only(
                                                    //                         left:
                                                    //                             16,
                                                    //                         right:
                                                    //                             8),
                                                    //                 decoration: BoxDecoration(
                                                    //                     border: Border.all(
                                                    //                         color: const Color(
                                                    //                             0xff95989A))),
                                                    //                 child: DropdownSearch<
                                                    //                     OptionValue>(
                                                    //
                                                    //                   items: optionItem
                                                    //                           .optionValues ??
                                                    //                       [],
                                                    //                   dropdownDecoratorProps: DropDownDecoratorProps(
                                                    //                       dropdownSearchDecoration: InputDecoration(
                                                    //                           border: InputBorder.none,
                                                    //                           hintStyle: const TextStyle(
                                                    //                             fontSize:
                                                    //                                 FontSizes.FONT_SIZE_16,
                                                    //                             color:
                                                    //                                 Color(0xff878787),
                                                    //                           ),
                                                    //                           label: Text(
                                                    //                             optionName ??
                                                    //                                 "",
                                                    //                             style: const TextStyle(
                                                    //                                 fontSize: FontSizes.FONT_SIZE_16,
                                                    //                                 fontWeight: FontWeight.bold,
                                                    //                                 color: Color(0xff313846)),
                                                    //                           ),
                                                    //                           hintText: AppLocalizations.of(context)!.region_or_state)),
                                                    //                   dropdownButtonProps:
                                                    //                       const DropdownButtonProps(
                                                    //                           icon:
                                                    //                               Icon(
                                                    //                     Icons
                                                    //                         .keyboard_arrow_down,
                                                    //                     color: Color(
                                                    //                         0xff696C6E),
                                                    //                   )),
                                                    //                   popupProps: PopupProps.menu(itemBuilder:
                                                    //                       (context,
                                                    //                           OptionValue
                                                    //                               option,
                                                    //                           bool) {
                                                    //                     return Padding(
                                                    //                       padding: const EdgeInsets
                                                    //                           .all(
                                                    //                           16.0),
                                                    //                       child: Image
                                                    //                           .network(
                                                    //                         option.optionImageUrl ??
                                                    //                             "-",
                                                    //                         height: MediaQuery.of(context).size.height *
                                                    //                             0.05,
                                                    //                         width: double
                                                    //                             .infinity,
                                                    //                         fit: BoxFit
                                                    //                             .cover,
                                                    //                         errorBuilder: (context,
                                                    //                             object,
                                                    //                             stackTrace) {
                                                    //                           return const Center(
                                                    //                             child:
                                                    //                             Icon(
                                                    //                               Icons.error,
                                                    //                               size:
                                                    //                               40,
                                                    //                               color:
                                                    //                               AppColors.APP_MAIN_COLOR,
                                                    //                             ),
                                                    //                           );
                                                    //                         },
                                                    //                       ),
                                                    //                     );
                                                    //                   }),
                                                    //                   dropdownBuilder:
                                                    //                       (context,
                                                    //                           option) {
                                                    //                     return (option ==
                                                    //                             null)
                                                    //                         ? Text(optionName ??
                                                    //                             "-")
                                                    //                         : Image
                                                    //                             .network(
                                                    //                             option?.optionImageUrl ??
                                                    //                                 "",
                                                    //                             height:
                                                    //                                 MediaQuery.of(context).size.height * 0.05,
                                                    //                             width:
                                                    //                                 double.infinity,
                                                    //                             fit:
                                                    //                                 BoxFit.cover,
                                                    //                       errorBuilder: (context,
                                                    //                           object,
                                                    //                           stackTrace) {
                                                    //                         return const Center(
                                                    //                           child:
                                                    //                           Icon(
                                                    //                             Icons.error,
                                                    //                             size:
                                                    //                             40,
                                                    //                             color:
                                                    //                             AppColors.APP_MAIN_COLOR,
                                                    //                           ),
                                                    //                         );
                                                    //                       },
                                                    //                           );
                                                    //                   },
                                                    //                   onChanged:
                                                    //                       (optionValue) {
                                                    //                     productDetailsCubit.setOption(
                                                    //                         optionItem,
                                                    //                         optionValue);
                                                    //                   },
                                                    //
                                                    //                 ),
                                                    //               ),
                                                    //             ),
                                                    //           ],
                                                    //         ),
                                                    //       );
                                                    //     }).toList()) ??
                                                    //   []
                                                  ],
                                                ),
                                                // Spacer(),
                                                // Padding(
                                                //   padding: const EdgeInsets
                                                //       .symmetric(
                                                //       horizontal: 16),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Row(
                                                //         children: [
                                                //           (1 <=
                                                //                   (productRating ??
                                                //                       0))
                                                //               ? const Icon(
                                                //                   Icons.star,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 )
                                                //               : const Icon(
                                                //                   Icons
                                                //                       .star_outline,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 ),
                                                //           (2 <=
                                                //                   (productRating ??
                                                //                       0))
                                                //               ? const Icon(
                                                //                   Icons.star,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 )
                                                //               : const Icon(
                                                //                   Icons
                                                //                       .star_outline,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 ),
                                                //           (3 <=
                                                //                   (productRating ??
                                                //                       0))
                                                //               ? const Icon(
                                                //                   Icons.star,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 )
                                                //               : const Icon(
                                                //                   Icons
                                                //                       .star_outline,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 ),
                                                //           (4 <=
                                                //                   (productRating ??
                                                //                       0))
                                                //               ? const Icon(
                                                //                   Icons.star,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 )
                                                //               : const Icon(
                                                //                   Icons
                                                //                       .star_outline,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 ),
                                                //           (5 <=
                                                //                   (productRating ??
                                                //                       0))
                                                //               ? const Icon(
                                                //                   Icons.star,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 )
                                                //               : const Icon(
                                                //                   Icons
                                                //                       .star_outline,
                                                //                   color: Colors
                                                //                       .black,
                                                //                 ),
                                                //         ],
                                                //       )
                                                //     ],
                                                //   ),
                                                // ),
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
                                          const Divider(
                                            thickness: 2,
                                            color: Color(0xffE5E5E5),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          colorProduct?.length!=0 && colorProduct!=null?
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  "${AppLocalizations.of(context)!.color}  ",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(
                                                          0xff313846)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: SizedBox(
                                                  height: 50,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              InkWell(
                                                                onTap: () {
                                                                  productDetailsCubit
                                                                      .setColorID(
                                                                          colorProduct?[index].colorId ??
                                                                              0);
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16),
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          5),
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: productDetailsCubit.selectColorID == colorProduct?[index].colorId
                                                                              ? AppColors.APP_ORANGE_LABEL_COLOR
                                                                              : const Color(0xffDDDDDD),
                                                                          width: 2)),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        color: Color(
                                                                            int.parse('0xff${colorProduct?[index].colorValue?.replaceAll("#", "") ?? '000000'}')),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        colorProduct?[index].colorName ??
                                                                            '',
                                                                        style: const TextStyle(
                                                                            color:
                                                                                Color(0xff313846),
                                                                            fontSize: FontSizes.FONT_SIZE_12),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          colorProduct?.length),
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
                                            ],
                                          ):Container(width: 0,height: 0,),

                                          sizeProduct?.length!=0 && sizeProduct!=null?
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                                child: Text(
                                                  "${AppLocalizations.of(context)!.size}  ",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff313846)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                                child: SizedBox(
                                                  height: 50,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              InkWell(
                                                                onTap: () {
                                                                  productDetailsCubit
                                                                      .setSizeID(
                                                                          sizeProduct?[index]
                                                                                  .sizeId ??
                                                                              0);
                                                                },
                                                                child: Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              16),
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              5),
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: productDetailsCubit.selectSizeID ==
                                                                                  sizeProduct?[index]
                                                                                      .sizeId
                                                                              ? AppColors
                                                                                  .APP_ORANGE_LABEL_COLOR
                                                                              : const Color(
                                                                                  0xffDDDDDD),
                                                                          width:
                                                                              2)),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      const SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Text(
                                                                        sizeProduct?[index]
                                                                                .sizeName ??
                                                                            '',
                                                                        style: const TextStyle(
                                                                            color: Color(
                                                                                0xff313846),
                                                                            fontSize:
                                                                                FontSizes.FONT_SIZE_12),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          colorProduct?.length),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                            ],
                                          ):Container(width: 0,height: 0,),

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
