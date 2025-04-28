import 'package:classic_eccomerce/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'package:classic_eccomerce/contact_us/presentation/cubit/contact_us_states.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:classic_eccomerce/notifications/presentation/cubit/notifications_states.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../core/constants/paths/icon_paths.dart';
import '../../../core/constants/paths/image_paths.dart';
import '../../../home/presentation/widgets/home_drawer.dart';
import '../../../main.dart';
import '../../../shared_components/custom_input.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const HomeDrawer(),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),

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

                  const Expanded(
                    child: Text(
                      "1575\$" ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(
                    width: 16,
                  ),

                  GestureDetector(
                    onTap: () {},
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
            })),
      ),
      body: BlocProvider(
        create: (context) => NotificationsCubit()..init(),
        child: BlocConsumer<NotificationsCubit, NotificationsStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            NotificationsCubit notificationsCubit =
                NotificationsCubit.get(context);
            var notifications = notificationsCubit.notifications;
            return state is GetAllNotificationsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is GetAllNotificationsNwConnectionFailedState
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: NoNetworkRefreshPage(refresh: () {
                          notificationsCubit.init();
                        }),
                      )
                    : RefreshIndicator(
              onRefresh: ()async{
                notificationsCubit.init();
              },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                          child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.notifications,
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
                                height: 16,
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var notification = notifications?[index];
                                    var title = notification?.title;
                                    var desc = notification?.body;
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      AppColors.APP_PRICE_COLOR),
                                              child: Center(
                                                  child: Image.asset(
                                                IconPaths.EMAIL,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                              )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  title ?? "",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize:
                                                          FontSizes.FONT_SIZE_14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  desc ?? "",
                                                  style: TextStyle(
                                                      fontSize:
                                                          FontSizes.FONT_SIZE_12,
                                                      color: AppColors
                                                          .GREY_SUB_TITLE_COLOR,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )),
                                            // const Text(
                                            //   "Now",
                                            //   style: TextStyle(
                                            //       color: Color(0xff666666),
                                            //       fontSize: FontSizes.FONT_SIZE_12),
                                            // )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: Color(0xff707070),
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemCount: notifications?.length ?? 0)
                            ],
                          ),
                        )),
                    );
          },
        ),
      ),
    ));
  }
}
