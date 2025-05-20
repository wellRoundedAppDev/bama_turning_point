
import 'package:flutter/material.dart';

import '../core/constants/paths/image_paths.dart';

class AppNoProductsWidget extends StatelessWidget {
  String title;
  String subTitle;

  AppNoProductsWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          ),
          Image.asset(ImagePaths.APP_LOGO),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subTitle,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}