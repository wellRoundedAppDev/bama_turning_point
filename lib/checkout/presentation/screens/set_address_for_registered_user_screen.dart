import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/checkout/data/models/get_customer_payment_address_response.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/check_out_cubit.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/states.dart';
import 'package:classic_eccomerce/checkout/presentation/screens/add_address_for_registered_users_screen.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetBillingAddressForRegisteredUserScreen extends StatelessWidget {
  const SetBillingAddressForRegisteredUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CheckOutCubit checkOutCubit = CheckOutCubit.get(context);
        List<Address>? userAddresses = checkOutCubit.userAddresses;
        Address? selectedUserAddress = checkOutCubit.selectedUserAddress;

        return SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: CustomAppBar.renderAppBar(
                    title: "Quick Checkout", showCartIcon: false),
                bottomNavigationBar: (state is GetUserAddressesLoadingState)
                    ? const SizedBox(
                        height: 0,
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        color: AppColors.NAV_BAR_COLOR,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 21, vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  text:
                                      AppLocalizations.of(context)!.add_address,
                                  color: const Color(0xff2EAF23),
                                  height: MediaQuery.of(context).size.height,
                                  textFontSize: FontSizes.FONT_SIZE_14,
                                  action: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: BlocProvider.value(
                                                value:
                                                    CheckOutCubit.get(context)
                                                      ..addAddressToOrderInput
                                                          .clear(),
                                                child:
                                                    const AddAddressForRegisteredUserScreen()),
                                            type: PageTransitionType
                                                .leftToRight));
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child:
                                    BlocConsumer<CheckOutCubit, CheckOutStates>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    return (state
                                            is SetExistingUserAddressLoadingState)
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : CustomButton(
                                            text: AppLocalizations.of(context)!
                                                .next,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            textColor: Colors.black.value,
                                            textFontSize:
                                                FontSizes.FONT_SIZE_14,
                                            color: AppColors.APP_MAIN_COLOR,
                                            action: () {
                                              CheckOutCubit.get(context)
                                                  .setExistingUserAddress(
                                                      CartCubit.get(context));
                                            },
                                          );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                body: (state is GetUserAddressesLoadingState)
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
                        : SingleChildScrollView(
                            child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .billing_address,
                                      maxLines: 1,
                                      textDirection: TextDirection.ltr,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: FontSizes.FONT_SIZE_20,
                                          color: Color(0xff313846),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 3,
                                      color: AppColors.APP_MAIN_COLOR,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                (selectedUserAddress == null)
                                    ? Container()
                                    : Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          color: const Color(0xffB6BBC6),
                                        )),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.full_name}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${selectedUserAddress?.firstname ?? ""} ${selectedUserAddress?.lastname ?? ""}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 16),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.address}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      selectedUserAddress
                                                              .address1 ??
                                                          "-",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // Container(
                                            //   height: 1,
                                            //   color: const Color(0xffB6BBC6),
                                            // ),
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.symmetric(
                                            //           vertical: 16.0,
                                            //           horizontal: 16),
                                            //   child: Row(
                                            //     children: [
                                            //       Text(
                                            //         "${AppLocalizations.of(context)!.postal_code}: ",
                                            //         style: const TextStyle(
                                            //             fontSize: FontSizes
                                            //                 .FONT_SIZE_14,
                                            //             fontWeight:
                                            //                 FontWeight.bold),
                                            //       ),
                                            //       Expanded(
                                            //         child: Text(
                                            //           selectedUserAddress
                                            //                   ?.postcode ??
                                            //               "",
                                            //           maxLines: 1,
                                            //           overflow: TextOverflow
                                            //               .ellipsis,
                                            //           style: const TextStyle(
                                            //               fontSize: FontSizes
                                            //                   .FONT_SIZE_14),
                                            //         ),
                                            //       )
                                            //     ],
                                            //   ),
                                            // ),
                                            Container(
                                              height: 1,
                                              color: const Color(0xffB6BBC6),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.city}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      selectedUserAddress
                                                              ?.city ??
                                                          "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.country}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      selectedUserAddress
                                                              ?.country ??
                                                          "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.region_or_state}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      selectedUserAddress
                                                              ?.zone ??
                                                          "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                checkOutCubit
                                                    .selectExistingUserAddress(
                                                        selectedUserAddress
                                                                ?.addressId ??
                                                            "");
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: (selectedUserAddress
                                                            ?.addressId ==
                                                        checkOutCubit
                                                            .selectedUserAddressId)
                                                    ? AppColors.APP_MAIN_COLOR
                                                    : const Color(0xffB6BBC6),
                                                child: Text(
                                                  (selectedUserAddress
                                                              ?.addressId ==
                                                          checkOutCubit
                                                              .selectedUserAddressId)
                                                      ? AppLocalizations.of(
                                                              context)!
                                                          .selected_address
                                                      : AppLocalizations.of(
                                                              context)!
                                                          .select_address,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: FontSizes
                                                          .FONT_SIZE_16),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                const SizedBox(
                                  height: 16,
                                ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      var address = userAddresses?[index];
                                      return Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          color: const Color(0xffB6BBC6),
                                        )),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.full_name}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${address?.firstname ?? ""} ${address?.lastname ?? ""}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 16),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.address}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      address?.address1 ?? "-",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // Container(
                                            //   height: 1,
                                            //   color: const Color(0xffB6BBC6),
                                            // ),
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.symmetric(
                                            //           vertical: 16.0,
                                            //           horizontal: 16),
                                            //   child: Row(
                                            //     children: [
                                            //       Text(
                                            //         "${AppLocalizations.of(context)!.postal_code}: ",
                                            //         style: const TextStyle(
                                            //             fontSize: FontSizes
                                            //                 .FONT_SIZE_14,
                                            //             fontWeight:
                                            //                 FontWeight.bold),
                                            //       ),
                                            //       Expanded(
                                            //         child: Text(
                                            //           address?.postcode ?? "",
                                            //           maxLines: 1,
                                            //           overflow: TextOverflow
                                            //               .ellipsis,
                                            //           style: const TextStyle(
                                            //               fontSize: FontSizes
                                            //                   .FONT_SIZE_14),
                                            //         ),
                                            //       )
                                            //     ],
                                            //   ),
                                            // ),
                                            Container(
                                              height: 1,
                                              color: const Color(0xffB6BBC6),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.city}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      address?.city ?? "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.country}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      address?.country ?? "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${AppLocalizations.of(context)!.region_or_state}: ",
                                                    style: const TextStyle(
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      address?.zone ?? "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_14),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                checkOutCubit
                                                    .selectExistingUserAddress(
                                                        address?.addressId ??
                                                            "");
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: (address?.addressId ==
                                                        checkOutCubit
                                                            .selectedUserAddressId)
                                                    ? AppColors.APP_MAIN_COLOR
                                                    : const Color(0xffB6BBC6),
                                                child: Text(
                                                  (address?.addressId ==
                                                          checkOutCubit
                                                              .selectedUserAddressId)
                                                      ? AppLocalizations.of(
                                                              context)!
                                                          .selected_address
                                                      : AppLocalizations.of(
                                                              context)!
                                                          .select_address,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: FontSizes
                                                          .FONT_SIZE_16),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 16,
                                        ),
                                    itemCount: userAddresses?.length ?? 0)
                              ],
                            ),
                          ))));
      },
    );
  }
}
