import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/home_filter/presentaion/screen/view_products_filter.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cubits/filter_cubit/filter_cubit.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: BlocProvider(
      create: (context) => FilterCubit()..init(),
      child: BlocConsumer<FilterCubit, FilterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          FilterCubit filterCubit = FilterCubit.get(context);
          var groups = filterCubit.groups;

          var size = filterCubit.size;
          var colors = filterCubit.colors;

          return state is FetchingFilterLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  bottomNavigationBar: SizedBox(
                    height: 50,
                    child: Column(
                      children: [
                        Container(
                          height: 2,
                          color: const Color(0xffE5E5E5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () => filterCubit.deleteValue(),
                                  child: Image.asset(
                                    IconPaths.TRASH,
                                    width: 22,
                                    height: 22,
                                  )),
                              const SizedBox(
                                width: 16,
                              ),
                              SizedBox(
                                width: 80,
                                height: 30,
                                child: state is CreateFilterLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : CustomButton(
                                        text: "Done",
                                        action: () async {
                                          await filterCubit
                                              .createFilter(context);
                                          if (filterCubit.result!.isNotEmpty) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewProductsFilterScreen(
                                                          filterCubit.isCompany,filterCubit),
                                                ));
                                          }
                                        }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, right: 16, left: 16, bottom: 10),
                          child: Row(
                            children: [
                              Center(
                                child: Text(
                                  AppLocalizations.of(context)!.filter,
                                  style: const TextStyle(
                                      fontSize: FontSizes.FONT_SIZE_18,
                                      color: AppColors.GREY_LABEL_COLOR_1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).closeEndDrawer();
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Color(0xff697285),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          color: const Color(0xffE5E5E5),
                        ),
                        const SizedBox(
                          height: 24,
                        ),

                        Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text: AppLocalizations.of(context)!.vendor,
                                      action: () {
                                        filterCubit
                                            .radioFunctionIsCompany(false);
                                      },
                                      borderRadius: 12,
                                      color: filterCubit.isCompany
                                          ? Colors.black12
                                          : AppColors.APP_MAIN_COLOR,
                                      textColor: filterCubit.isCompany
                                          ? 0xff153B87
                                          : 0xffffffff,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      text: AppLocalizations.of(context)!.company,
                                      action: () {
                                        filterCubit
                                            .radioFunctionIsCompany(true);
                                      },
                                      borderRadius: 12,
                                      color: filterCubit.isCompany == false
                                          ? Colors.black12
                                          : AppColors.APP_MAIN_COLOR,
                                      textColor: filterCubit.isCompany == false
                                          ? 0xff153B87
                                          : 0xffffffff,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),

                        // CustomInput()

                        //group
                        ExpansionTile(
                          title:  Text(
                            AppLocalizations.of(context)!.group,
                            style: const TextStyle(
                                fontSize: FontSizes.FONT_SIZE_16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff313846)),
                          ),
                          trailing: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xff313846),
                          ),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  ListView.builder(
                                      itemBuilder: (context, index) =>
                                          RadioListTile(
                                            groupValue: filterCubit
                                                .filterFormInput.groupId,
                                            activeColor:
                                                const Color(0xff878787),
                                            value: filterCubit.groups[index].id,
                                            onChanged: (isCheck) => filterCubit
                                                .radioFunctionGroup(isCheck),
                                            title: Text(
                                              groups[index].groupName ?? '',
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_16,
                                                  color: Color(0xff878787)),
                                            ),
                                          ),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: groups.length),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 2,
                          color: const Color(0xffE5E5E5),
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        //price
                        ExpansionTile(
                          title: Text(
                            AppLocalizations.of(context)!.price,
                            style: const TextStyle(
                                fontSize: FontSizes.FONT_SIZE_16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff313846)),
                          ),
                          trailing: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xff313846),
                          ),
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${filterCubit.rangeValues.start.toInt()} جنيه - ${filterCubit.rangeValues.end.toInt()}+ جنيه',
                                  style: const TextStyle(fontSize: 16),
                                ),

                                BlocBuilder<FilterCubit, FilterState>(
                                  // buildWhen: (prev, curr) => prev.rangeValues != curr.rangeValues,
                                  builder: (context, state) {
                                    final cubit = context.read<FilterCubit>();
                                    return RangeSlider(
                                        values: filterCubit.rangeValues,
                                        min: 0,
                                        max: 100000,
                                        divisions: 1000,
                                        activeColor: Colors.teal[800],
                                        inactiveColor: Colors.grey[300],
                                        onChanged: filterCubit.fetchPrice);
                                  },
                                ),

                                // Slider(
                                //   value: 50,
                                //   min: 0,
                                //   max: 10000,
                                //
                                //   activeColor: const Color(0xff015963),
                                //   inactiveColor: const Color(0xffE1E1E1),
                                //   // label: _currentSliderValue.round().toString(),
                                //   onChanged: (double value) {},
                                // ),

                                // const SizedBox(
                                //   height: 8,
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 16.0),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Row(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           const Icon(Icons.arrow_drop_up),
                                //           SizedBox(
                                //               height: 25,
                                //               width: 60,
                                //               child: CustomInput(
                                //                 controller:
                                //                     filterCubit.endPrice,
                                //                 hintTextStyle: const TextStyle(
                                //                     color: Color(0xff313846)),
                                //                 radius: 0,
                                //                 borderColor:
                                //                     const Color(0xffDDDDDD),
                                //                 borderWidth: 1,
                                //               )),
                                //         ],
                                //       ),
                                //       Row(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           const Icon(Icons.arrow_drop_up),
                                //           SizedBox(
                                //               height: 25,
                                //               width: 60,
                                //               child: CustomInput(
                                //                 controller:
                                //                     filterCubit.startPrice,
                                //                 hintTextStyle: const TextStyle(
                                //                     color: Color(0xff313846)),
                                //                 radius: 0,
                                //                 borderColor:
                                //                     const Color(0xffDDDDDD),
                                //                 borderWidth: 1,
                                //               )),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 2,
                          color: const Color(0xffE5E5E5),
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        //size
                        ExpansionTile(
                          title:  Text(
                            AppLocalizations.of(context)!.size,
                            style:const TextStyle(
                                fontSize: FontSizes.FONT_SIZE_16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff313846)),
                          ),
                          trailing: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xff313846),
                          ),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  ListView.builder(
                                      itemBuilder: (context, index) =>
                                          RadioListTile(
                                            groupValue: filterCubit
                                                .filterFormInput.size,
                                            activeColor:
                                                const Color(0xff878787),
                                            value: filterCubit.size[index].id,
                                            onChanged: (value) => filterCubit
                                                .radioFunctionSize(value),
                                            title: Text(
                                              size[index].nameEn ?? '',
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_16,
                                                  color: Color(0xff878787)),
                                            ),
                                          ),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: size.length),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 2,
                          color: const Color(0xffE5E5E5),
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        //color
                        ExpansionTile(
                          title: Text(
                            AppLocalizations.of(context)!.color,
                            style: const TextStyle(
                                fontSize: FontSizes.FONT_SIZE_16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff313846)),
                          ),
                          trailing: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xff313846),
                          ),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                              onTap: () {
                                                filterCubit.selectFunctionColor(
                                                    colors[index].colorValue);
                                                filterCubit.filterFormInput
                                                    .colors = colors[index];
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: filterCubit
                                                                    .selectedColor ==
                                                                colors[index]
                                                                    .colorValue
                                                            ? AppColors
                                                                .APP_ORANGE_LABEL_COLOR
                                                            : const Color(
                                                                0xffDDDDDD),
                                                        width: 2)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 20,
                                                      height: 20,
                                                      color: Color(int.parse(
                                                          '0xff${colors[index].colorValue?.replaceAll("#", "") ?? '000000'}')),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      colors[index].colorName ??
                                                          '',
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff313846),
                                                          fontSize: FontSizes
                                                              .FONT_SIZE_12),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                        shrinkWrap: true,
                                        itemCount: colors.length),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ));
        },
      ),
    ));
  }
}
