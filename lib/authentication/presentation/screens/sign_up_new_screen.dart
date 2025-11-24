// import 'package:classic_eccomerce/authentication/data/models/get_place_governorate_response/get_governorate.dart';
// import 'package:classic_eccomerce/authentication/data/models/get_place_governorate_response/get_judiciary.dart';
// import 'package:classic_eccomerce/authentication/data/models/get_place_governorate_response/get_way_by_Judiciary.dart';
// import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
// import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
// import 'package:classic_eccomerce/authentication/presentation/get_place_cubit/get_place_cubit.dart';
// import 'package:classic_eccomerce/shared_components/app_snackbar.dart';
// import 'package:classic_eccomerce/shared_components/custom_button.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../core/constants/paths/image_paths.dart';
// import '../../../core/locales/l10n/app_localizations.dart';
// import '../../../shared_components/custom_input.dart';
//
// class SignUpScreen extends StatelessWidget {
//   bool showBackButton;
//
//   SignUpScreen({
//     super.key,
//     this.showBackButton = true,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: AuthCubit.get(context).registerFormKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               spacing: 5,
//               children: [
//                 (showBackButton == false)
//                     ? Container()
//                     : const Row(
//                         children: [BackButton()],
//                       ),
//                 Center(
//                   child: ClipOval(
//                       child: Image.asset(
//                     ImagePaths.APP_LOGO,
//                     width: MediaQuery.of(context).size.width * 0.4,
//                     height: MediaQuery.of(context).size.height * 0.2,
//                   )),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 CustomInput(
//                   label: AppLocalizations.of(context)!.full_name,
//                   hintText: AppLocalizations.of(context)!.full_name,
//                   validator: (value) {
//                     if (value!.trim() == null || value.isEmpty) {
//                       return AppLocalizations.of(context)!.enter_full_name;
//                     }
//                     // if ((value?.split(" ")?.length ?? 0) == 1 ||
//                     //     value?.split(" ")?.last?.isEmpty == true ||
//                     //     value?.split(" ")?.last == " ") {
//                     //   return AppLocalizations.of(context)!
//                     //       .enter_full_name;
//                     // }
//                   },
//                   onSaved: (v) {
//                     // AuthCubit.get(context).registerFormInput.firstName =
//                     //     v?.trim()?.split(" ")?.first;
//                     // if ((v?.split(" ")?.length ?? 0) > 1) {
//                     //   AuthCubit.get(context).registerFormInput.lastName =
//                     //       v?.trim()?.split(" ")?.last;
//                     // }
//                     AuthCubit.get(context).registerFormInput.name = v!.trim();
//                   },
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 CustomInput(
//                   label: AppLocalizations.of(context)!.name_user,
//                   hintText: AppLocalizations.of(context)!.name_user,
//                   validator: (value) {
//                     if (value!.trim() == null || value.isEmpty) {
//                       return AppLocalizations.of(context)!.enter_name_user;
//                     }
//                     // if ((value?.split(" ")?.length ?? 0) == 1 ||
//                     //     value?.split(" ")?.last?.isEmpty == true ||
//                     //     value?.split(" ")?.last == " ") {
//                     //   return AppLocalizations.of(context)!
//                     //       .enter_name_user;
//                     // }
//                   },
//                   onSaved: (v) {
//                     // AuthCubit.get(context).registerFormInput.firstName =
//                     //     v?.trim()?.split(" ")?.first;
//                     // if ((v?.split(" ")?.length ?? 0) > 1) {
//                     //   AuthCubit.get(context).registerFormInput.lastName =
//                     //       v?.trim()?.split(" ")?.last;
//                     // }
//                     AuthCubit.get(context).registerFormInput.userName =
//                         v!.trim();
//                   },
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 BlocProvider(
//                   create: (context) => GetPlaceCubit(),
//                   child: BlocConsumer<GetPlaceCubit, GetPlaceState>(
//                     listener: (context, state) {
//                       // TODO: implement listener
//                       if(state is FetchingGovernorateScreenNetworkFailedState || state is FetchingJudiciaryScreenNetworkFailedState || state is FetchingWayScreenNetworkFailedState){
//                         showAppSnackBar(content: AppLocalizations.of(context)!.check_your_internet_connection_and_try_again_later);
//                       }
//                     },
//                     builder: (context, state) {
//                       var placeCubit = GetPlaceCubit.get(context);
//                       return Column(
//                         spacing: 16,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.only(left: 16, right: 8),
//                             decoration: BoxDecoration(
//                                 border:
//                                     Border.all(color: const Color(0xff95989A))),
//                             child: DropdownSearch<GovernorateAD>(
//                               selectedItem: placeCubit.selectedGovernorateItem,
//                               asyncItems: (String filter) async {
//                                 return await placeCubit.fetchGovernorates();
//                               },
//                               validator: (value) {
//                                 if (value == null || value.id == null || value.id == 0) {
//                                   return AppLocalizations.of(context)!.enter_judiciary;
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {
//                                 print(value!.id);
//                                 placeCubit.selectedGovernorateItem = value;
//                                 placeCubit.selectedGovernorate(value!.id ?? 0);
//                                 AuthCubit.get(context).registerFormInput.governorateId=placeCubit.placeFormInput.governorateId;
//                               },
//                               dropdownDecoratorProps: DropDownDecoratorProps(
//                                 dropdownSearchDecoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   label: Text(AppLocalizations.of(context)!
//                                       .governorate_user),
//                                   hintText: AppLocalizations.of(context)!
//                                       .governorate_user,
//                                 ),
//                               ),
//                               popupProps: PopupProps.menu(
//                                 itemBuilder: (context, GovernorateAD item,
//                                     bool selected) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(16.0),
//                                     child: Text(
//                                       item.governorateName ?? 'Unknown',
//                                       style: const TextStyle(
//                                           fontSize: 16,
//                                           color: Color(0xff878787)),
//                                     ),
//                                   );
//                                 },
//                               ),
//                               dropdownBuilder: (context, selectedItem) {
//                                 return Text(
//                                   selectedItem?.governorateName ??
//                                       AppLocalizations.of(context)!
//                                           .governorate_user,
//                                   style: const TextStyle(
//                                       fontSize: 16, color: Color(0xff878787)),
//                                 );
//                               },
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 16, right: 8),
//                             decoration: BoxDecoration(
//                                 border:
//                                     Border.all(color: const Color(0xff95989A))),
//                             child: DropdownSearch<JudiciaryAD>(
//                               selectedItem: placeCubit.selectedJudiciaryItem,
//                               asyncItems: (String filter) async {
//                                 return await placeCubit
//                                     .fetchJudiciaries(); // 👈 fetch data on tap
//                               },
//                               validator: (value) {
//                                 if (value == null ||
//                                     value.id == null ||
//                                     value.id == 0) {
//                                   return AppLocalizations.of(context)!
//                                       .enter_judiciary;
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {
//                                 print(value!.id);
//                                 placeCubit.selectedJudiciaryItem=value;
//                                 placeCubit.selectedJudiciary(value!.id ?? 0);
//                                 AuthCubit.get(context).registerFormInput.judiciaryId=placeCubit.placeFormInput.judiciaryId;
//                               },
//                               dropdownDecoratorProps: DropDownDecoratorProps(
//                                 dropdownSearchDecoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   label: Text(AppLocalizations.of(context)!
//                                       .judiciary_user),
//                                   hintText: AppLocalizations.of(context)!
//                                       .judiciary_user,
//                                 ),
//                               ),
//                               popupProps: PopupProps.menu(
//                                 emptyBuilder: (context, searchEntry) => Center(
//                                   child: Text(AppLocalizations.of(context)!.checkGovernorate),
//                                 ),
//                                 itemBuilder:
//                                     (context, JudiciaryAD item, bool selected) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(16.0),
//                                     child: Text(
//                                       item.judiciaryName ?? 'Unknown',
//                                       style: const TextStyle(
//                                           fontSize: 16,
//                                           color: Color(0xff878787)),
//                                     ),
//                                   );
//                                 },
//                               ),
//                               dropdownBuilder: (context, selectedItem) {
//                                 return Text(
//                                   selectedItem?.judiciaryName ??
//                                       AppLocalizations.of(context)!
//                                           .judiciary_user,
//                                   style: const TextStyle(
//                                       fontSize: 16, color: Color(0xff878787)),
//                                 );
//                               },
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 16, right: 8),
//                             decoration: BoxDecoration(
//                                 border:
//                                     Border.all(color: const Color(0xff95989A))),
//                             child: DropdownSearch<WayAD>(
//                               selectedItem: placeCubit.selectedWayItem,
//                               asyncItems: (String filter) async {
//                                 return await placeCubit.fetchWays();
//                               },
//                               validator: (value) {
//                                 if (value == null ||
//                                     value.id == null ||
//                                     value.id == 0) {
//                                   return AppLocalizations.of(context)!
//                                       .enter_judiciary;
//                                 }
//                                 return null;
//                               },
//                               onChanged: (value) {
//                                 print(value!.id);
//                                 placeCubit.selectedWayItem=value;
//                                 placeCubit.selectedWay(value!.id ?? 0);
//                                 AuthCubit.get(context).registerFormInput.wayId=placeCubit.placeFormInput.wayId;
//                               },
//                               dropdownDecoratorProps: DropDownDecoratorProps(
//                                 dropdownSearchDecoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   label: Text(
//                                       AppLocalizations.of(context)!.way_user),
//                                   hintText:
//                                       AppLocalizations.of(context)!.way_user,
//                                 ),
//                               ),
//                               popupProps: PopupProps.menu(
//                                 emptyBuilder: (context, searchEntry) => Center(
//                                   child: Text(AppLocalizations.of(context)!.checkJudiciary),
//                                 ),
//                                 itemBuilder:
//                                     (context, WayAD item, bool selected) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(16.0),
//                                     child: Text(
//                                       item.wayName ?? 'Unknown',
//                                       style: const TextStyle(
//                                           fontSize: 16,
//                                           color: Color(0xff878787)),
//                                     ),
//                                   );
//                                 },
//                               ),
//                               dropdownBuilder: (context, selectedItem) {
//                                 return Text(
//                                   selectedItem?.wayName ??
//                                       AppLocalizations.of(context)!.way_user,
//                                   style: const TextStyle(
//                                       fontSize: 16, color: Color(0xff878787)),
//                                 );
//                               },
//                             ),
//                           ),
//                           SizedBox(
//                             height: 16,
//                           )
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 CustomInput(
//                   label: AppLocalizations.of(context)!.password,
//                   hintText: AppLocalizations.of(context)!.password,
//                   validator: (v) {
//                     if (v == null || v.length < 6) {
//                       return AppLocalizations.of(context)!
//                           .enter_a_password_of_at_least_six_characters;
//                     }
//                   },
//                   onSaved: (v) =>
//                       AuthCubit.get(context).registerFormInput.password = v,
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 BlocConsumer<AuthCubit, AuthStates>(
//                   listener: (context, state) {},
//                   builder: (context, state) {
//                     return CustomButton(
//                         text: AppLocalizations.of(context)!.sign_up,
//                         isLoading: state is RegisterLoadingState,
//                         action: () {
//                           AuthCubit.get(context)
//                               .register();
//                           // Navigator.push(
//                           //     context,
//                           //     PageTransition(
//                           //         child: const QuickCheckoutMainScreen(),
//                           //         type: PageTransitionType.leftToRight));
//                         });
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
