import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/check_out_cubit.dart';
import 'package:classic_eccomerce/core/data/models/get_countries_response.dart';
import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../shared_components/custom_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: AuthCubit.get(context).guestFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipOval(
                      child: Image.asset(
                    ImagePaths.APP_LOGO,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
                  )),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  label: AppLocalizations.of(context)!.phone_number,
                  hintText: AppLocalizations.of(context)!.phone_number,
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (value == null ||
                        value.length < 8 ||
                        value.length > 13) {
                      return AppLocalizations.of(context)!
                          .enter_a_valid_phone_number;
                    }
                  },
                  onSaved: (v) =>
                      AuthCubit.get(context).guestFormInput.phoneNumber = v,
                ),
                // const SizedBox(
                //   height: 16,
                // ),
                // Container(
                //   padding: const EdgeInsets.only(left: 16, right: 8),
                //   decoration: BoxDecoration(
                //       border: Border.all(color: const Color(0xff95989A))),
                //   child: DropdownSearch<String>(
                //     dropdownDecoratorProps: const DropDownDecoratorProps(
                //         dropdownSearchDecoration: InputDecoration(
                //             border: InputBorder.none,
                //             hintStyle: TextStyle(
                //               fontSize: FontSizes.FONT_SIZE_16,
                //               color: Color(0xff878787),
                //             ),
                //             hintText: "Male")),
                //     dropdownButtonProps: const DropdownButtonProps(
                //         icon: Icon(
                //       Icons.keyboard_arrow_down,
                //       color: Color(0xff696C6E),
                //     )),
                //     popupProps: PopupProps.menu(
                //         itemBuilder: (context, String item, bool) {
                //       return Padding(
                //         padding: const EdgeInsets.all(16.0),
                //         child: Text(
                //           item,
                //           style: const TextStyle(
                //               fontSize: FontSizes.FONT_SIZE_16,
                //               color: Color(0xff878787)),
                //         ),
                //       );
                //     }),
                //     dropdownBuilder: (context, item) {
                //       return Text(
                //         item ?? "Male",
                //         style: const TextStyle(
                //             fontSize: FontSizes.FONT_SIZE_16,
                //             color: Color(0xff878787)),
                //       );
                //     },
                //     items: const ["Male", "Female"],
                //     onChanged: (String? gender) {
                //       AuthCubit.get(context).guestFormInput.gender = gender;
                //     },
                //   ),
                // ),

                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  label: AppLocalizations.of(context)!.full_name,
                  hintText: AppLocalizations.of(context)!.full_name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.enter_full_name;
                    }
                    if ((value?.split(" ")?.length ?? 0) == 1 ||
                        value?.split(" ")?.last?.isEmpty == true ||
                        value?.split(" ")?.last == " ") {
                      return AppLocalizations.of(context)!
                          .enter_your_name;
                    }
                  },
                  onSaved: (v) {
                    AuthCubit.get(context).guestFormInput.firstName =
                        v?.split(" ")?.first;
                    if ((v?.split(" ")?.length ?? 0) > 1) {
                      AuthCubit.get(context).guestFormInput.lastName =
                          v?.split(" ")?.last;
                    }
                  },
                ),
                // CustomInput(
                //   label: AppLocalizations.of(context)!.first_name,
                //   hintText: AppLocalizations.of(context)!.first_name,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return AppLocalizations.of(context)!
                //           .enter_your_first_name;
                //     }
                //   },
                //   onSaved: (v) =>
                //       AuthCubit.get(context).guestFormInput.firstName = v,
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // CustomInput(
                //   label: AppLocalizations.of(context)!.family_name,
                //   hintText: AppLocalizations.of(context)!.family_name,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return AppLocalizations.of(context)!
                //           .enter_your_family_name;
                //     }
                //   },
                //   onSaved: (v) =>
                //       AuthCubit.get(context).guestFormInput.lastName = v,
                // ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  AppLocalizations.of(context)!.billing_address,
                  style: const TextStyle(
                      fontSize: FontSizes.FONT_SIZE_16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff313846)),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  label: AppLocalizations.of(context)!.address,
                  hintText: AppLocalizations.of(context)!.address,
                  validator: (value) {
                    if (value == null || value.length < 4) {
                      return AppLocalizations.of(context)!
                          .enter_an_address_of_at_least_four_characters;
                    }
                  },
                  onSaved: (v) =>
                      AuthCubit.get(context).guestFormInput.address = v,
                  textInputType: TextInputType.streetAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                // Container(
                //   padding: const EdgeInsets.only(left: 16, right: 8),
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
                  onSaved: (v) =>
                      AuthCubit.get(context).guestFormInput.cityName = v,
                ),

                // const SizedBox(
                //   height: 16,
                // ),
                // CustomInput(
                //   label: AppLocalizations.of(context)!.postal_code,
                //   hintText: AppLocalizations.of(context)!.postal_code,
                //   textInputType: TextInputType.number,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return AppLocalizations.of(context)!
                //           .enter_your_postal_code;
                //     }
                //   },
                //   onSaved: (v) =>
                //       AuthCubit.get(context).guestFormInput.postalCode = v,
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // BlocConsumer<AuthCubit, AuthStates>(
                //   listener: (context, state) {},
                //   builder: (context, state) {
                //     return Container(
                //       padding: const EdgeInsets.only(left: 16, right: 8),
                //       decoration: BoxDecoration(
                //           border: Border.all(color: const Color(0xff95989A))),
                //       child: DropdownSearch<Country>(
                //         asyncItems: (String filter) async {
                //           // var res =
                //           return await AuthCubit.get(context).getCountries();
                //         },
                //         dropdownDecoratorProps: DropDownDecoratorProps(
                //             dropdownSearchDecoration: InputDecoration(
                //                 label: Text(
                //                   AppLocalizations.of(context)!.country,
                //                   style: const TextStyle(
                //                       fontSize: FontSizes.FONT_SIZE_16,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //                 border: InputBorder.none,
                //                 hintStyle: const TextStyle(
                //                   fontSize: FontSizes.FONT_SIZE_16,
                //                   color: Color(0xff878787),
                //                 ),
                //                 hintText:
                //                     AppLocalizations.of(context)!.country)),
                //         dropdownButtonProps: const DropdownButtonProps(
                //             icon: Icon(
                //           Icons.keyboard_arrow_down,
                //           color: Color(0xff696C6E),
                //         )),
                //         popupProps: PopupProps.menu(
                //             itemBuilder: (context, Country country, bool) {
                //           return Padding(
                //             padding: const EdgeInsets.all(16.0),
                //             child: Text(
                //               country.name ?? "-",
                //               style: const TextStyle(
                //                   fontSize: FontSizes.FONT_SIZE_16,
                //                   color: Color(0xff878787)),
                //             ),
                //           );
                //         }),
                //         dropdownBuilder: (context, country) {
                //           return Text(
                //             AuthCubit.get(context)
                //                     .guestFormInput
                //                     .country
                //                     ?.name ??
                //                 AppLocalizations.of(context)!.country,
                //             style: const TextStyle(
                //                 fontSize: FontSizes.FONT_SIZE_16,
                //                 color: Color(0xff878787)),
                //           );
                //         },
                //
                //         onChanged: (Country? country) {
                //           AuthCubit.get(context).setCountryOfGuest(country!);
                //         },
                //         validator: (Country? country) {
                //           if (AuthCubit.get(context).guestFormInput.country ==
                //               null) {
                //             return AppLocalizations.of(context)!
                //                 .select_your_country;
                //           }
                //         },
                //       ),
                //     );
                //   },
                // ),
                const SizedBox(
                  height: 16,
                ),
                BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff95989A))),
                      child: DropdownSearch<Region>(
                        asyncItems: (String filter) async {
                          // var res =
                          // searchAdsCubit.getJobCategories();
                          return await AuthCubit.get(context)
                              .getRegionOfGuest();
                        },
                        dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text(
                                  AppLocalizations.of(context)!.region_or_state,
                                  style: const TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_16,
                                      fontWeight: FontWeight.bold),
                                ),
                                hintStyle: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_16,
                                  color: Color(0xff878787),
                                ),
                                hintText: AppLocalizations.of(context)!
                                    .region_or_state)),
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
                            AuthCubit.get(context)
                                    .guestFormInput
                                    .region
                                    ?.name ??
                                AppLocalizations.of(context)!.region_or_state,
                            style: const TextStyle(
                                fontSize: FontSizes.FONT_SIZE_16,
                                color: Color(0xff878787)),
                          );
                        },
                        onChanged: (Region? region) {
                          AuthCubit.get(context).setRegionOfGuest(region!);
                        },
                        validator: (Region? region) {
                          if (AuthCubit.get(context).guestFormInput.region ==
                              null) {
                            return AppLocalizations.of(context)!
                                .select_your_region_or_state;
                          }
                        },
                      ),
                    );
                  },
                ),
                // const SizedBox(
                //   height: 8,
                // ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     BlocConsumer<AuthCubit, AuthStates>(
                //       listener: (context, state) {},
                //       builder: (context, state) {
                //         return Checkbox(
                //             value: AuthCubit.get(context)
                //                 .isGuestConfirmedBillingAndAddressMatch,
                //             onChanged: (check) {
                //               AuthCubit.get(context)
                //                   .setIsGuestConfirmedBillingAndAddressMatchState(
                //                       check!);
                //             });
                //       },
                //     ),
                //     const SizedBox(
                //       width: 8,
                //     ),
                //     const Expanded(
                //       child: Text(
                //         "My delivery and billing addresses are the same.",
                //         style: TextStyle(
                //             fontSize: FontSizes.FONT_SIZE_14,
                //             color: Color(0xff747982)),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 21,
                ),
                BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return CustomButton(
                        text: AppLocalizations.of(context)!.next,
                        isLoading: state is CreatingGuestUserLoadingState,
                        action: () {
                          AuthCubit.get(context).createGuestUser(
                              CartCubit.get(context),
                              CheckOutCubit.get(context));
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
