import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/check_out_cubit.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/states.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/data/models/get_countries_response.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/fonts/font_sizes.dart';
import '../../../../core/data/models/get_regions_response.dart';
import '../../../../shared_components/custom_app_bar.dart';
import '../../../../shared_components/custom_button.dart';
import '../../../../shared_components/custom_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAddressForRegisteredUserScreen extends StatelessWidget {
  const AddAddressForRegisteredUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar:
          CustomAppBar.renderAppBar(title: "My ACCOUNT", showCartIcon: false),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: CheckOutCubit.get(context).addAddressToOrderFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      AppLocalizations.of(context)!.add_address,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          CustomInput(
                            label: AppLocalizations.of(context)!.first_name,
                            hintText: AppLocalizations.of(context)!.first_name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.enter_your_first_name;
                              }
                            },
                            onSaved: (v) => CheckOutCubit.get(context)
                                .addAddressToOrderInput
                                .firstName = v!,
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          CustomInput(
                            label: AppLocalizations.of(context)!.family_name,
                            hintText: AppLocalizations.of(context)!.family_name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.enter_your_family_name;
                              }
                            },
                            onSaved: (v) => CheckOutCubit.get(context)
                                .addAddressToOrderInput
                                .lastName = v!,
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          CustomInput(
                            label: AppLocalizations.of(context)!.address,
                            hintText: AppLocalizations.of(context)!.address,
                            validator: (value) {
                              if (value == null || value.length < 4) {
                                return AppLocalizations.of(context)!.enter_an_address_of_at_least_four_characters;
                              }
                            },
                            onSaved: (v) => CheckOutCubit.get(context)
                                .addAddressToOrderInput
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
                            label: AppLocalizations.of(context)!.city,
                            hintText: AppLocalizations.of(context)!.city,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.enter_your_city;
                              }
                            },
                            onSaved: (v) => CheckOutCubit.get(context)
                                .addAddressToOrderInput
                                .city = v!,
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          CustomInput(
                            label: AppLocalizations.of(context)!.postal_code,
                            hintText: AppLocalizations.of(context)!.postal_code,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.enter_your_postal_code;
                              }
                            },
                            textInputType: TextInputType.number,
                            onSaved: (v) => CheckOutCubit.get(context)
                                .addAddressToOrderInput
                                .postalCode = v!,
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xff95989A))),
                            child: DropdownSearch<Country>(
                              asyncItems: (String filter) async {
                                // var res =
                                // searchAdsCubit.getJobCategories();
                                return CheckOutCubit.get(context).getCountries();
                              },

                              dropdownDecoratorProps:  DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      label: Text(AppLocalizations.of(context)!.country,
                                        style: const TextStyle(
                                          fontSize: FontSizes.FONT_SIZE_16,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      hintStyle: const TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        color: Color(0xff878787),
                                      ),
                                      hintText: AppLocalizations.of(context)!.country)),
                              dropdownButtonProps: const DropdownButtonProps(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xff696C6E),
                                  )),
                              popupProps: PopupProps.menu(
                                  itemBuilder: (context, Country country, bool) {
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
                                CheckOutCubit.get(context)
                                    .setAddAddressCountry(country!);
                              },
                              validator: (Country? country) {
                                if (country  ==
                                    null) {
                                  return AppLocalizations.of(context)!.select_your_country;
                                }
                              },
                              dropdownBuilder: (context, country) {
                                return Text(
                                  country?.name ?? AppLocalizations.of(context)!.country,
                                  style: const TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_16,
                                      color: Color(0xff878787)),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          BlocConsumer<CheckOutCubit, CheckOutStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return Container(
                                padding: const EdgeInsets.only(left: 16, right: 8),
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: const Color(0xff95989A))),
                                child: DropdownSearch<Region>(
                                  asyncItems: (String filter) async {
                                    // var res =
                                    // searchAdsCubit.getJobCategories();
                                    return await CheckOutCubit.get(context)
                                        .getRegions();
                                  },
                                  dropdownDecoratorProps:
                                   DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          border: InputBorder.none,
                                          label: Text(AppLocalizations.of(context)!.region_or_state,
                                            style: const TextStyle(
                                                fontSize: FontSizes.FONT_SIZE_16,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                            fontSize: FontSizes.FONT_SIZE_16,
                                            color: Color(0xff878787),
                                          ),
                                          hintText: AppLocalizations.of(context)!.region_or_state)),
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
                                      CheckOutCubit.get(context)
                                          .addAddressToOrderInput
                                          .region
                                          ?.name ??
                                          AppLocalizations.of(context)!.region_or_state,
                                      style: const TextStyle(
                                          fontSize: FontSizes.FONT_SIZE_16,
                                          color: Color(0xff878787)),
                                    );
                                  },
                                  onChanged: (Region? region) {
                                    CheckOutCubit.get(context)
                                        .setAddAddressRegion(region!);
                                  },
                                  validator: (Region? region) {
                                    if (CheckOutCubit.get(context)
                                        .addAddressToOrderInput
                                        .region ==
                                        null) {
                                      return AppLocalizations.of(context)!.select_your_region_or_state;
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                          // const SizedBox(
                          //   height: 16,
                          // ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     const Text(
                          //       "Default Address",
                          //       style: TextStyle(
                          //           color: Color(0xff747982),
                          //           fontSize: FontSizes.FONT_SIZE_16),
                          //     ),
                          //     // BlocConsumer<CheckOutCubit, CheckOutStates>(
                          //     //   listener: (context, state) {},
                          //     //   builder: (context, state) {
                          //     //     return Row(
                          //     //       children: [
                          //     //         Expanded(
                          //     //           child: RadioListTile(
                          //     //             value: true,
                          //     //             groupValue: CheckOutCubit.get(context)
                          //     //                 .addAddressToOrderInput
                          //     //                 .isDefaultAddress,
                          //     //             onChanged: (check) {
                          //     //               CheckOutCubit.get(context)
                          //     //                   .setAccountDefaultAddress(check!);
                          //     //             },
                          //     //             title: const Text(
                          //     //               "Yes",
                          //     //               style: TextStyle(
                          //     //                   fontSize: FontSizes.FONT_SIZE_16,
                          //     //                   fontWeight: FontWeight.w300),
                          //     //             ),
                          //     //           ),
                          //     //         ),
                          //     //         Expanded(
                          //     //           child: RadioListTile(
                          //     //             value: false,
                          //     //             groupValue: CheckOutCubit.get(context)
                          //     //                 .addAddressToOrderInput
                          //     //                 .isDefaultAddress,
                          //     //             onChanged: (check) {
                          //     //               CheckOutCubit.get(context)
                          //     //                   .setAccountDefaultAddress(check!);
                          //     //             },
                          //     //             title: const Text(
                          //     //               "No",
                          //     //               style: TextStyle(
                          //     //                   fontSize: FontSizes.FONT_SIZE_16,
                          //     //                   fontWeight: FontWeight.w300),
                          //     //             ),
                          //     //           ),
                          //     //         ),
                          //     //       ],
                          //     //     );
                          //     //   },
                          //     // )
                          //   ],
                          // ),
                          const SizedBox(
                            height: 16,
                          ),
                          BlocConsumer<CheckOutCubit, CheckOutStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return CustomButton(
                                text: AppLocalizations.of(context)!.save,
                                isLoading: state is AddAddressToOrderLoadingState,
                                action: () {
                                  CheckOutCubit.get(context).addAddressToOrder();
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
