import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared_components/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(
          title: AppLocalizations.of(context)!.notifications,
          showCartIcon: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.notifications,
              size: 200,
              color: AppColors.APP_MAIN_COLOR,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              AppLocalizations.of(context)!.no_notifications_found,
              style: const TextStyle(fontSize: FontSizes.FONT_SIZE_24),
            )
          ],
        ),
      ),
    ));
  }
}
