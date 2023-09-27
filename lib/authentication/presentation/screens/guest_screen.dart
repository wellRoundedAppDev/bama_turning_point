import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/core/data/models/get_countries_response.dart';
import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_input.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: AuthCubit.get(context).guestFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(
                  hintText: "Phone Number",
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.length != 9) {
                      return 'Enter a valid phone number';
                    }
                  },
                  onSaved: (v) =>
                      AuthCubit.get(context).guestFormInput.phoneNumber = v,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff95989A))),
                  child: DropdownSearch<String>(
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff878787),
                            ),
                            hintText: "Male")),
                    dropdownButtonProps: const DropdownButtonProps(
                        icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff696C6E),
                    )),
                    popupProps: PopupProps.menu(
                        itemBuilder: (context, String item, bool) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff878787)),
                        ),
                      );
                    }),
                    dropdownBuilder: (context, item) {
                      return Text(
                        item ?? "Male",
                        style: const TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            color: Color(0xff878787)),
                      );
                    },
                    items: const ["Male", "Female"],
                    onChanged: (String? gender) {
                      AuthCubit.get(context).guestFormInput.gender = gender;
                    },
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "First Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your first name';
                    }
                  },
                  onSaved: (v) =>
                      AuthCubit.get(context).guestFormInput.firstName = v,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Last Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your last name';
                    }
                  },
                  onSaved: (v) =>
                      AuthCubit.get(context).guestFormInput.lastName = v,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Billing Address",
                  style: TextStyle(
                      fontSize: FontSizes.FONT_SIZE_16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff313846)),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Address",
                  validator: (value) {
                    if (value == null || value.length < 4) {
                      return 'Enter an address of at least 3 characters';
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
                  hintText: "City",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your city';
                    }
                  },
                  onSaved: (v) =>
                      AuthCubit.get(context).guestFormInput.cityName = v,
                ),

                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Postal Code",
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your postal code';
                    }
                  },
                  onSaved: (v) =>
                      AuthCubit.get(context).guestFormInput.postalCode = v,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff95989A))),
                  child: DropdownSearch<Country>(
                    asyncItems: (String filter) async {
                      // var res =
                      return await AuthCubit.get(context).getCountries();
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
                    dropdownBuilder: (context, country) {
                      return Text(
                        country?.name ?? "Country",
                        style: const TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            color: Color(0xff878787)),
                      );
                    },
                    onChanged: (Country? country) {
                      AuthCubit.get(context).setCountryOfGuest(country!);
                    },
                    validator: (Country? country) {
                      if (AuthCubit.get(context).guestFormInput.country ==
                          null) {
                        return "Select your country";
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff95989A))),
                  child: DropdownSearch<Region>(
                    asyncItems: (String filter) async {
                      // var res =
                      // searchAdsCubit.getJobCategories();
                      return await AuthCubit.get(context).getRegionOfGuest();
                    },
                    dropdownDecoratorProps: const DropDownDecoratorProps(
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
                        region?.name ?? "Region / State",
                        style: const TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            color: Color(0xff878787)),
                      );
                    },
                    onChanged: (Region? region) {
                      AuthCubit.get(context).setRegionOfGuest(region!);
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocConsumer<AuthCubit, AuthStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Checkbox(
                            value: AuthCubit.get(context)
                                .isGuestConfirmedBillingAndAddressMatch,
                            onChanged: (check) {
                              AuthCubit.get(context)
                                  .setIsGuestConfirmedBillingAndAddressMatchState(
                                      check!);
                            });
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Expanded(
                      child: Text(
                        "My delivery and billing addresses are the same.",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: Color(0xff747982)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 21,
                ),
                BlocConsumer<AuthCubit,AuthStates>(
                  listener: (context, state){},
                  builder: (context,state){
                   return CustomButton(
                        text: "Next",
                        isLoading: state is CreatingGuestUserLoadingState,
                        action: () {
                          AuthCubit.get(context)
                              .createGuestUser(CartCubit.get(context));
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
