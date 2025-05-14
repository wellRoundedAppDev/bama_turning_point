import 'package:classic_eccomerce/complain/presentation/complain_cubit/complain_state.dart';
import 'package:classic_eccomerce/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'package:classic_eccomerce/contact_us/presentation/cubit/contact_us_states.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/notifications/presentation/screens/notifications_screen.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../home/presentation/widgets/home_drawer.dart';
import '../../../main.dart';
import '../../../shared_components/custom_input.dart';
import '../complain_cubit/complain_cubit.dart';

class ComplainsScreen extends StatelessWidget {
  const ComplainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComplainCubit(),
      child: BlocConsumer<ComplainCubit, ComplainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ComplainCubit complainCubit = ComplainCubit.get(context);
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.1,
              leading: Container(),
              flexibleSpace: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  AppColors.APP_BAR_COLOR_GRAD_ONE,
                  AppColors.APP_BAR_COLOR_GRAD_TWO
                ], stops: [
                  0.1,
                  0.9
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Builder(builder: (context) {
                  String firstName = MyApp.navKey.currentState?.context
                          .read<AuthCubit>()
                          .loginResponse
                          ?.loginData
                          ?.firstname ??
                      "";
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     Scaffold.of(context).openDrawer();
                      //   },
                      //   child: SvgPicture.asset(
                      //     IconPaths.ACCOUNT_ICON,
                      //     width: 25,
                      //     height: 25,
                      //   ),
                      // ),
                      // const SizedBox(
                      //   width: 8,
                      // ),

                      Expanded(
                        child: Text(
                          firstName ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Center(
                          child: Image.asset(
                        ImagePaths.APP_LOGO,
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.22,
                      )),
                      // IconButton(
                      //   onPressed: () {
                      //     // ContactUsApi.contactUs();
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) =>
                      //     //             const NotificationsScreen()));
                      //   },
                      //   icon: const Icon(
                      //     Icons.notifications,
                      //     color: Colors.white,
                      //     size: 30,
                      //   ),
                      // ),

                      // const SizedBox(width: 16,),

                      // const Expanded(
                      //   child: Text("1575\$"??"",
                      //     overflow: TextOverflow.ellipsis,
                      //     textAlign: TextAlign.end,
                      //     style: TextStyle(fontSize: FontSizes.FONT_SIZE_16,color: Colors.white,
                      //
                      //         fontWeight:FontWeight.bold
                      //     ),
                      //   ),
                      // ),
                      //
                      // const SizedBox(width: 16,),

                      Expanded(child: Container()),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,
                          child: const NotificationsScreen()
                          ));
                        },
                        child: SvgPicture.asset(
                          IconPaths.NOTIFICATION_ICON,
                          width: 25,
                          height: 25,
                        ),
                      ),

                      // GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           PageTransition(
                      //               child: BlocProvider.value(
                      //                   value: CartCubit.get(context),
                      //                   child: CartScreen(
                      //                     showBackButton: true,
                      //                   )),
                      //               type: PageTransitionType.leftToRight));
                      //     },
                      //     child: BlocConsumer<CartCubit, CartStates>(
                      //       listener: (context, state) {},
                      //       builder: (context, state) {
                      //         num itemsCount = CartCubit.get(context)
                      //             .numberOfItemsInCart;
                      //
                      //         return Stack(
                      //           children: [
                      //             Container(
                      //               color: Colors.transparent,
                      //               height: 30,
                      //               width: 30,
                      //             ),
                      //             Center(
                      //               child: Image.asset(
                      //                 IconPaths.CART,
                      //                 width: 25,
                      //                 height: 25,
                      //               ),
                      //             ),
                      //             (itemsCount == 0)
                      //                 ? Container()
                      //                 : Positioned(
                      //               bottom: 0,
                      //               right: 1,
                      //               child: Container(
                      //                 padding:
                      //                 const EdgeInsets.all(3),
                      //                 decoration: const BoxDecoration(
                      //                     color: Colors.yellow,
                      //                     shape: BoxShape.circle),
                      //                 child: Center(
                      //                   child: Text(
                      //                     itemsCount.toString(),
                      //                     style: const TextStyle(
                      //                         fontSize: FontSizes
                      //                             .FONT_SIZE_8,
                      //                         color: Colors.black),
                      //                   ),
                      //                 ),
                      //               ),
                      //             )
                      //           ],
                      //         );
                      //       },
                      //     )),
                    ],
                  );
                }),
              ),
            ),


            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: complainCubit.complainFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.complains,
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: FontSizes.FONT_SIZE_18,
                              color: AppColors.GREY_LABEL_COLOR,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 40,
                          height: 3,
                          color: AppColors.APP_MAIN_COLOR,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomInput(
                      label: AppLocalizations.of(context)!.title,
                      hintText: AppLocalizations.of(context)!.title,
                      controller: complainCubit.title,
                      validator: (topic) {
                        if (topic?.isEmpty == true) {
                          return AppLocalizations.of(context)!
                              .enter_your_subject;
                        }
                      },
                      onSaved: (topic) => complainCubit
                          .complainFormInput.title = complainCubit.title.text,
                      borderColor: const Color(0xff95989A),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      label: AppLocalizations.of(context)!.text,
                      hintText: AppLocalizations.of(context)!.text,
                      controller: complainCubit.description,
                      borderColor: const Color(0xff95989A),
                      validator: (message) {
                        if (message?.isEmpty == true) {
                          return AppLocalizations.of(context)!
                              .enter_your_message;
                        }
                      },
                      onSaved: (message) => complainCubit.complainFormInput
                          .description = complainCubit.description.text,
                      maxLines: 4,
                      minLines: null,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        text: AppLocalizations.of(context)!.send,
                        isLoading: state is CreateComplainLoadingState,
                        action: () async {
                          //  await contactUsCubit.sendToAdmin();
                          complainCubit.createComplain(context);
                        }),
                  ],
                ),
              ),
            )),
          ));
        },
      ),
    );
  }
}

