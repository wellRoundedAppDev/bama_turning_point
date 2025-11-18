import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../core/constants/fonts/font_sizes.dart';
import '../core/constants/paths/image_paths.dart';
import '../core/locales/l10n/app_localizations.dart';
import 'custom_button.dart';

class NoNetworkRefreshPage extends StatelessWidget {
  Function()? refresh;
  NoNetworkRefreshPage({super.key, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //SvgPicture.asset(ImagePaths.NO_NETWORK_ILLUSTARTION),
        const SizedBox(
          height: 32,
        ),
         Text(
          AppLocalizations.of(context)!.network_connection_failed,
          style: const TextStyle(
              fontSize: FontSizes.FONT_SIZE_18, color: Color(0xff565656)),
        ),
        const SizedBox(
          height: 8,
        ),
         Text(
          AppLocalizations.of(context)!.check_your_internet_connection_and_try_again_later,
          style: const TextStyle(
              fontSize: FontSizes.FONT_SIZE_14, color: Color(0xff565656)),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(text: AppLocalizations.of(context)!.try_again, action: refresh)
      ],
    );
  }
}
