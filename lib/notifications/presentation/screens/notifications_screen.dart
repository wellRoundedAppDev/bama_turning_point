// import 'package:classic_eccomerce/core/constants/colors/colors.dart';
// import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
// import 'package:classic_eccomerce/notifications/presentation/cubit/notifications_cubit.dart';
// import 'package:classic_eccomerce/notifications/presentation/cubit/notifications_states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// import '../../../shared_components/custom_app_bar.dart';
//
// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NotificationsCubit, NotificationsStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         NotificationsCubit notificationsCubit = NotificationsCubit.get(context);
//         var notifications = notificationsCubit.notifications;
//         return SafeArea(
//             child: Scaffold(
//                 appBar: CustomAppBar.renderAppBar(
//                     title: AppLocalizations.of(context)!.notifications,
//                     showCartIcon: false),
//                 body: (notifications.isEmpty)
//                     ? Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(
//                               Icons.notifications,
//                               size: 200,
//                               color: AppColors.APP_MAIN_COLOR,
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             Text(
//                               AppLocalizations.of(context)!
//                                   .no_notifications_found,
//                               style: const TextStyle(
//                                   fontSize: FontSizes.FONT_SIZE_24),
//                             )
//                           ],
//                         ),
//                       )
//                     : ListView.separated(
//                         padding: const EdgeInsets.all(16),
//                         itemBuilder: (context, index) {
//                           var notification = notifications[index];
//                           return Container(
//                             padding: const EdgeInsets.all(8),
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                     color: const Color(0xffDDDDDD), width: 1)),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   notification.title ?? "",
//                                   textAlign: TextAlign.start,
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: FontSizes.FONT_SIZE_18),
//                                 ),
//                                 Text(
//                                   notification.body ?? "",
//                                   style: TextStyle(
//                                       fontSize: FontSizes.FONT_SIZE_16,
//                                       color: Colors.black.withOpacity(0.3)),
//                                 ),
//                                 const SizedBox(
//                                   height: 4,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Text(
//                                       notification.date ?? "",
//                                       style: TextStyle(
//                                           fontSize: FontSizes.FONT_SIZE_16,
//                                           color: Colors.black.withOpacity(0.3)),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return const SizedBox(
//                             height: 16,
//                           );
//                         },
//                         itemCount: notifications.length)));
//       },
//     );
//   }
// }
