import 'package:classic_eccomerce/account/presentation/screens/widgets/address_entry_item.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/checkout/data/models/get_customer_payment_address_response.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/check_out_cubit.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/states.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/fonts/font_sizes.dart';

class SelectAddressForRegisteredUsersScreen extends StatelessWidget {
  const SelectAddressForRegisteredUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<CheckOutCubit, CheckOutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CheckOutCubit checkOutCubit = CheckOutCubit.get(context);
          List<Address>? userAddresses = checkOutCubit.userAddresses;
          return (state is GetUserAddressesLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is GetUserAddressesNetworkConnectionFailedState)
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: NoNetworkRefreshPage(refresh: () {
                        checkOutCubit.setRegisteredUserPaymentAddresses();
                      }),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        await checkOutCubit.setRegisteredUserPaymentAddresses();
                      },
                      child: SingleChildScrollView(
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
                                  var address = userAddresses?[index];
                                  return InkWell(
                                    onTap: (){
                                      checkOutCubit.setExistingUserAddress(CartCubit.get(context));
                                    },
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(address?.addressId ?? "-"),
                                      ));
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 0,
                                    ),
                                itemCount: userAddresses?.length ?? 0)
                          ],
                        ),
                      )),
                    );
        },
      ),
    ));
  }
}
