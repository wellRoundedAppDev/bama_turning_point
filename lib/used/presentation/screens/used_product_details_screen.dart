import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/used/presentation/widgets/used_product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_app_bar.dart';
import '../../data/models/used_products_by_client_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsedProductDetailsScreen extends StatelessWidget {
  UsedProduct? usedProductItem;
  UsedProductDetailsScreen({super.key, required this.usedProductItem});

  CarouselControllerPlus carouselController = CarouselControllerPlus();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          CustomAppBar.renderAppBar(title: "Add product", showCartIcon: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          carouselController.nextPage();
                        },
                        child: SvgPicture.asset(IconPaths.RIGHT_PICTURE_ARROW)),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          ((usedProductItem?.images?.length ?? 0) == 0)
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            insetPadding: EdgeInsets.zero,
                                            content: Stack(
                                              children: [
                                                Image.network(
                                                  "http://noourcaser-001-site1.mtempurl.com/" +
                                                      (usedProductItem?.images
                                                              ?.first?.url ??
                                                          ""),
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  errorBuilder: (context,
                                                      object, stackTrace) {
                                                    return const Center(
                                                      child: Icon(
                                                        Icons.error,
                                                        size: 200,
                                                        color: AppColors
                                                            .APP_MAIN_COLOR,
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
                                                      color: AppColors
                                                          .APP_MAIN_COLOR,
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
                                    "http://noourcaser-001-site1.mtempurl.com/" +
                                        (usedProductItem?.images?.first?.url ??
                                            ""),
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, object, stackTrace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.error,
                                          size: 150,
                                          color: AppColors.APP_MAIN_COLOR,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : CarouselSlider(
                                  controller: carouselController,
                                  options: CarouselOptions(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      enlargeCenterPage: true,
                                      enableInfiniteScroll: true,
                                      initialPage: 0,
                                      autoPlay: true,
                                      viewportFraction: 1,
                                      onPageChanged: (index, reason) {
                                        // productDetailsCubit
                                        //     .setSliderCurrentIndex(
                                        //     index);
                                      }),
                                  items: usedProductItem?.images
                                      ?.map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    content: Stack(
                                                      children: [
                                                        Image.network(
                                                          "http://noourcaser-001-site1.mtempurl.com/" +
                                                              (e.url ?? ""),
                                                          height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          errorBuilder:
                                                              (context, object,
                                                                  stackTrace) {
                                                            return const Center(
                                                              child: Icon(
                                                                Icons.error,
                                                                size: 200,
                                                                color: AppColors
                                                                    .APP_MAIN_COLOR,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Positioned(
                                                          top: 8,
                                                          left: 4,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Icon(
                                                              Icons.cancel,
                                                              color: AppColors
                                                                  .APP_MAIN_COLOR,
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
                                            "http://noourcaser-001-site1.mtempurl.com/" +
                                                (e.url ?? ""),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            errorBuilder:
                                                (context, object, stackTrace) {
                                              return const Center(
                                                child: Icon(
                                                  Icons.error,
                                                  size: 150,
                                                  color:
                                                      AppColors.APP_MAIN_COLOR,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                          // ((usedProductItem?.images?.length ??
                          //     0) ==
                          //     0)
                          //     ? Container()
                          //     : Positioned(
                          //   bottom: 16,
                          //   right:
                          //   MediaQuery.of(context)
                          //       .size
                          //       .width *
                          //       0.42,
                          //   left:
                          //   MediaQuery.of(context)
                          //       .size
                          //       .width *
                          //       0.42,
                          //   child: Container(
                          //     decoration:
                          //     BoxDecoration(
                          //       borderRadius:
                          //       BorderRadius
                          //           .circular(10),
                          //       color: const Color(
                          //           0xff191616)
                          //           .withOpacity(0.6),
                          //     ),
                          //     child: Center(
                          //         child: Padding(
                          //           padding:
                          //           const EdgeInsets
                          //               .all(2.0),
                          //           child: BlocConsumer<
                          //               ProductDetailsCubit,
                          //               ProductDetailsStates>(
                          //             listener: (context,
                          //                 state) {},
                          //             builder: (context,
                          //                 state) {
                          //               return Text(
                          //                 '${productDetailsCubit.slideCurrentIndex + 1}/${originalImageUrls?.length}',
                          //                 style: const TextStyle(
                          //                     color: Colors
                          //                         .white,
                          //                     fontSize:
                          //                     FontSizes
                          //                         .FONT_SIZE_12),
                          //               );
                          //             },
                          //           ),
                          //         )),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                        onTap: () {
                          carouselController.previousPage();
                        },
                        child: SvgPicture.asset(IconPaths.LEFT_PICTURE_ARROW)),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: const Color(0xffB6BBC6),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.motorcycle_name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              usedProductItem?.name ?? "",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.motorcycle_price,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              (usedProductItem?.price?.toString() ?? "") +
                                  "${AppSettingsCubit.get(context).currencyCode}",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.model,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              usedProductItem?.model ?? "",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.phone_number,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              usedProductItem?.phoneNumber ?? "",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.address,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              usedProductItem?.address ?? "",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.odometer,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              (usedProductItem?.odometer ?? "") +
                                  " ${AppLocalizations.of(context)!.km}",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xffB6BBC6),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.description,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              (usedProductItem?.description ?? ""),
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
