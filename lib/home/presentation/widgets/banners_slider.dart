import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors/colors.dart';
import '../../data/models/get_slide_shows_response.dart';

class BannersSlider extends StatelessWidget {
  List<BannerAd> bannerAds;

  BannersSlider({super.key, required this.bannerAds});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: HomeCubit.get(context).adsSliderController,
        itemBuilder: (context, index) {
      index = index % bannerAds.length;
      var bannerAd = bannerAds[index];
      String? bannerAdImage = bannerAd.imageOriginal;
      return Image.network(
        bannerAdImage ?? "",
        width: MediaQuery.of(context).size.width,
        errorBuilder: (context, object, stackTrace) {
          return const Icon(
            Icons.error,
            size: 150,
            color: AppColors.APP_MAIN_COLOR,
          );
        },
        fit: BoxFit.cover,
      );
    });
  }
}
