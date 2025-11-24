// import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
// import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:page_transition/page_transition.dart';
// import '../../../../core/constants/fonts/font_sizes.dart';
// import '../../../../core/locales/l10n/app_localizations.dart';
// import '../../../../shared_components/custom_button.dart';
// import '../../../data/models/account_address.dart';
// import '../address_book_entries/edit_address_screen.dart';
//
// class AddressEntryItem extends StatelessWidget {
//   AccountAddress? address;
//   AddressEntryItem({super.key, required this.address});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(
//                 width: 5,
//                 color: const Color(0xffB6BBC6),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 16.0, horizontal: 16),
//                   child: Row(
//                     children: [
//                        Text(
//                         "${AppLocalizations.of(context)!.full_name}: ",
//                         style: const TextStyle(
//                             fontSize: FontSizes.FONT_SIZE_14,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Expanded(
//                         child: Text(
//                           "${address?.firstname ?? ""} ${address?.lastname ?? ""}",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style:
//                               const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 1,
//                   color: const Color(0xffB6BBC6),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                        Text(
//                         "${AppLocalizations.of(context)!.address}: ",
//                         style: const TextStyle(
//                             fontSize: FontSizes.FONT_SIZE_14,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Expanded(
//                         child: Text(
//                           address?.address1 ?? "-",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style:
//                               const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 // Container(
//                 //   height: 1,
//                 //   color: const Color(0xffB6BBC6),
//                 // ),
//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(
//                 //       vertical: 16.0, horizontal: 16),
//                 //   child: Row(
//                 //     children: [
//                 //       const Text(
//                 //         "Post Code : ",
//                 //         style: TextStyle(
//                 //             fontSize: FontSizes.FONT_SIZE_14,
//                 //             fontWeight: FontWeight.bold),
//                 //       ),
//                 //       Expanded(
//                 //         child: Text(
//                 //           address?.postcode ?? "",
//                 //           maxLines: 1,
//                 //           overflow: TextOverflow.ellipsis,
//                 //           style:
//                 //               const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
//                 //         ),
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 Container(
//                   height: 1,
//                   color: const Color(0xffB6BBC6),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 16.0, horizontal: 16),
//                   child: Row(
//                     children: [
//                        Text(
//                         "${AppLocalizations.of(context)!.city}: ",
//                         style: const TextStyle(
//                             fontSize: FontSizes.FONT_SIZE_14,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Expanded(
//                         child: Text(
//                           address?.city ?? "",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style:
//                               const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 1,
//                   color: const Color(0xffB6BBC6),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 16.0, horizontal: 16),
//                   child: Row(
//                     children: [
//                        Text(
//                         "${AppLocalizations.of(context)!.country}: ",
//                         style: const TextStyle(
//                             fontSize: FontSizes.FONT_SIZE_14,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Expanded(
//                         child: Text(
//                           address?.country ?? "",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style:
//                               const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 1,
//                   color: const Color(0xffB6BBC6),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 16.0, horizontal: 16),
//                   child: Row(
//                     children: [
//                        Text(
//                         "${AppLocalizations.of(context)!.region}: ",
//                         style: const TextStyle(
//                             fontSize: FontSizes.FONT_SIZE_14,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Expanded(
//                         child: Text(
//                           address?.zone ?? "",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style:
//                               const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               SizedBox(
//                   height: 35,
//                   child: CustomButton(
//                     text: AppLocalizations.of(context)!.edit,
//                     action: () {
//                       AccountCubit.get(context).initEditAddressScreen(address);
//                       Navigator.push(
//                           context,
//                           PageTransition(
//                               child: BlocProvider.value(
//                                   value: AccountCubit.get(context),
//                                   child: EditAddressScreen(
//                                     accountAddress: address,
//                                   )),
//                               type: PageTransitionType.leftToRight));
//                     },
//                   )),
//               const SizedBox(
//                 width: 8,
//               ),
//               SizedBox(
//                 height: 35,
//                 child: BlocConsumer<AccountCubit, AccountStates>(
//                   listener: (context, state) {},
//                   builder: (context, state) {
//                     return CustomButton(
//                       color: const Color(0xff313846),
//
//                       text: AppLocalizations.of(context)!.delete,
//                       action: () {
//                         AccountCubit.get(context).deleteAddressInAccount(
//                             int.parse(address?.addressId ?? ""));
//                       },
//                       isLoading: state is DeleteAddressLoadingState &&
//                           int.tryParse(address?.addressId ?? "") ==
//                               AccountCubit.get(context).selectedAddressId,
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
