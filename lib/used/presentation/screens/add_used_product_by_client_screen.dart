import 'dart:io';
import 'package:classic_eccomerce/used/presentation/cubit/add_ued_product_by_client_states.dart';
import 'package:classic_eccomerce/used/presentation/cubit/add_used_product_by_client_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_app_bar.dart';
import '../../../shared_components/custom_button.dart';
import '../../../shared_components/custom_input.dart';

class AddUsedProductByClientScreen extends StatelessWidget {
  const AddUsedProductByClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<AddUsedProductByClientCubit>(
      create: (context) => AddUsedProductByClientCubit(),
      child: Scaffold(
        appBar: CustomAppBar.renderAppBar(
            title: "Add product", showCartIcon: false),
        body: BlocConsumer<AddUsedProductByClientCubit,
            AddUsedProductByClientStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AddUsedProductByClientCubit addProductCubit =
                AddUsedProductByClientCubit.get(context);
            //List<WooCategory>? wooCategories = addProductCubit.wooCategories;

            List<XFile>? productImages = addProductCubit?.productImages;
            return SingleChildScrollView(
              child: Form(
                key: addProductCubit.addProductFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.add_a_product,
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
                        height: 24,
                      ),
                      CustomInput(
                        hintText:
                            AppLocalizations.of(context)!.enter_product_name,
                        label: AppLocalizations.of(context)!.enter_product_name,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return AppLocalizations.of(context)!
                                .enter_product_name;
                          }
                        },
                        onSaved: (v) =>
                            addProductCubit.addProductInput.name = v!,
                        textInputType: TextInputType.name,
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      CustomInput(
                        hintText:
                            AppLocalizations.of(context)!.enter_product_price,
                        label:
                            AppLocalizations.of(context)!.enter_product_price,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return AppLocalizations.of(context)!
                                .enter_product_price;
                          }
                        },
                        textInputType: TextInputType.number,
                        onSaved: (v) =>
                            addProductCubit.addProductInput.price = v!,
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            direction: Axis.horizontal,
                            children: List.generate(
                                (productImages?.length ?? 0) + 1, (index) {
                              XFile? image;
                              if (index != (productImages?.length ?? 0)) {
                                image = productImages?[index];
                              }
                              if (index > 3) {
                                return Container();
                              }
                              return InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        Navigator.pop(context);

                                                        await addProductCubit
                                                            .addProductImages(
                                                                isFromCamera:
                                                                    false);
                                                      },
                                                      child: const Icon(
                                                        Icons.image,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        Navigator.pop(context);

                                                        await addProductCubit
                                                            .addProductImages(
                                                                isFromCamera:
                                                                    true);
                                                      },
                                                      child: const Icon(
                                                        Icons.camera_alt,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ));
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(color: Colors.grey)),
                                    child: image != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: Stack(
                                              fit: StackFit.expand,
                                              children: [
                                                Image.file(
                                                  File(image.path),
                                                  fit: BoxFit.cover,
                                                ),
                                                Positioned(
                                                  top: 2,
                                                  left: 2,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        addProductCubit
                                                            .removeProductImage(
                                                                file: image);
                                                      },
                                                      child: const Icon(
                                                        Icons.cancel,
                                                        color: Colors.red,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.APP_MAIN_COLOR,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                  )
                                  // Container(
                                  //   width:
                                  //       MediaQuery.of(context).size.width * 0.23,
                                  //   height:
                                  //       MediaQuery.of(context).size.height * 0.09,
                                  //   margin: const EdgeInsets.symmetric(
                                  //       horizontal: 3, vertical: 5),
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(5)),
                                  //   child: image != null
                                  //       ? ClipRRect(
                                  //           borderRadius:
                                  //               BorderRadius.circular(4),
                                  //           child: Stack(
                                  //             fit: StackFit.expand,
                                  //             children: [
                                  //               Image.file(
                                  //                 File(image.path),
                                  //                 fit: BoxFit.cover,
                                  //                 height: MediaQuery.of(context)
                                  //                         .size
                                  //                         .height *
                                  //                     0.048,
                                  //                 width: MediaQuery.of(context)
                                  //                         .size
                                  //                         .height *
                                  //                     0.048,
                                  //               ),
                                  //               Positioned(
                                  //                 top: 2,
                                  //                 left: 2,
                                  //                 child: GestureDetector(
                                  //                     onTap: () {
                                  //                       addProductCubit
                                  //                           .removeProductImage(
                                  //                               file: image);
                                  //                     },
                                  //                     child: const Icon(
                                  //                       Icons.cancel,
                                  //                       color: Colors.red,
                                  //                     )),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         )
                                  //       : Container(
                                  //           decoration: BoxDecoration(
                                  //               color: Colors.grey,
                                  //               borderRadius:
                                  //                   BorderRadius.circular(8)),
                                  //           height: MediaQuery.of(context)
                                  //                   .size
                                  //                   .height *
                                  //               0.048,
                                  //           width: MediaQuery.of(context)
                                  //                   .size
                                  //                   .height *
                                  //               0.048,
                                  //           child: const Padding(
                                  //             padding: EdgeInsets.all(12.0),
                                  //             child: Icon(Icons.add),
                                  //           ),
                                  //         ),
                                  // ),
                                  );
                            })),
                      ),

                      // GestureDetector(
                      //   onTap: () {
                      //     addProductCubit.pickImageDialog(context);
                      //   },
                      //   child: (addProductCubit.productImage == null)
                      //       ? InputDecorator(
                      //           decoration: InputDecoration(
                      //               labelText: AppLocalizations.of(context)!
                      //                   .upload_image,
                      //               labelStyle: const TextStyle(
                      //                   fontSize: FontSizes.FONT_SIZE_16,
                      //                   fontWeight: FontWeight.bold,
                      //                   color: Color(0xff313846)),
                      //               border: OutlineInputBorder(
                      //                 borderRadius: BorderRadius.circular(0),
                      //               )),
                      //           child: Container(
                      //             decoration: const BoxDecoration(
                      //                 shape: BoxShape.circle,
                      //                 color: AppColors.APP_MAIN_COLOR),
                      //             padding: const EdgeInsets.all(16.0),
                      //             child: Center(
                      //               child: Icon(
                      //                 Icons.add,
                      //                 size: MediaQuery.of(context).size.height *
                      //                     0.1,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         )
                      //       : Stack(
                      //           children: [
                      //             ClipRRect(
                      //               borderRadius: const BorderRadius.all(
                      //                 Radius.circular(0),
                      //               ),
                      //               child: Image.file(
                      //                 File(addProductCubit.productImage?.path ??
                      //                     ""),
                      //                 fit: BoxFit.cover,
                      //                 width: MediaQuery.of(context).size.width,
                      //                 height:
                      //                     MediaQuery.of(context).size.height *
                      //                         0.2,
                      //               ),
                      //             ),
                      //             GestureDetector(
                      //                 onTap: () {
                      //                   addProductCubit.removeImage();
                      //                 },
                      //                 child: const Padding(
                      //                   padding:
                      //                       EdgeInsets.only(top: 8, right: 8),
                      //                   child: Icon(
                      //                     Icons.remove_circle,
                      //                     color: Colors.red,
                      //                   ),
                      //                 ))
                      //           ],
                      //         ),
                      // ),

                      const SizedBox(
                        height: 16,
                      ),
                      // Text(
                      //   AppLocalizations.of(context)!.select_category,
                      //   style: const TextStyle(
                      //       fontSize: FontSizes.FONT_SIZE_18,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // ...wooCategories
                      //         ?.map((e) => ListTile(
                      //               onTap: () {
                      //                 addProductCubit.setSelectedCategoryId(
                      //                     e.id?.toInt() ?? 0);
                      //               },
                      //               title: Text(
                      //                 e.name ?? "",
                      //                 style: TextStyle(
                      //                     fontSize: FontSizes.FONT_SIZE_14,
                      //                     fontWeight: (e.id ==
                      //                             addProductCubit
                      //                                 .selectedCategoryId)
                      //                         ? FontWeight.bold
                      //                         : null),
                      //               ),
                      //             ))
                      //         ?.toList() ??
                      //     [],
                      // Row(
                      //   children: [
                      //     Expanded(
                      //         child: RadioListTile(
                      //       value: true,
                      //       groupValue: addProductCubit.addProductInput.isUsed,
                      //       contentPadding:
                      //           const EdgeInsets.symmetric(horizontal: 0),
                      //       dense: true,
                      //       onChanged: (index) {
                      //         //  addProductCubit.setNewOrUsedCategoryId(76);
                      //       },
                      //       title: Text(
                      //         "AppLocalizations.of(context)!.used",
                      //         maxLines: 1,
                      //         style: const TextStyle(
                      //             fontSize: FontSizes.FONT_SIZE_16),
                      //       ),
                      //     )),
                      //     Expanded(
                      //         child: RadioListTile(
                      //       value: false,
                      //       groupValue: addProductCubit.addProductInput.isUsed,
                      //       contentPadding:
                      //           const EdgeInsets.symmetric(horizontal: 0),
                      //       dense: true,
                      //       onChanged: (index) {
                      //         // addProductCubit.setNewOrUsedCategoryId(78);
                      //       },
                      //       title: Text(
                      //         "AppLocalizations.of(context)!.neww",
                      //         maxLines: 1,
                      //         style: const TextStyle(
                      //             fontSize: FontSizes.FONT_SIZE_16),
                      //       ),
                      //     )),
                      //   ],
                      // ),
                      // addProductCubit.addProductInput?.isUsed == false
                      //     ? Container()
                      //     : const SizedBox(
                      //         height: 16,
                      //       ),
                      // addProductCubit.addProductInput?.isUsed == false
                      //     ? Container()
                      //     : CustomInput(
                      //         label: "AppLocalizations.of(context)!.odometer",
                      //         hintText:
                      //             "AppLocalizations.of(context)!.odometer",
                      //         textInputType: TextInputType.number,
                      //         onSaved: (v) => addProductCubit
                      //             .addProductInput.odometer = v?.trim(),
                      //         validator: (v) {
                      //           if (v == null || v.isEmpty) {
                      //             return "AppLocalizations.of(context)!.enter_odometer";
                      //           }
                      //         },
                      //       ),

                      const SizedBox(
                        height: 16,
                      ),

                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: const Color(0xff95989A))),
                      //   child: DropdownSearch<WooCategory>(
                      //     asyncItems: (String filter) async {
                      //       return addProductCubit.getCategories();
                      //     },
                      //     dropdownDecoratorProps: DropDownDecoratorProps(
                      //         dropdownSearchDecoration: InputDecoration(
                      //             border: InputBorder.none,
                      //             hintStyle: const TextStyle(
                      //               fontSize: FontSizes.FONT_SIZE_16,
                      //               color: Color(0xff878787),
                      //             ),
                      //             hintText: AppLocalizations.of(context)!
                      //                 .select_category)),
                      //     dropdownButtonProps: const DropdownButtonProps(
                      //         icon: Icon(
                      //       Icons.keyboard_arrow_down,
                      //       color: Color(0xff696C6E),
                      //     )),
                      //     popupProps: PopupProps.menu(
                      //         itemBuilder: (context, WooCategory cat, bool) {
                      //       return Padding(
                      //         padding: const EdgeInsets.all(16.0),
                      //         child: Text(
                      //           cat.name ?? "",
                      //           style: const TextStyle(
                      //               fontSize: FontSizes.FONT_SIZE_16,
                      //               color: Color(0xff878787)),
                      //         ),
                      //       );
                      //     }),
                      //     dropdownBuilder: (context, cat) {
                      //       return Text(
                      //         cat?.name ??
                      //             AppLocalizations.of(context)!.select_category,
                      //         style: const TextStyle(
                      //             fontSize: FontSizes.FONT_SIZE_16,
                      //             color: Color(0xff878787)),
                      //       );
                      //     },
                      //     validator: (v) {
                      //       if (v == null) {
                      //         return AppLocalizations.of(context)!
                      //             .select_category;
                      //       }
                      //     },
                      //     onSaved: (v) => addProductCubit.selectedCategoryId =
                      //         v?.id?.toInt(),
                      //   ),
                      // ),
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
                        onSaved: (v) => addProductCubit
                            .addProductInput.phoneNumber = v?.trim(),
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      CustomInput(
                        label: AppLocalizations.of(context)!.address,
                        hintText: AppLocalizations.of(context)!.address,
                        onSaved: (v) =>
                            addProductCubit.addProductInput.address = v?.trim(),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return AppLocalizations.of(context)!.enter_address;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInput(
                        label: AppLocalizations.of(context)!.description,
                        hintText: AppLocalizations.of(context)!.description,
                        maxLines: 3,
                        onSaved: (v) => addProductCubit
                            .addProductInput.description = v?.trim(),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return AppLocalizations.of(context)!
                                .enter_description;
                          }
                        },
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                          isLoading:
                              state is AddUsedProductByClientLoadingState,
                          text: AppLocalizations.of(context)!.save,
                          action: () {
                            addProductCubit.addProduct();
                            // accountCubit.editAccountDetails();
                          })
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
