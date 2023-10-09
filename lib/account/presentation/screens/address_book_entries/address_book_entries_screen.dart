import 'package:classic_eccomerce/account/data/models/get_account_addresses_response.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:classic_eccomerce/account/presentation/screens/widgets/address_entry_item.dart';
import 'package:classic_eccomerce/checkout/data/models/get_customer_payment_address_response.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/constants/fonts/font_sizes.dart';
import 'add_address_screen.dart';
import 'edit_address_screen.dart';

class AddressBookEntriesScreen extends StatelessWidget {
  const AddressBookEntriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const AddAddressScreen(),
                  type: PageTransitionType.leftToRight));
        },
        child: Container(
          height: 60,
          color: const Color(0xffF2F1F1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
            child: Row(
              children: [
                const Text(
                  "ADD ADDRESS",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_16,
                      color: Color(0xff313846)),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      appBar:
          CustomAppBar.renderAppBar(title: "My ACCOUNT", showCartIcon: false),
      body: BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AccountCubit accountCubit = AccountCubit.get(context);
          List<AccountAddress>? accountAddresses =
              accountCubit.accountAddresses;
          return (state is GetAccountAddressesLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is GetAccountAddressesNetworkConnectionFailedState)
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: NoNetworkRefreshPage(refresh: () {
                        accountCubit.setAccountAddresses();
                      }),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "ADDRESS BOOK ENTRIES",
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
                            color: const Color(0xff015963),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var address = accountAddresses?[index];
                                return AddressEntryItem(address: address);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 8,
                                  ),
                              itemCount: accountAddresses?.length ?? 0)
                        ],
                      ),
                    ));
        },
      ),
    ));
  }
}
