import 'package:classic_eccomerce/account/data/models/get_account_addresses_response.dart';
import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/fonts/font_sizes.dart';
import '../../../../core/data/models/get_countries_response.dart';
import '../../../../shared_components/custom_app_bar.dart';
import '../../../../shared_components/custom_button.dart';
import '../../../../shared_components/custom_input.dart';
import '../../../data/models/account_address.dart';
import '../../cubits/account_cubit/cubit.dart';
import '../../cubits/account_cubit/states.dart';

class EditAddressScreen extends StatelessWidget {
  AccountAddress? accountAddress;
  EditAddressScreen({super.key, required this.accountAddress});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          CustomAppBar.renderAppBar(title: "My ACCOUNT", showCartIcon: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(
            key: AccountCubit.get(context).accountAddressFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "EDIT ADDRESS",
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
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CustomInput(
                        hintText: "First Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your first name";
                          }
                        },
                        onSaved: (v) => AccountCubit.get(context)
                            .accountAddressInput
                            .firstName = v!,
                        initialValue: accountAddress?.firstname ?? "",
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      CustomInput(
                        hintText: "Last Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your last name";
                          }
                        },
                        onSaved: (v) => AccountCubit.get(context)
                            .accountAddressInput
                            .lastName = v!,
                        initialValue: accountAddress?.lastname ?? "",
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      CustomInput(
                        hintText: "Address 1",
                        validator: (value) {
                          if (value == null || value.length < 4) {
                            return 'Enter an address of at least 4 characters';
                          }
                        },
                        initialValue: accountAddress?.address1 ?? "",
                        onSaved: (v) => AccountCubit.get(context)
                            .accountAddressInput
                            .address = v!,
                      ),
                      // const SizedBox(
                      //   height: 21,
                      // ),
                      // CustomInput(
                      //   hintText: "Address 2",
                      // ),
                      const SizedBox(
                        height: 21,
                      ),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: const Color(0xff95989A))),
                      //   child: DropdownSearch<String>(
                      //     asyncItems: (String filter) async {
                      //       // var res =
                      //       // searchAdsCubit.getJobCategories();
                      //       return ["ss"];
                      //     },
                      //     dropdownDecoratorProps: const DropDownDecoratorProps(
                      //         dropdownSearchDecoration: InputDecoration(
                      //             border: InputBorder.none,
                      //             hintStyle: TextStyle(
                      //               fontSize: FontSizes.FONT_SIZE_16,
                      //               color: Color(0xff878787),
                      //             ),
                      //             hintText: "City")),
                      //     dropdownButtonProps: const DropdownButtonProps(
                      //         icon: Icon(
                      //       Icons.keyboard_arrow_down,
                      //       color: Color(0xff696C6E),
                      //     )),
                      //     popupProps: PopupProps.menu(
                      //         itemBuilder: (context, String sort, bool) {
                      //       return const Padding(
                      //         padding: EdgeInsets.all(16.0),
                      //         child: Text(
                      //           "City",
                      //           style: TextStyle(
                      //               fontSize: FontSizes.FONT_SIZE_16,
                      //               color: Color(0xff878787)),
                      //         ),
                      //       );
                      //     }),
                      //     dropdownBuilder: (context, sort) {
                      //       return const Text(
                      //         "City",
                      //         style: TextStyle(
                      //             fontSize: FontSizes.FONT_SIZE_16,
                      //             color: Color(0xff878787)),
                      //       );
                      //     },
                      //   ),
                      // ),
                      CustomInput(
                        hintText: "City",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your city";
                          }
                        },
                        onSaved: (v) => AccountCubit.get(context)
                            .accountAddressInput
                            .city = v!,
                        initialValue: accountAddress?.city ?? "",
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      CustomInput(
                        hintText: "Postal Code",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your postal code";
                          }
                        },
                        textInputType: TextInputType.number,
                        onSaved: (v) => AccountCubit.get(context)
                            .accountAddressInput
                            .postalCode = v!,
                        initialValue: accountAddress?.postcode ?? "",
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      BlocConsumer<AccountCubit, AccountStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xff95989A))),
                            child: DropdownSearch<Country>(
                              asyncItems: (String filter) async {
                                // var res =
                                // searchAdsCubit.getJobCategories();
                                return AccountCubit.get(context).getCountries();
                              },
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            fontSize: FontSizes.FONT_SIZE_16,
                                            color: Color(0xff878787),
                                          ),
                                          hintText: "Country")),
                              dropdownButtonProps: const DropdownButtonProps(
                                  icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff696C6E),
                              )),
                              popupProps: PopupProps.menu(itemBuilder:
                                  (context, Country country, bool) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    country.name ?? "-",
                                    style: const TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        color: Color(0xff878787)),
                                  ),
                                );
                              }),
                              onChanged: (Country? country) {
                                AccountCubit.get(context)
                                    .setAccountAddressCountry(country!);
                              },
                              validator: (Country? country) {
                                if (AccountCubit.get(context)
                                        .accountAddressInput
                                        .country ==
                                    null) {
                                  return "Select your country";
                                }
                              },
                              dropdownBuilder: (context, country) {
                                return Text(
                                  AccountCubit.get(context)
                                          .accountAddressInput
                                          .country
                                          ?.name ??
                                      "Country",
                                  style: const TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_16,
                                      color: Color(0xff878787)),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      BlocConsumer<AccountCubit, AccountStates>(
                        listener: (context, child) {},
                        builder: (context, child) {
                          return Container(
                            padding: const EdgeInsets.only(left: 16, right: 8),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xff95989A))),
                            child: DropdownSearch<Region>(
                              asyncItems: (String filter) async {
                                // var res =
                                // searchAdsCubit.getJobCategories();
                                return await AccountCubit.get(context)
                                    .getRegions();
                              },
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            fontSize: FontSizes.FONT_SIZE_16,
                                            color: Color(0xff878787),
                                          ),
                                          hintText: "Region / State")),
                              dropdownButtonProps: const DropdownButtonProps(
                                  icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff696C6E),
                              )),
                              popupProps: PopupProps.menu(
                                  itemBuilder: (context, Region region, bool) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    region.name ?? "-",
                                    style: const TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        color: Color(0xff878787)),
                                  ),
                                );
                              }),
                              dropdownBuilder: (context, region) {
                                return Text(
                                  AccountCubit.get(context)
                                          .accountAddressInput
                                          .region
                                          ?.name ??
                                      "Region / State",
                                  style: const TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_16,
                                      color: Color(0xff878787)),
                                );
                              },
                              onChanged: (Region? region) {
                                AccountCubit.get(context)
                                    .setAccountAddressRegion(region!);
                              },
                              validator: (Region? region) {
                                if (AccountCubit.get(context)
                                        .accountAddressInput
                                        .region ==
                                    null) {
                                  return "Select your region";
                                }
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Default Address",
                            style: TextStyle(
                                color: Color(0xff747982),
                                fontSize: FontSizes.FONT_SIZE_16),
                          ),
                          BlocConsumer<AccountCubit, AccountStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                      value: true,
                                      groupValue: AccountCubit.get(context)
                                          .accountAddressInput
                                          .isDefaultAddress,
                                      onChanged: (check) {
                                        AccountCubit.get(context)
                                            .setAccountDefaultAddress(check!);
                                      },
                                      title: const Text(
                                        "Yes",
                                        style: TextStyle(
                                            fontSize: FontSizes.FONT_SIZE_16,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      value: false,
                                      groupValue: AccountCubit.get(context)
                                          .accountAddressInput
                                          .isDefaultAddress,
                                      onChanged: (check) {
                                        AccountCubit.get(context)
                                            .setAccountDefaultAddress(check!);
                                      },
                                      title: const Text(
                                        "No",
                                        style: TextStyle(
                                            fontSize: FontSizes.FONT_SIZE_16,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      BlocConsumer<AccountCubit, AccountStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return CustomButton(
                            text: "Save",
                            isLoading: state is EditAddressLoadingState,
                            action: () {
                              AccountCubit.get(context).editAddressInAccount(
                                  (int.tryParse(
                                          accountAddress?.addressId ?? "")) ??
                                      0);
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
