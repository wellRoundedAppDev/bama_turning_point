import 'package:classic_eccomerce/account/data/models/get_customer_orders_response.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/constants/fonts/font_sizes.dart';
import '../order_history/order_history_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderHistoryItem extends StatelessWidget {
  CustomerOrder? customerOrder;
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
              children: [Text(
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
                    "#${customerOrder?.orderId ?? ""}",
                    textAlign: TextAlign.right,
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
                    customerOrder?.name ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.right,
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
                  AppLocalizations.of(context)!.number_of_products,
                  style: const TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 4,
                ),

                Expanded(
                  child: Text(
                    customerOrder?.numOfProducts.toString() ?? "",
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                  AppLocalizations.of(context)!.total,
                  style: const TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    customerOrder?.total??"",
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
                    customerOrder?.status ?? "",
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                    customerOrder?.dateAdded?.split(",").last.split("+").first ?? "-",
                    textAlign: TextAlign.right,
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
                                int.tryParse(customerOrder?.orderId ?? "") ??
                                    0),
                          child: const OrderDetailsScreen()),
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
              child:  Center(
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