// class ComplainsScreen extends StatelessWidget {
//   const ComplainsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ContactUsCubit(),
//       child: BlocConsumer<ContactUsCubit, ContactUsStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           ContactUsCubit contactUsCubit = ContactUsCubit.get(context);
//           return SafeArea(
//               child: Scaffold(
//                 drawer: const HomeDrawer(),
//
//                 appBar: AppBar(
//                   toolbarHeight: MediaQuery.of(context).size.height * 0.1,
//                   leading: Container(),
//                   flexibleSpace: Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: const BoxDecoration(
//                         gradient: LinearGradient(colors: [
//                           AppColors.APP_BAR_COLOR_GRAD_ONE,
//                           AppColors.APP_BAR_COLOR_GRAD_TWO
//                         ], stops: [
//                           0.1,
//                           0.9
//                         ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//                     child: Builder(builder: (context) {
//                       String firstName = MyApp.navKey.currentState?.context.read<AuthCubit>().loginResponse?.loginData?.firstname??"";
//                       return
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Scaffold.of(context).openDrawer();
//
//                               },
//                               child: SvgPicture.asset(IconPaths.ACCOUNT_ICON,
//                                 width: 25,
//                                 height: 25,
//                               ),
//                             ),
//                             const SizedBox(width: 8,),
//
//                             Expanded(
//                               child: Text(firstName??"",
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(fontSize: FontSizes.FONT_SIZE_16,color: Colors.white,
//                                     fontWeight: FontWeight.bold
//
//                                 ),
//                               ),
//                             ),
//
//                             Center(
//                                 child: Image.asset(
//                                   ImagePaths.APP_LOGO,
//                                   width: MediaQuery.of(context).size.width * 0.2,
//                                   height: MediaQuery.of(context).size.height * 0.22,
//
//                                 )),
//                             // IconButton(
//                             //   onPressed: () {
//                             //     // ContactUsApi.contactUs();
//                             //     // Navigator.push(
//                             //     //     context,
//                             //     //     MaterialPageRoute(
//                             //     //         builder: (context) =>
//                             //     //             const NotificationsScreen()));
//                             //   },
//                             //   icon: const Icon(
//                             //     Icons.notifications,
//                             //     color: Colors.white,
//                             //     size: 30,
//                             //   ),
//                             // ),
//
//
//
//                             // const SizedBox(width: 16,),
//
//                             const Expanded(
//                               child: Text("1575\$"??"",
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.end,
//                                 style: TextStyle(fontSize: FontSizes.FONT_SIZE_16,color: Colors.white,
//
//                                     fontWeight:FontWeight.bold
//                                 ),
//                               ),
//                             ),
//
//                             const SizedBox(width: 16,),
//
//                             GestureDetector(
//                               onTap: () {
//                               },
//                               child: SvgPicture.asset(IconPaths.NOTIFICATION_ICON,
//                                 width: 25,
//                                 height: 25,
//                               ),
//                             ),
//
//
//                             // GestureDetector(
//                             //     onTap: () {
//                             //       Navigator.push(
//                             //           context,
//                             //           PageTransition(
//                             //               child: BlocProvider.value(
//                             //                   value: CartCubit.get(context),
//                             //                   child: CartScreen(
//                             //                     showBackButton: true,
//                             //                   )),
//                             //               type: PageTransitionType.leftToRight));
//                             //     },
//                             //     child: BlocConsumer<CartCubit, CartStates>(
//                             //       listener: (context, state) {},
//                             //       builder: (context, state) {
//                             //         num itemsCount = CartCubit.get(context)
//                             //             .numberOfItemsInCart;
//                             //
//                             //         return Stack(
//                             //           children: [
//                             //             Container(
//                             //               color: Colors.transparent,
//                             //               height: 30,
//                             //               width: 30,
//                             //             ),
//                             //             Center(
//                             //               child: Image.asset(
//                             //                 IconPaths.CART,
//                             //                 width: 25,
//                             //                 height: 25,
//                             //               ),
//                             //             ),
//                             //             (itemsCount == 0)
//                             //                 ? Container()
//                             //                 : Positioned(
//                             //               bottom: 0,
//                             //               right: 1,
//                             //               child: Container(
//                             //                 padding:
//                             //                 const EdgeInsets.all(3),
//                             //                 decoration: const BoxDecoration(
//                             //                     color: Colors.yellow,
//                             //                     shape: BoxShape.circle),
//                             //                 child: Center(
//                             //                   child: Text(
//                             //                     itemsCount.toString(),
//                             //                     style: const TextStyle(
//                             //                         fontSize: FontSizes
//                             //                             .FONT_SIZE_8,
//                             //                         color: Colors.black),
//                             //                   ),
//                             //                 ),
//                             //               ),
//                             //             )
//                             //           ],
//                             //         );
//                             //       },
//                             //     )),
//                           ],
//                         );
//                     }),
//                   ),
//                 ),
//                 body: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                       child: Form(
//                         key: contactUsCubit.contactUsFormKey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   AppLocalizations.of(context)!.complains,
//                                   maxLines: 1,
//                                   textDirection: TextDirection.ltr,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                       fontSize: FontSizes.FONT_SIZE_18,
//                                       color: AppColors.GREY_LABEL_COLOR,
//                                       fontWeight: FontWeight.bold),
//                                 ),                                      const SizedBox(
//                                   height: 4,
//                                 ),
//                                 Container(
//                                   width: 40,
//                                   height: 3,
//                                   color: AppColors.APP_MAIN_COLOR,
//                                 ),
//                               ],
//                             ),
//
//                             const SizedBox(
//                               height: 24,
//                             ),
//
//                             CustomInput(
//                               label: AppLocalizations.of(context)!.title,
//                               hintText: AppLocalizations.of(context)!.title,
//                               // validator: (topic) {
//                               //   if (topic?.isEmpty == true) {
//                               //     return AppLocalizations.of(context)!
//                               //         .enter_your_subject;
//                               //   }
//                               // },
//                               onSaved: (topic) =>
//                               contactUsCubit.contactUsModel.subject = topic ?? "",
//                               borderColor: const Color(0xff95989A),
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             CustomInput(
//                               label: AppLocalizations.of(context)!.text,
//                               hintText: AppLocalizations.of(context)!.text,
//                               borderColor: const Color(0xff95989A),
//                               // validator: (message) {
//                               //   if (message?.isEmpty == true) {
//                               //     return AppLocalizations.of(context)!
//                               //         .enter_your_message;
//                               //   }
//                               // },
//                               onSaved: (message) =>
//                               contactUsCubit.contactUsModel.message = message ?? "",
//                               maxLines: 4,
//                               minLines: null,
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             CustomButton(
//                                 text: AppLocalizations.of(context)!.send,
//                                 isLoading: state is ContactUsLoadingState,
//                                 action: () async {
//                                 //  await contactUsCubit.sendToAdmin();
//                                 }),
//                           ],
//                         ),
//                       ),
//                     )),
//               ));
//         },
//       ),
//     );
//   }
// }
