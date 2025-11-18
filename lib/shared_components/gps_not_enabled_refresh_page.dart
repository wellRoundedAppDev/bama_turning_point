import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/colors/colors.dart';
import '../core/constants/fonts/font_sizes.dart';
import '../core/locales/l10n/app_localizations.dart';
import 'custom_button.dart';

class GPSNotEnabledRefreshPage extends StatelessWidget {
  Function()? refresh;
  GPSNotEnabledRefreshPage({super.key, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //todo add no gps illustration
        const Icon(
          Icons.gps_off,
          color: AppColors.APP_MAIN_COLOR,
          size: 100,
        ),
        //SvgPicture.asset(ImagePaths.NO_NETWORK_ILLUSTARTION),
        // const SizedBox(
        //   height: 32,
        // ),
        //  Text(
        //   AppLocalizations.of(context)!
        //       .please_enable_your_gps_and_try_again,
        //   style: const TextStyle(
        //       fontSize: FontSizes.FONT_SIZE_18, color: Color(0xff565656)),
        // ),
        const SizedBox(
          height: 24,
        ),
        Text(
          AppLocalizations.of(context)!.please_enable_your_gps_and_try_again,
          style: const TextStyle(
              fontSize: FontSizes.FONT_SIZE_14, color: Color(0xff565656)),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
            text: AppLocalizations.of(context)!.try_again, action: refresh)
      ],
    );
  }
}