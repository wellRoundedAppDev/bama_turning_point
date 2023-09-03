import 'package:classic_eccomerce/categories/presentation/widgets/filter_drawer.dart';
import 'package:classic_eccomerce/categories/presentation/widgets/filtered_product.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/fonts/font_sizes.dart';

class FilterCategoryScreen extends StatelessWidget {
  const FilterCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar.renderAppBar(title: "Filter Category"),
        endDrawer: const FilterDrawer(),
        body: Builder(
          builder: (context) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownSearch<String>(
                                asyncItems: (String filter) async {
                                  // var res =
                                  // searchAdsCubit.getJobCategories();
                                  return ["ss"];
                                },
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_16,
                                              color: Color(0xff868686),
                                            ),
                                            hintText: "Sort")),
                                dropdownButtonProps: const DropdownButtonProps(
                                    icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xff696C6E),
                                )),
                                popupProps: PopupProps.menu(
                                    itemBuilder: (context, String sort, bool) {
                                  return const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      "Sort",
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  );
                                }),
                                dropdownBuilder: (context, sort) {
                                  return const Text("Sort",
                                      style: TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        color: Color(0xff868686),
                                      ));
                                },

                                // itemAsString: (String sort) {
                                // //  return governate.text ?? "-";
                                // },
                                // onChanged: (JobCategory? data) {
                                //   if (kDebugMode) {
                                //     print(data);
                                //   }
                                //   searchAdsCubit
                                //       .setSelectedJobCategoryFromDropDown(
                                //       data!);
                                // },
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 1,
                              color: const Color(0xffDDDDDD),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownSearch<String>(
                                asyncItems: (String filter) async {
                                  // var res =
                                  // searchAdsCubit.getJobCategories();
                                  return ["ss"];
                                },
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_16,
                                              color: Color(0xff868686),
                                            ),
                                            hintText: "Size")),
                                dropdownButtonProps: const DropdownButtonProps(
                                    icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xff696C6E),
                                )),
                                popupProps: PopupProps.menu(
                                    itemBuilder: (context, String sort, bool) {
                                  return const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      "Size",
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  );
                                }),
                                dropdownBuilder: (context, sort) {
                                  return const Text("Size",
                                      style: TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        color: Color(0xff868686),
                                      ));
                                },

                                // itemAsString: (String sort) {
                                // //  return governate.text ?? "-";
                                // },
                                // onChanged: (JobCategory? data) {
                                //   if (kDebugMode) {
                                //     print(data);
                                //   }
                                //   searchAdsCubit
                                //       .setSelectedJobCategoryFromDropDown(
                                //       data!);
                                // },
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 1,
                              color: const Color(0xffDDDDDD),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownSearch<String>(
                                asyncItems: (String filter) async {
                                  // var res =
                                  // searchAdsCubit.getJobCategories();
                                  return ["ss"];
                                },
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_16,
                                              color: Color(0xff868686),
                                            ),
                                            hintText: "Price")),
                                dropdownButtonProps: const DropdownButtonProps(
                                    icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xff696C6E),
                                )),
                                popupProps: PopupProps.menu(
                                    itemBuilder: (context, String sort, bool) {
                                  return const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      "Price",
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  );
                                }),
                                dropdownBuilder: (context, sort) {
                                  return const Text("Price",
                                      style: TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        color: Color(0xff868686),
                                      ));
                                },

                                // itemAsString: (String sort) {
                                // //  return governate.text ?? "-";
                                // },
                                // onChanged: (JobCategory? data) {
                                //   if (kDebugMode) {
                                //     print(data);
                                //   }
                                //   searchAdsCubit
                                //       .setSelectedJobCategoryFromDropDown(
                                //       data!);
                                // },
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 1,
                              color: const Color(0xffDDDDDD),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Scaffold.of(context).openEndDrawer();
                            },
                            child: Row(
                        children: [
                            Image.asset(
                              IconPaths.FILTER_ICON,
                              width: 15,
                              height: 15,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "Filter",
                              style: TextStyle(
                                  color: Color(0xff868686),
                                  fontSize: FontSizes.FONT_SIZE_16),
                            )
                        ],
                      ),
                          )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: const Color(0xffDDDDDD),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "artificial trees",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff015963)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  const FilteredProduct(),
                              separatorBuilder: (context, index) => const SizedBox(
                                    height: 16,
                                  ),
                              itemCount: 7),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
