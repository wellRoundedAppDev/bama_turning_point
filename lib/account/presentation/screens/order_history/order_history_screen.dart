import 'package:classic_eccomerce/account/data/models/get_customer_orders_response.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:classic_eccomerce/account/presentation/screens/widgets/order_history_item.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/fonts/font_sizes.dart';
import '../../../../core/locales/l10n/app_localizations.dart';
import '../../../../shared_components/app_no_products.dart';
import '../../../../shared_components/custom_app_bar.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: 'Products Result',
      ),
      body: BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AccountCubit accountCubit = AccountCubit.get(context);
          List<PurchaseRequest?> customerOrders = accountCubit.customerOrders;
          ScrollController scrollController =
              accountCubit.ordersHistoryScrollController;
          return (state is GetFirstCustomerOrdersLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is GetFirstCustomerOrdersNetworkConnectionFailedState)
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: NoNetworkRefreshPage(refresh: () {
                        accountCubit.setFirstCustomerOrders();
                      }),
                    )
                  :customerOrders.isNotEmpty? RefreshIndicator(
                      onRefresh: () async {
                        await accountCubit.setFirstCustomerOrders();
                      },
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.orders_history,
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
                              ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var customerOrder = customerOrders?[index];
                                    return OrderHistoryItem(
                                      customerOrder: customerOrder,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 24,
                                      ),
                                  itemCount: customerOrders?.length ?? 0),
                              (state is AddMoreCustomerOrdersLoadingState)
                                  ? Container(
                                      padding: const EdgeInsets.all(16),
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : (state
                                          is AddMoreCustomerOrdersNetworkConnectionFailedState)
                                      ? NoNetworkRefreshPage(
                                          refresh: () {
                                            AccountCubit.get(context)
                                                .addMoreCustomerOrders();
                                          },
                                        )
                                      : Container()
                            ],
                          ),
                        ),
                      ),
                    ):AppNoProductsWidget(
            title:
            AppLocalizations.of(context)!.no_orders_history,
            subTitle: AppLocalizations.of(context)!
                .add_order,
          );
        },
      ),
    ));
  }
}
