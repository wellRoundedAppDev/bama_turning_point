import 'package:classic_eccomerce/account/data/models/get_order_details_response.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/helpers/remove_html_tags_from_string.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/fonts/font_sizes.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          CustomAppBar.renderAppBar(title: "MY ACCOUNT", showCartIcon: false),
      body: BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AccountCubit accountCubit = AccountCubit.get(context);
          int? selectedOrderId = accountCubit.selectedOrderId;
          OrderDetails? selectedOrder = accountCubit.selectedOrder;
          return (state is GetOrderDetailsLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is GetOrderDetailsNetworkConnectionFailedState)
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: NoNetworkRefreshPage(
                        refresh: () {
                          accountCubit.setOrderDetails(selectedOrderId ?? 0);
                        },
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        await accountCubit
                            .setOrderDetails(selectedOrderId ?? 0);
                      },
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ORDER HISTORY",
                                style: TextStyle(
                                    color: Color(0xff313846),
                                    fontSize: FontSizes.FONT_SIZE_20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 40,
                                height: 3,
                                color: AppColors.APP_MAIN_COLOR,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xffDDDDDD),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 16),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Order ID",
                                            style: TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "#$selectedOrderId",
                                              textAlign: TextAlign.right,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_14,
                                                  color: Color(0xff947979)),
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
                                          const Text(
                                            "Date Added",
                                            style: TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.dateAdded?.split(",").last.split("+").first ?? "-",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_14,
                                                  color: Color(0xff947979)),
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
                                          const Text(
                                            "Payment Method",
                                            style: TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.paymentMethod ??
                                                  "",
                                              textAlign: TextAlign.right,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_14,
                                                  color: Color(0xff947979)),
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
                                          const Text(
                                            "Shipping Method",
                                            style: TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.shippingMethod ??
                                                  "",
                                              textAlign: TextAlign.right,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_14,
                                                  color: Color(0xff947979)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              // const Text(
                              //   "Payment Address",
                              //   style: TextStyle(
                              //       color: Color(0xff313846),
                              //       fontSize: FontSizes.FONT_SIZE_20,
                              //       fontWeight: FontWeight.bold),
                              // ),
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              // Container(
                              //   width: 40,
                              //   height: 3,
                              //   color: AppColors.APP_MAIN_COLOR,
                              // ),
                              // const SizedBox(
                              //   height: 16,
                              // ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(8),
                              //     border: Border.all(
                              //       width: 1,
                              //       color: const Color(0xffDDDDDD),
                              //     ),
                              //   ),
                              //   child: Column(
                              //     children: [
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             vertical: 16.0, horizontal: 16),
                              //         child: Row(
                              //           children: [
                              //             const Text(
                              //               "Full Name",
                              //               style: TextStyle(
                              //                   fontSize:
                              //                       FontSizes.FONT_SIZE_14,
                              //                   fontWeight: FontWeight.bold),
                              //             ),
                              //             const SizedBox(
                              //               width: 8,
                              //             ),
                              //             Expanded(
                              //               child: Text(
                              //                 "${selectedOrder?.paymentFirstname ?? ""} ${selectedOrder?.paymentLastname ?? ""}",
                              //                 textAlign: TextAlign.right,
                              //                 maxLines: 1,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 style: const TextStyle(
                              //                     fontSize:
                              //                         FontSizes.FONT_SIZE_14,
                              //                     color: Color(0xff947979)),
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 1,
                              //         color: const Color(0xffB6BBC6),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             vertical: 16.0, horizontal: 16),
                              //         child: Row(
                              //           children: [
                              //             const Text(
                              //               "Address",
                              //               style: TextStyle(
                              //                   fontSize:
                              //                       FontSizes.FONT_SIZE_14,
                              //                   fontWeight: FontWeight.bold),
                              //             ),
                              //             const SizedBox(
                              //               width: 8,
                              //             ),
                              //             Expanded(
                              //               child: Text(
                              //                 removeHTMLTags(selectedOrder
                              //                         ?.paymentAddress1 ??
                              //                     "-"),
                              //                 textAlign: TextAlign.right,
                              //                 maxLines: 2,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 style: const TextStyle(
                              //                     fontSize:
                              //                         FontSizes.FONT_SIZE_14,
                              //                     color: Color(0xff947979)),
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 1,
                              //         color: const Color(0xffB6BBC6),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             vertical: 16.0, horizontal: 16),
                              //         child: Row(
                              //           children: [
                              //             const Text(
                              //               "City",
                              //               style: TextStyle(
                              //                   fontSize:
                              //                       FontSizes.FONT_SIZE_14,
                              //                   fontWeight: FontWeight.bold),
                              //             ),
                              //             const SizedBox(
                              //               width: 8,
                              //             ),
                              //             Expanded(
                              //               child: Text(
                              //                 selectedOrder?.paymentCity ?? "-",
                              //                 overflow: TextOverflow.ellipsis,
                              //                 maxLines: 1,
                              //                 textAlign: TextAlign.right,
                              //                 style: const TextStyle(
                              //                     fontSize:
                              //                         FontSizes.FONT_SIZE_14,
                              //                     color: Color(0xff947979)),
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 1,
                              //         color: const Color(0xffB6BBC6),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             vertical: 16.0, horizontal: 16),
                              //         child: Row(
                              //           children: [
                              //             const Text(
                              //               "Country",
                              //               style: TextStyle(
                              //                   fontSize:
                              //                       FontSizes.FONT_SIZE_14,
                              //                   fontWeight: FontWeight.bold),
                              //             ),
                              //             Expanded(
                              //               child: Text(
                              //                 selectedOrder?.paymentCountry ??
                              //                     "-",
                              //                 textAlign: TextAlign.right,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 maxLines: 1,
                              //                 style: const TextStyle(
                              //                     fontSize:
                              //                         FontSizes.FONT_SIZE_14,
                              //                     color: Color(0xff947979)),
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       Container(
                              //         height: 1,
                              //         color: const Color(0xffB6BBC6),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             vertical: 16.0, horizontal: 16),
                              //         child: Row(
                              //           children: [
                              //             const Text(
                              //               "Region",
                              //               style: TextStyle(
                              //                   fontSize:
                              //                       FontSizes.FONT_SIZE_14,
                              //                   fontWeight: FontWeight.bold),
                              //             ),
                              //             const SizedBox(
                              //               width: 8,
                              //             ),
                              //             Expanded(
                              //               child: Text(
                              //                 selectedOrder?.paymentZone ?? "",
                              //                 textAlign: TextAlign.right,
                              //                 maxLines: 1,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 style: const TextStyle(
                              //                     fontSize:
                              //                         FontSizes.FONT_SIZE_14,
                              //                     color: Color(0xff947979)),
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 16,
                              // ),
                              const Text(
                                "Shipping Address",
                                style: TextStyle(
                                    color: Color(0xff313846),
                                    fontSize: FontSizes.FONT_SIZE_20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 40,
                                height: 3,
                                color: AppColors.APP_MAIN_COLOR,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xffDDDDDD),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 16),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Full Name",
                                            style: TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${selectedOrder?.shippingFirstname ?? ""} ${selectedOrder?.shippingLastname ?? ""}",
                                              textAlign: TextAlign.right,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_14,
                                                  color: Color(0xff947979)),
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
                                          const Text(
                                            "Address",
                                            style: TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.shippingAddress1 ??
                                                  "",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_14,
                                                  color: Color(0xff947979)),
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
                                          const Text(
                                            "City",
                                            style: TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.shippingCity ?? "",
                                              textAlign: TextAlign.right,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_14,
                                                  color: Color(0xff947979)),
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
                                          const Text(
                                            "Country",
                                            style: TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.shippingCountry ??
                                                  '-',
                                              textAlign: TextAlign.right,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_14,
                                                  color: Color(0xff947979)),
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
                                          const Text(
                                            "Region",
                                            style: TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.shippingZone ?? "",
                                              textAlign: TextAlign.right,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_14,
                                                  color: Color(0xff947979)),
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
                    );
        },
      ),
    ));
  }
}
