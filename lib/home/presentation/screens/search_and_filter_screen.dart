import 'package:classic_eccomerce/core/constants/strings/strings.dart';
import 'package:classic_eccomerce/home/data/models/search_response.dart';
import 'package:classic_eccomerce/home/presentation/cubits/search_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/search_cubit/states.dart';
import 'package:classic_eccomerce/home/presentation/widgets/filtered_product.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../cart/presentation/cubits/cart_cubit/cubit.dart';
import '../../../cart/presentation/cubits/cart_cubit/states.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_families.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../shared_components/search_app_bar_custom_input.dart';

class SearchAndFilterScreen extends StatelessWidget {
  const SearchAndFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.17,
          backgroundColor: AppColors.APP_BAR_COLOR_GRAD_ONE,
          leading: Container(),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.APP_BAR_COLOR_GRAD_ONE,
              AppColors.APP_BAR_COLOR_GRAD_TWO
            ], stops: [
              0.1,
              0.9
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            padding: const EdgeInsets.all(16),
            child: Builder(builder: (context) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(
                        ImagePaths.APP_LOGO_2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: BlocProvider.value(
                                        value: CartCubit.get(context),
                                        child: CartScreen(
                                          showBackButton: true,
                                        )),
                                    type: PageTransitionType.leftToRight));
                          },
                          child: BlocConsumer<CartCubit, CartStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              num itemsCount =
                                  CartCubit.get(context).numberOfItemsInCart;

                              return Stack(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    height: 30,
                                    width: 30,
                                  ),
                                  Center(
                                    child: Image.asset(
                                      IconPaths.CART,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  (itemsCount == 0)
                                      ? Container()
                                      : Positioned(
                                          bottom: 0,
                                          right: 1,
                                          child: Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: const BoxDecoration(
                                                color: AppColors.APP_MAIN_COLOR,
                                                shape: BoxShape.circle),
                                            child: Center(
                                              child: Text(
                                                itemsCount.toString(),
                                                style: const TextStyle(
                                                    fontSize:
                                                        FontSizes.FONT_SIZE_8,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                ],
                              );
                            },
                          )),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                      height: 45,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SearchAppBarCustomInput(
                            isFilled: true,
                            filledColor: AppColors.APP_BAR_SEARCH_FIELD,
                            hintText: "TYPE HERE",
                            autoFocus: true,
                            onChanged: (searchTerm) {
                              SearchCubit.get(context)
                                  .setSearchResults(searchTerm);
                            },
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            hintTextStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: FontSizes.FONT_SIZE_14,
                                fontFamily: FontFamilies.OPEN_SANS),
                            suffixIcon: const Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),

                ],
              );
            }),
          ),
        ),
        // endDrawer: const FilterDrawer(),
        body: BlocConsumer<SearchCubit, SearchStates>(
            listener: (context, state) {},
            builder: (context, state) {
              SearchCubit searchCubit = SearchCubit.get(context);
              List<SearchItem>? searchItems = searchCubit.searchItems;
              return Column(
                children: [
                  (state is SearchByTermLoadingState)
                      ? const LinearProgressIndicator()
                      : Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(16),
                              itemBuilder: (context, index) {
                                var searchItem = searchItems?[index];
                                return FilteredProduct(
                                  searchItem: searchItem,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 16,
                                  ),
                              itemCount: searchItems?.length ?? 0),
                        ),
                ],
              );

              //   Column(
              //   children: [
              //     SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.055,
              //       child: Row(
              //         children: [
              //           const SizedBox(
              //             width: 16,
              //           ),
              //           Expanded(
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                   child: DropdownSearch<String>(
              //                     asyncItems: (String filter) async {
              //                       // var res =
              //                       // searchAdsCubit.getJobCategories();
              //                       return ["ss"];
              //                     },
              //                     dropdownDecoratorProps:
              //                         const DropDownDecoratorProps(
              //                             dropdownSearchDecoration: InputDecoration(
              //                                 border: InputBorder.none,
              //                                 hintStyle: TextStyle(
              //                                   fontSize: FontSizes.FONT_SIZE_16,
              //                                   color: Color(0xff868686),
              //                                 ),
              //                                 hintText: "Sort")),
              //                     dropdownButtonProps: const DropdownButtonProps(
              //                         icon: Icon(
              //                       Icons.keyboard_arrow_down,
              //                       color: Color(0xff696C6E),
              //                     )),
              //                     popupProps: PopupProps.menu(
              //                         itemBuilder: (context, String sort, bool) {
              //                       return const Padding(
              //                         padding: EdgeInsets.all(16.0),
              //                         child: Text(
              //                           "Sort",
              //                           textAlign: TextAlign.right,
              //                           textDirection: TextDirection.rtl,
              //                         ),
              //                       );
              //                     }),
              //                     dropdownBuilder: (context, sort) {
              //                       return const Text("Sort",
              //                           style: TextStyle(
              //                             fontSize: FontSizes.FONT_SIZE_16,
              //                             color: Color(0xff868686),
              //                           ));
              //                     },
              //
              //                     // itemAsString: (String sort) {
              //                     // //  return governate.text ?? "-";
              //                     // },
              //                     // onChanged: (JobCategory? data) {
              //                     //   if (kDebugMode) {
              //                     //     print(data);
              //                     //   }
              //                     //   searchAdsCubit
              //                     //       .setSelectedJobCategoryFromDropDown(
              //                     //       data!);
              //                     // },
              //                   ),
              //                 ),
              //                 Container(
              //                   height: MediaQuery.of(context).size.height,
              //                   width: 1,
              //                   color: const Color(0xffDDDDDD),
              //                 )
              //               ],
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 8,
              //           ),
              //           Expanded(
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                   child: DropdownSearch<String>(
              //                     asyncItems: (String filter) async {
              //                       // var res =
              //                       // searchAdsCubit.getJobCategories();
              //                       return ["ss"];
              //                     },
              //                     dropdownDecoratorProps:
              //                         const DropDownDecoratorProps(
              //                             dropdownSearchDecoration: InputDecoration(
              //                                 border: InputBorder.none,
              //                                 hintStyle: TextStyle(
              //                                   fontSize: FontSizes.FONT_SIZE_16,
              //                                   color: Color(0xff868686),
              //                                 ),
              //                                 hintText: "Size")),
              //                     dropdownButtonProps: const DropdownButtonProps(
              //                         icon: Icon(
              //                       Icons.keyboard_arrow_down,
              //                       color: Color(0xff696C6E),
              //                     )),
              //                     popupProps: PopupProps.menu(
              //                         itemBuilder: (context, String sort, bool) {
              //                       return const Padding(
              //                         padding: EdgeInsets.all(16.0),
              //                         child: Text(
              //                           "Size",
              //                           textAlign: TextAlign.right,
              //                           textDirection: TextDirection.rtl,
              //                         ),
              //                       );
              //                     }),
              //                     dropdownBuilder: (context, sort) {
              //                       return const Text("Size",
              //                           style: TextStyle(
              //                             fontSize: FontSizes.FONT_SIZE_16,
              //                             color: Color(0xff868686),
              //                           ));
              //                     },
              //
              //                     // itemAsString: (String sort) {
              //                     // //  return governate.text ?? "-";
              //                     // },
              //                     // onChanged: (JobCategory? data) {
              //                     //   if (kDebugMode) {
              //                     //     print(data);
              //                     //   }
              //                     //   searchAdsCubit
              //                     //       .setSelectedJobCategoryFromDropDown(
              //                     //       data!);
              //                     // },
              //                   ),
              //                 ),
              //                 Container(
              //                   height: MediaQuery.of(context).size.height,
              //                   width: 1,
              //                   color: const Color(0xffDDDDDD),
              //                 )
              //               ],
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 8,
              //           ),
              //           Expanded(
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                   child: DropdownSearch<String>(
              //                     asyncItems: (String filter) async {
              //                       // var res =
              //                       // searchAdsCubit.getJobCategories();
              //                       return ["ss"];
              //                     },
              //                     dropdownDecoratorProps:
              //                         const DropDownDecoratorProps(
              //                             dropdownSearchDecoration: InputDecoration(
              //                                 border: InputBorder.none,
              //                                 hintStyle: TextStyle(
              //                                   fontSize: FontSizes.FONT_SIZE_16,
              //                                   color: Color(0xff868686),
              //                                 ),
              //                                 hintText: "Price")),
              //                     dropdownButtonProps: const DropdownButtonProps(
              //                         icon: Icon(
              //                       Icons.keyboard_arrow_down,
              //                       color: Color(0xff696C6E),
              //                     )),
              //                     popupProps: PopupProps.menu(
              //                         itemBuilder: (context, String sort, bool) {
              //                       return const Padding(
              //                         padding: EdgeInsets.all(16.0),
              //                         child: Text(
              //                           "Price",
              //                           textAlign: TextAlign.right,
              //                           textDirection: TextDirection.rtl,
              //                         ),
              //                       );
              //                     }),
              //                     dropdownBuilder: (context, sort) {
              //                       return const Text("Price",
              //                           style: TextStyle(
              //                             fontSize: FontSizes.FONT_SIZE_16,
              //                             color: Color(0xff868686),
              //                           ));
              //                     },
              //
              //                     // itemAsString: (String sort) {
              //                     // //  return governate.text ?? "-";
              //                     // },
              //                     // onChanged: (JobCategory? data) {
              //                     //   if (kDebugMode) {
              //                     //     print(data);
              //                     //   }
              //                     //   searchAdsCubit
              //                     //       .setSelectedJobCategoryFromDropDown(
              //                     //       data!);
              //                     // },
              //                   ),
              //                 ),
              //                 Container(
              //                   height: MediaQuery.of(context).size.height,
              //                   width: 1,
              //                   color: const Color(0xffDDDDDD),
              //                 )
              //               ],
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 8,
              //           ),
              //           Expanded(
              //               child: GestureDetector(
              //                 onTap: (){
              //                   Scaffold.of(context).openEndDrawer();
              //                 },
              //                 child: Row(
              //             children: [
              //                 Image.asset(
              //                   IconPaths.FILTER_ICON,
              //                   width: 15,
              //                   height: 15,
              //                 ),
              //                 const SizedBox(
              //                   width: 8,
              //                 ),
              //                 const Text(
              //                   "Filter",
              //                   style: TextStyle(
              //                       color: Color(0xff868686),
              //                       fontSize: FontSizes.FONT_SIZE_16),
              //                 )
              //             ],
              //           ),
              //               )),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width,
              //       height: 1,
              //       color: const Color(0xffDDDDDD),
              //     ),
              //     // Expanded(
              //     //   child: Padding(
              //     //     padding: const EdgeInsets.all(16.0),
              //     //     child: Column(
              //     //       crossAxisAlignment: CrossAxisAlignment.start,
              //     //       children: [
              //     //         const Text(
              //     //           "artificial trees",
              //     //           style: TextStyle(
              //     //               fontSize: FontSizes.FONT_SIZE_18,
              //     //               fontWeight: FontWeight.bold,
              //     //               color: Color(0xff015963)),
              //     //         ),
              //     //         const SizedBox(
              //     //           height: 8,
              //     //         ),
              //     //         Expanded(
              //     //           child: ListView.separated(
              //     //               shrinkWrap: true,
              //     //               itemBuilder: (context, index) =>
              //     //                   const FilteredProduct(),
              //     //               separatorBuilder: (context, index) => const SizedBox(
              //     //                     height: 16,
              //     //                   ),
              //     //               itemCount: 7),
              //     //         )
              //     //       ],
              //     //     ),
              //     //   ),
              //     // ),
              //   ],
              // );
            }),
      ),
    );
  }
}
