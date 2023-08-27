import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/wish_list_item.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(
          title: "My Wish List", showBackButton: false),
      body: ListView.builder(
        padding: const EdgeInsets.only(right: 16,left: 16,bottom: 16,top: 24),
        itemBuilder: (context, index) {
          return const WishListItem();
        },
        itemCount: 7,
      ),
    ));
  }
}
