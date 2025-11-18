import 'package:classic_eccomerce/account/data/models/get_customer_orders_response.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/constants/fonts/font_sizes.dart';
import '../../../../core/locales/l10n/app_localizations.dart';
import '../../../../shared_components/custom_button.dart';
import '../order_history/order_history_details_screen.dart';

class OrderHistoryItem extends StatelessWidget {
  PurchaseRequest? customerOrder;

  OrderHistoryItem({super.key, required this.customerOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.order_id,
                  style: const TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "#${customerOrder?.requestNumber ?? ""}",
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
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
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.customer,
                  style: const TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    customerOrder?.customerName ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
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
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.status,
                  style: const TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    customerOrder?.status == 1
                        ? AppLocalizations.of(context)!.hanging
                        : customerOrder?.status == 2
                            ? AppLocalizations.of(context)!.accepted
                            : customerOrder?.status == 3
                                ? AppLocalizations.of(context)!.unacceptable
                                : AppLocalizations.of(context)!.complete,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Color(0xff947979)),
                  ),
                )
                //              const SizedBox(
                //                width: 4,
                //              ),
                //
                //              // Expanded(
                //              //   child: Text(
                //              //     customerOrder?.status ?? "",
                //              //     textAlign: TextAlign.start,
                //              //     overflow: TextOverflow.ellipsis,
                //              //     maxLines: 1,
                //              //     style: TextStyle(
                //              //         fontSize: FontSizes.FONT_SIZE_14,
                //              //         color: (customerOrder?.status == "Canceled" ||
                //              //                 customerOrder?.status == "ملغي")
                //              //             ? Colors.red
                //              //             : const Color(0xff947979)),
                //              //   ),
                //              // ),
                // // قيد الإنتظار//
                //              //Pending
                //              ((customerOrder?.status == "Canceled" ||
                //                      customerOrder?.status == "ملغي") )
                //                  ? Container()
                //                  :  (customerOrder?.status != "قيد الإنتظار" &&
                //                  customerOrder?.status != "Pending")?Container(): GestureDetector(
                //                      onTap: () {
                //                        AccountCubit accountCubit = AccountCubit.get(context);
                //                        showDialog(
                //                            context: context,
                //                            builder: (context) {
                //                              return BlocProvider.value(
                //                                value: accountCubit,
                //                                child: AlertDialog(
                //                                  title: Text(AppLocalizations.of(context)!.are_you_sure_you_want_to_cancel_order),
                //                                actions: [
                //                                  BlocConsumer<AccountCubit,AccountStates>(
                //                                    listener: (context,state){},
                //                                    builder: (context,state){
                //                                     return CustomButton(
                //                                          isLoading:state is CancelCustomerOrderLoadingState,
                //                                          text: AppLocalizations.of(context)!.yes, action: (){
                //                                        accountCubit.cancelOrder(customerOrder);
                //                                        Navigator.pop(context);
                //                                      });
                //                                    },
                //                                  ),
                //                                  const SizedBox(height: 4,),
                //                                  CustomButton(text: AppLocalizations.of(context)!.no, action: (){
                //                                    Navigator.pop(context);
                //                                  })
                //                                ],
                //                                )
                //                              );
                //                            });
                //                      },
                //                      child: Text(
                //                        AppLocalizations.of(context)!.cancel_order ?? "",
                //                        style: const TextStyle(
                //                            fontWeight: FontWeight.bold,
                //                            fontSize: FontSizes.FONT_SIZE_14,
                //                            color: Colors.red),
                //                      ),
                //                    )
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xffB6BBC6),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.date_added,
                  style: const TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    DateFormat('yyyy-MM-dd')
                            .format(customerOrder!.requestDate)
                            ?.split(",")
                            .last
                            .split("+")
                            .first ??
                        "-",
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: FontSizes.FONT_SIZE_14,
                        color: Color(0xff947979)),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: BlocProvider.value(
                          value: AccountCubit.get(context)
                            ..setOrderDetails(
                                int.tryParse("${customerOrder?.id ?? ''}") ??
                                    0),
                          child: OrderDetailsScreen()),
                      type: PageTransitionType.leftToRight));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xffDBD6D6),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                  child: Text(
                AppLocalizations.of(context)!.view,
                style: const TextStyle(
                    fontSize: FontSizes.FONT_SIZE_14, color: Color(0xff313846)),
              )),
            ),
          )
        ],
      ),
    );
  }
}
