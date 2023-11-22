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
                    const Text(
                      "ADD ADDRESS",
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
                            hintText: "First Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your first name";
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
                            hintText: "Last Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your last name";
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
                            hintText: "Address 1",
                            validator: (value) {
                              if (value == null || value.length < 4) {
                                return 'Enter an address of at least 4 characters';
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
                            hintText: "City",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your city";
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
                            hintText: "Postal Code",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your postal code";
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
                              dropdownDecoratorProps: const DropDownDecoratorProps(
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
                                  return "Select your country";
                                }
                              },
                              dropdownBuilder: (context, country) {
                                return Text(
                                  country?.name ?? "Country",
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
                                      CheckOutCubit.get(context)
                                          .addAddressToOrderInput
                                          .region
                                          ?.name ??
                                          "Region / State",
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
                                      return "Select your region";
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
                                text: "Save",
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
