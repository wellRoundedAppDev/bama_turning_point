import 'package:classic_eccomerce/account/data/models/get_order_details_response.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/helpers/remove_html_tags_from_string.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/fonts/font_sizes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({
    super.key,
  });

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
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .order_details,
                                      style: const TextStyle(
                                          color: Color(0xff313846),
                                          fontSize: FontSizes.FONT_SIZE_20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
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
                                          Text(
                                            AppLocalizations.of(context)!
                                                .order_id,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "#$selectedOrderId",
                                              textAlign: TextAlign.end,
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
                                          Text(
                                            AppLocalizations.of(context)!
                                                .date_added,
                                            textAlign: TextAlign.end,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.dateAdded
                                                      ?.split(",")
                                                      .last
                                                      .split("+")
                                                      .first ??
                                                  "-",
                                              textAlign: TextAlign.end,
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
                                          Text(
                                            AppLocalizations.of(context)!
                                                .payment_method,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.paymentMethod ??
                                                  "",
                                              textAlign: TextAlign.end,
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
                                          Text(
                                            AppLocalizations.of(context)!
                                                .shipping_method,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.shippingMethod ??
                                                  "",
                                              textAlign: TextAlign.end,
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
                              Text(
                                AppLocalizations.of(context)!.shipping_address,
                                style: const TextStyle(
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
                                          Text(
                                            AppLocalizations.of(context)!
                                                .full_name,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${selectedOrder?.shippingFirstname ?? ""} ${selectedOrder?.shippingLastname ?? ""}",
                                              textAlign: TextAlign.end,
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
                                          Text(
                                            AppLocalizations.of(context)!
                                                .address,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.shippingAddress1 ??
                                                  "",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.end,
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
                                          Text(
                                            AppLocalizations.of(context)!.city,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.shippingCity ?? "",
                                              textAlign: TextAlign.end,
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
                                          Text(
                                            AppLocalizations.of(context)!
                                                .country,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedOrder?.shippingCountry ??
                                                  '-',
                                              textAlign: TextAlign.end,
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
                                          Text(
                                            AppLocalizations.of(context)!
                                                .region,
                                            style: const TextStyle(
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
                                              textAlign: TextAlign.end,
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
                              Text(
                                AppLocalizations.of(context)!.order,
                                style: const TextStyle(
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
                                child: Column(children: [
                                  ...selectedOrder?.products
                                          ?.map(
                                            (product) => Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          product.name ?? "",
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: FontSizes
                                                                .FONT_SIZE_14,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          "${product.priceRaw ?? ""}${product.currency} x ${product.quantity}",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                              fontSize: FontSizes
                                                                  .FONT_SIZE_12,
                                                              color: Color(
                                                                  0xff947979)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${product.totalRaw ?? ""}${product.currency}",
                                                      maxLines: 1,
                                                      textAlign: TextAlign.end,
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff947979),
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList() ??
                                      [],
                                  Container(
                                    height: 1,
                                    color: const Color(0xffB6BBC6),
                                  ),
                                  ...selectedOrder?.totals
                                          ?.map((total) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      total.title ?? "",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                      ),
                                                    )),
                                                    Text(
                                                      (double.tryParse(total
                                                                          .value ??
                                                                      "")
                                                                  ?.toString() ??
                                                              "") +
                                                          AppSettingsCubit.get(
                                                                  context)
                                                              .currencyCode,
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xff947979)),
                                                    )
                                                  ],
                                                ),
                                              ))
                                          .toList() ??
                                      []
                                ]),
                              ),
                              // const SizedBox(height: 16,),
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
