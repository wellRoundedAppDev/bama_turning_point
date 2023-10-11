import 'package:classic_eccomerce/account/data/models/get_customer_orders_response.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/constants/fonts/font_sizes.dart';
import '../order_history/order_history_details_screen.dart';

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
              children: [
                const Text(
                  "Order ID",
                  style: TextStyle(
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
                const Text(
                  "Customer",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
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
                const Text(
                  "No. of Products",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
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
                const Text(
                  "Total",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "\$${customerOrder?.totalRaw}",
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
                const Text(
                  "Status",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
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
                const Text(
                  "Date Added",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_14,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    customerOrder?.dateAdded ?? "",
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
              child: const Center(
                  child: Text(
                "View",
                style: TextStyle(
                    fontSize: FontSizes.FONT_SIZE_14, color: Color(0xff313846)),
              )),
            ),
          )
        ],
      ),
    );
  }
}
